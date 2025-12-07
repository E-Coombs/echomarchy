#!/bin/bash

# Install Chromium extensions using policies
# This installs Bitwarden and uBlock Origin automatically

CHROMIUM_POLICIES_DIR="/etc/chromium/policies/managed"
CHROMIUM_EXTENSIONS_FILE="$CHROMIUM_POLICIES_DIR/extensions.json"

# Policies directory should already be created by theme.sh, but ensure it exists
if [[ ! -d "$CHROMIUM_POLICIES_DIR" ]]; then
  sudo mkdir -p "$CHROMIUM_POLICIES_DIR"
  sudo chmod a+rw "$CHROMIUM_POLICIES_DIR"
fi

# Create extensions.json with extension settings
# Extension IDs from Chrome Web Store:
# - uBlock Origin: cjpalhdlnbpafiamejdnhcphjbkeiagm
# - Bitwarden: nngceckbapebfimnlniacheglhbhibnj
cat << 'EOF' > "$CHROMIUM_EXTENSIONS_FILE"
{
  "ExtensionInstallForcelist": [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx",
    "nngceckbapebfimnlniacheglhbhibnj;https://clients2.google.com/service/update2/crx"
  ]
}
EOF

echo "Chromium extensions policy installed. uBlock Origin and Bitwarden will be automatically installed on next Chromium launch."
