#!/bin/bash

set -exc

echo "${GPG_ID:?required}" > ${REPO_OUT:?required}/id
echo "${GPG_PUBLIC_KEY:?required}" > $REPO_OUT/public.key
set +x
echo "${GPG_PRIVATE_KEY:?required}" > $REPO_OUT/private.key
