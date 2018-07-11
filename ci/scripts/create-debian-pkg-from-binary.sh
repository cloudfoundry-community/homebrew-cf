#!/bin/bash

set -e
[ -n "$DEBUG" ] && set -x

#
# ci/scripts/create-debian-pkg-from-binary.sh - Create .deb package
#
# This script is run from a concourse pipeline (per ci/pipeline.yml).
#

echo ">> Retrieving version metadata"

VERSION=$(cat recipe/version)
if [[ -z "${VERSION:-}" ]]; then
  echo >&2 "VERSION not found in `recipe/version`"
  exit 1
fi
# strip any non numbers; https://github.com/stedolan/jq/releases tag is "jq-1.5"
VERSION=$(echo $VERSION | sed "s/^[a-z\-]*//")
# pivnet versions might look like 1.0.0#2018-02-15T14:57:14.495Z
VERSION=$(echo $VERSION | sed "s/#.*//")

mkdir -p certs
echo "${GPG_ID:?required}" > certs/id
echo "${GPG_PUBLIC_KEY:?required}" > certs/public.key
set +x
echo "${GPG_PRIVATE_KEY:?required}" > certs/private.key
[ -n "$DEBUG" ] && set -x

echo ">> Setup GPG public key"
gpg --import certs/public.key
echo ">> Setup GPG private key"
gpg --allow-secret-key-import --import certs/private.key
echo ">> List keys"
gpg --list-secret-keys

echo ">> Creating Debian package"
if [[ ! -x fpm ]]; then
  gem install fpm --no-ri --no-rdoc
fi
if [[ ${IN_BINARY_PREFIX_TGZ:-X} != "X" ]]; then
  cd recipe
  tar xfz $IN_BINARY_PREFIX_TGZ*tgz
  IN_BINARY=$(ls **/*/$IN_BINARY_AFTER_UNPACK)
  cd -
fi
if [[ ${IN_BINARY_PREFIX_ZIP:-X} != "X" ]]; then
  cd recipe
  unzip $IN_BINARY_PREFIX_ZIP*zip
  IN_BINARY=${IN_BINARY_AFTER_UNPACK:-$OUT_BINARY}
  cd -
fi
if [[ ${IN_BINARY_PREFIX_GZ:-X} != "X" ]]; then
  cd recipe
  gunzip $IN_BINARY_PREFIX_GZ*gz
  IN_BINARY=${IN_BINARY_AFTER_UNPACK:-$OUT_BINARY}
  cd -
fi

recipe_binaries=
provides=
for binary in $OUT_BINARY; do
  if [[ "recipe/${IN_BINARY}" != "recipe/${binary}" ]]; then
    cp recipe/${IN_BINARY} recipe/${binary}
  fi
  chmod +x recipe/${binary}
  recipe_binaries="${recipe_binaries} recipe/${binary}=/usr/bin/${binary} "
  provides="${provides} --provides ${binary} "
done

fpm -s dir -t deb -n "${NAME:?required}" -v "${VERSION}" \
  --vendor "${VENDOR:-Unknown}" \
  --license "${LICENSE:-Unknown}" \
  -m "${MAINTAINERS:-Unknown}" \
  --description "${DESCRIPTION:-Unknown}" \
  --url "${URL:-Unknown}" \
  --deb-use-file-permissions \
  --deb-no-default-config-files ${FPM_FLAGS:-} \
  $provides \
  $recipe_binaries

DEBIAN_FILE="${NAME}_${VERSION}_amd64.deb"

echo ">> Uploading Debian package to APT repository"
if [[ ! -x deb-s3 ]]; then
  gem install deb-s3 --no-ri --no-rdoc
fi

mkdir ~/.aws
cat > ~/.aws/credentials <<EOF
[default]
aws_access_key_id = ${AWS_ACCESS_KEY:?required}
aws_secret_access_key = ${AWS_SECRET_KEY:?required}
EOF
deb-s3 upload "${DEBIAN_FILE}" --bucket "${RELEASE_BUCKET}" --sign $(cat certs/id) --gpg-options='--digest-algo SHA256'

echo ">> Latest debian package list"
deb-s3 list -b "${RELEASE_BUCKET}"
