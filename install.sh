#!/bin/sh
# This script is inspired on the Deno installer: (https://deno.land/x/install@v0.1.4/install.sh)

set -e

os=$(uname -s)
arch=$(uname -m)
#version=${1:-latest}

version=$(curl https://api.github.com/repos/kspacr/kspacr-cli/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | cut -c 2-)
kspacr_url="https://github.com/kspacr/kspacr-cli/releases/download/kspacr-cli_${version}_${os}_${arch}.tar.gz"

install_dir="${kspacr_INSTALL:-$HOME/.kspacr}"
bin_dir="$install_dir/bin"
exe="$bin_dir/kspacr"

if [ ! -d "$bin_dir" ]; then
	mkdir -p "$bin_dir"
fi

curl -q --fail --location --progress-bar --output "$exe.tar.gz" "$kspacr_url"
tar xvf "$exe.tar.gz" -C "$bin_dir"
chmod +x "$exe"
rm "$exe.tar.gz"

echo "kspacr CLI was installed successfully to $exe"
if command -v kspacr >/dev/null; then
	echo "Run 'kspacr --help' to get started"
else
	case $SHELL in
	/bin/zsh) shell_profile=".zshrc" ;;
	*) shell_profile=".bash_profile" ;;
	esac
	echo "Manually add the directory to your \$HOME/$shell_profile (or similar)"
	echo "  export PATH=\"$bin_dir:\$PATH\""
	echo "Run '$exe --help' to get started"
fi