#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${HOME}/.config/chezmoi"
DOTFILES_DIR="$(cd "${SCRIPT_DIR}/../../" && pwd)"

echo "Setting up dotfiles..."
echo "  Machine config: ${SCRIPT_DIR}"
echo "  Config dir: ${CONFIG_DIR}"

mkdir -p "${CONFIG_DIR}"

ln -sf "${SCRIPT_DIR}/chezmoi.yaml" "${CONFIG_DIR}/chezmoi.yaml"

if [ -f "${SCRIPT_DIR}/casa.yaml" ]; then
    ln -sf "${SCRIPT_DIR}/casa.yaml" "${CONFIG_DIR}/casa.yaml"
fi

echo "Done! chezmoi is configured to use ${DOTFILES_DIR}/dots as sourceDir"
echo ""
echo "To apply your dotfiles, run:"
echo "  chezmoi apply"