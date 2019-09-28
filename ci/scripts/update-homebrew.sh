#!/bin/bash

set -e
[ -n "$DEBUG" ] && set -x

formula=$1
shift

#
# ci/scripts/update-homebrew.sh - Update homebrew repo for new version of the binary
#
# This script is run from a concourse pipeline (per ci/pipeline.yml).
#
# It is resompsible for bumping the version + shasum in the homebrew-cf repo
# to get the new version of the binary for darwin_amd64.

function auto_sed() {
  cmd=$1
  shift

  if [[ "$(uname -s)" == "Darwin" ]]; then
    sed -i '' -e "$cmd" $@
  else
    sed -i -e "$cmd" $@
  fi
}

echo ">> Retrieving version + sha256 metadata"

VERSION=$(cat recipe/version)
# Allow VERSION to be used in BINARY
BINARY=$(eval echo "${BINARY}")

if [[ -z "${VERSION:-}" ]]; then
  echo >&2 "VERSION not found in `recipe/version`"
  exit 1
fi

if [[ "${FETCH_TGZ_BASE:-X}" != "X" ]]; then
  TAG=$(cat recipe/tag)
  pushd recipe
  fetch_tgz="${FETCH_TGZ_BASE}/${TAG}.tar.gz"
  curl -L $fetch_tgz -O
  BINARY=${TAG}.tar.gz
  popd
fi

# change to the root of the homebrew repo
pushd ${REPO_ROOT}

SHASUM=$(shasum -a 256 ../recipe/${BINARY} | cut -d " " -f1)

echo ">> Updating $formula with new version/shasum"
auto_sed "s/v = \\\".*\\\" # CI Managed/v = \\\"v${VERSION}\\\" # CI Managed/" $formula
auto_sed "s/sha256 \\\".*\\\" # CI Managed/sha256 \\\"${SHASUM}\\\" # CI Managed/" $formula

if [[ "$(git status -s)X" != "X" ]]; then
  set +e
  if [[ -z $(git config --global user.email) ]]; then
    git config --global user.email "drnic+bot@starkandwayne.com"
  fi
  if [[ -z $(git config --global user.name) ]]; then
    git config --global user.name "CI Bot"
  fi

  set -e
  echo ">> Running git operations as $(git config --global user.name) <$(git config --global user.email)>"
  echo ">> Getting back to master (from detached-head)"
  git merge --no-edit master
  git status
  git --no-pager diff
  git add $formula
  git commit -m "Updated $formula from new release"
else
  echo ">> No update needed"
fi
popd

# so that future steps in the pipeline can push our changes
cp -a ${REPO_ROOT} ${REPO_OUT}/homebrew
