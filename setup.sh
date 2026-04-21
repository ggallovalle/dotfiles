#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MACHINE_DIR="${SCRIPT_DIR}/machines/wsl-arch"
CONFIG_DIR="${HOME}/.config/chezmoi"
DOTFILES_DIR="$(dirname "${SCRIPT_DIR}")"

echo "Setting up dotfiles..."
echo "  Machine config: ${MACHINE_DIR}"
echo "  Config dir: ${CONFIG_DIR}"

mkdir -p "${CONFIG_DIR}"

ln -sf "${MACHINE_DIR}/chezmoi.yaml" "${CONFIG_DIR}/chezmoi.yaml"

if [ -f "${MACHINE_DIR}/casa.yaml" ]; then
    ln -sf "${MACHINE_DIR}/casa.yaml" "${CONFIG_DIR}/casa.yaml"
fi

echo "Done! chezmoi is configured to use ${DOTFILES_DIR}/dots as sourceDir"
echo ""
echo "To apply your dotfiles, run:"
echo "  chezmoi apply"
