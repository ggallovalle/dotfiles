#!/bin/bash
DIR=$(dirname "$0")

NERDFONT_RELEASE=v2.1.0
if [[ -z "$XDG_DATA_HOME" ]]; then
    XDG_DATA_HOME="$HOME/.local/share"
fi

if [[ ! -d "$XDG_DATA_HOME/fonts" ]]; then
    mkdir -p "$XDG_DATA_HOME/fonts"
fi

cd "$XDG_DATA_HOME/fonts" || exit 1
fonts=(JetBrainsMono FantasqueSansMono Meslo SourceCodePro FiraCode)
for f in "${fonts[@]}"; do
    if [[ ! -d $f ]]; then
        if curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/download/$NERDFONT_RELEASE/$f.zip"; then
            unzip "$f.zip" -d "$f"
        fi
    fi
    echo "$f -> $XDG_DATA_HOME/fonts/$f"
done

zipped=($(find ./ -maxdepth 1 -name "*.zip"))
if [ ${#zipped[@]} -gt 0 ]; then 
    echo "Do you want to clean zip files? [y/N]"
    read -r answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        for z in "${zipped[@]}"; do
            rm "$z"
            echo "DELETED $z"
        done
    fi
fi
