#!/bin/bash -e
CROSSTOOL_SRC=https://github.com/crosstool-ng/crosstool-ng/archive/185f3483e0e5028357b131fb97c4331551a70a1e.tar.gz

WORKDIR=$(mktemp -d)
cleanup() {
  echo "Cleaning up..."
  rm -rf "$WORKDIR"
}
trap cleanup EXIT

cd "$WORKDIR"
curl -fsSL "$CROSSTOOL_SRC" | tar -xz --strip-components=1
./bootstrap
./configure "$@"
make
make install
