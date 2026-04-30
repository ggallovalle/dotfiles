alias src='clear; exec zsh'
alias ..='cd ..'
alias ...='cd ../..'
alias rmr='rm -r'
alias rmrf='rm -rf'
alias cp='cp -i'
alias cpr='cp -ri'

if (( ${+commands[eza]} )); then
  export EZA_STRICT=1
  alias ls='eza --group-directories-first --git-ignore'
  alias la='eza -A --group-directories-first --git-ignore'
  alias laa='eza -A --group-directories-first'
  alias ll='eza -lh --no-user --time-style=iso --group-directories-first --git --git-repos --git-ignore'
  alias lla='eza -lhA --no-user --time-style=iso --group-directories-first --git --git-repos --git-ignore'
  alias llaa='eza -lhA --no-user --time-style=iso --group-directories-first --git --git-repos'
  alias ld='eza -d --git'
  alias lt='eza --git-ignore -TL 3'
  alias lta='eza -ATL 3 --git-ignore'
  alias ltaa='eza -ATL 3'
fi

if (( ${+commands[bat]} )); then
  alias cat='bat'
fi

if (( ${+commands[rg]} )); then
  alias grep='rg'
fi

if (( ${+commands[paru]} )); then
  alias pmi='paru -S --noconfirm --needed --noprogressbar'
fi

if (( ${+commands[bun]} )); then
  alias br='bun run'
  alias brc='bun run check'
  alias brl='bun run lint'
  alias brt='bun run test'
  alias brb='bun run bench'
  alias brg='bun run codegen'
fi

if (( ! ${+commands[zed]} )) && [[ -x /mnt/c/Users/kbroom/AppData/Local/Programs/Zed/bin/zed ]]; then
  alias zed='/mnt/c/Users/kbroom/AppData/Local/Programs/Zed/bin/zed'
fi
