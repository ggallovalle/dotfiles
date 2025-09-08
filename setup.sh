#!/usr/bin/env bash
# fail in case any of the commands fails
set -e
dotfiles=${DOTFILES:-$HOME/.dotfiles}
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
data=${XDG_DATA_HOME:-$HOME/.local/share}

error(){ echo -e "$RED--------------- $* ---------------$NC";  }
positive(){ echo -e "$GREEN--------------- $* ----------------$NC";  }
info(){ echo -e "$YELLOW--------------- $* ----------------$NC";  }

installer(){
    local cmd="$1" package="$2"
    if ! command -v "$cmd" &> /dev/null; then
        info installing "$package"
        paru -Si "$package"
        paru -S "$package"
    else
        positive "$package" already installed
    fi
}
clonner() {
    if [[ ! -d "$3" ]]; then
        info cloning "$1"
        git clone "${@:2}"
    else
        positive "$1" already cloned
    fi
}


clonner zinit https://github.com/zdharma/zinit.git "$data/zinit/bin"

clonner "asdf" https://github.com/asdf-vm/asdf.git "$data/asdf"
if [[ ! -d "$data/asdf" ]]; then
    cd "$data/asdf"
    git checkout "$(git describe --abbrev=0 --tags)"
    cd -
    "$data/asdf/bin/asdf" plugin-add nodejs https://github.com/ggallovalle/asdf-nodejs
    info setting up gpg keys for nodejs
    bash -c "$data/asdf/plugins/nodejs/bin/import-release-team-keyring"
fi

if [[ $SHELL = "/bin/bash" ]]; then
    info change default shell from bash to zsh
    chsh -s "$(which zsh)"
fi

if [[ ! -d "$data/fonts" ]]; then
    info downloading fonts
    cd "$data/fonts"
    curl -O https://srv-store6.gofile.io/download/wzom5C/fonts.zip
    unzip fonts.zip
    rm fonts.zip
    cd -
fi

installer cowsay cowsay
cowsay -p OK
