# Install all base packages
mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/omarchy-base.packages" | grep -v '^$')

# Filter out packages that are already installed to avoid version conflicts
to_install=()
for pkg in "${packages[@]}"; do
    if ! pacman -Q "$pkg" &>/dev/null; then
        # Package not installed, add it
        to_install+=("$pkg")
    fi
done

if [ ${#to_install[@]} -gt 0 ]; then
    sudo pacman -S --noconfirm --needed "${to_install[@]}"
else
    echo "All base packages are already installed"
fi
