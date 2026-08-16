#!/usr/bin/env bash

set -euxo pipefail
export CARGO_PROFILE_RELEASE_STRIP=symbols
export CARGO_PROFILE_RELEASE_LTO=fat
export VERGEN_GIT_SHA="v${PKG_VERSION}"

cargo install --path "${SRC_DIR}/yazi-build" --no-track --locked --bins yazi-build
cargo install --path "${SRC_DIR}/yazi-fm" --no-track --locked --bins --root "${PREFIX}" yazi-fm
cargo install --path "${SRC_DIR}/yazi-cli" --no-track --locked --bins --root "${PREFIX}" yazi-cli
cargo-bundle-licenses --format yaml --output "${SRC_DIR}/THIRDPARTY.yml"
