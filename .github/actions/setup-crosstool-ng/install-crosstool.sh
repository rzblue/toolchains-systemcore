#!/bin/bash -e
CROSSTOOL_NG_VERSION="${CROSSTOOL_NG_VERSION:-1.28.0}"
CROSSTOOL_SRC="https://github.com/crosstool-ng/crosstool-ng/releases/download/crosstool-ng-${CROSSTOOL_NG_VERSION}/crosstool-ng-${CROSSTOOL_NG_VERSION}.tar.xz"

WORKDIR=$(mktemp -d)
cleanup() {
  echo "Cleaning up..."
  rm -rf "$WORKDIR"
}
trap cleanup EXIT

cd "$WORKDIR"
curl -fsSL "$CROSSTOOL_SRC" | tar -xJ --strip-components=1
./configure "$@"
make
make install
