set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat
set VERGEN_GIT_SHA=v%PKG_VERSION%

cargo install --path %SRC_DIR%/yazi-build --no-track --locked --bins --profile release-windows yazi-build
if %errorlevel% NEQ 0 exit /b %errorlevel%
cargo install --path %SRC_DIR%/yazi-fm --no-track --locked --bins --root %LIBRARY_PREFIX% --profile release-windows yazi-fm
if %errorlevel% NEQ 0 exit /b %errorlevel%
cargo install --path %SRC_DIR%/yazi-cli --no-track --locked --bins --root %LIBRARY_PREFIX% --profile release-windows yazi-cli
if %errorlevel% NEQ 0 exit /b %errorlevel%
cargo-bundle-licenses --format yaml --output %SRC_DIR%/THIRDPARTY.yml
if %errorlevel% NEQ 0 exit /b %errorlevel%
