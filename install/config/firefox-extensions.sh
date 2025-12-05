#!/bin/bash

# Install Firefox extensions using policies
# This installs Bitwarden and uBlock Origin automatically

FIREFOX_POLICIES_DIR="/etc/firefox/policies"
FIREFOX_POLICIES_FILE="$FIREFOX_POLICIES_DIR/policies.json"

# Create policies directory if it doesn't exist
if [[ ! -d "$FIREFOX_POLICIES_DIR" ]]; then
  sudo mkdir -p "$FIREFOX_POLICIES_DIR"
fi

# Create policies.json with extension settings
cat << 'EOF' | sudo tee "$FIREFOX_POLICIES_FILE" > /dev/null
{
  "policies": {
    "ExtensionSettings": {
      "uBlock0@raymondhill.net": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
      },
      "{446900e4-71c2-419f-a6a7-df9c091e268b}": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi"
      }
    }
  }
}
EOF

echo "Firefox extensions policy installed. uBlock Origin and Bitwarden will be automatically installed on next Firefox launch."
