# -------------------- zsh setopt   ---------------
# changing directories
setopt auto_pushd pushd_silent pushd_ignore_dups
# expansion and globing
# setopt complete_aliases
# history
setopt extended_history share_history hist_expiredups_first hist_ignore_dups \
  hist_ignore_space hist_verify
# input/output
setopt correct interactive_comments
# prompting
setopt prompt_subst
# zle
setopt vi
# ----------------- alias      --------------------

alias src='clear; exec zsh'
alias cp='cp -i'
alias cpr='cp -ri'
alias ..='cd ..'
alias ...='cd ../..'
alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'
alias grep='grep --color'
alias inotify='sudo sysctl fs.inotify.max_user_watches=35000'
alias xclip='xclip -selection clipboard'
alias copy='xclip -selection clipboard'
alias e='nvim'
alias rmr='rm -r'
alias rmrf='rm -rf'
if [[ -f ~/.alias.zsh ]]; then
  function alias-new() {
    local alias_name=$1 alias_cmd=$2
    echo "alias "$1"='"$2"'" >>~/.alias.zsh
    clear
    exec zsh
  }

  function alias-lastcmd() {
    local alias_cmd="$(fc -ln -1)"
    dump-alias "$1" "$alias_cmd"
  }

  alias alias-bat='bat ~/.alias.zsh'
  source ~/.alias.zsh
fi
# ----------------- functions    ------------------

function backup() {
  cp -r $1 $1.bak
}

function mkcd() {
  mkdir -p $1
  cd $1
}

function cexa() {
  cd $1
  exa
}

function find-up() {
  local found=$(pwd)
  while [[ -n "$found" && ! -e "$found/$1" ]]; do
    found=${found%/*}
  done
  if [[ -z "$found" ]]; then
    return 1
  fi
  echo "$found"
}

function find-base-path() {
  echo "$(
    cd "$(dirname "$1")"
    pwd -P
  )/$(basename "$1")"
}

function cp-lastcmd() {
  fc -ln -1 | xclip -selection clipboard
}
# ----------------- source     --------------------

fpath=("$ZDOTDIR/completions" $fpath)
for plugin in $ZDOTDIR/plugins/* $ZDOTDIR/langs/* $ZDOTDIR/langs/**/*; do
  source "$plugin"
done
if command -v thefuck &>/dev/null; then
  eval $(thefuck --alias)
fi
# -------------------- asdf    --------------------

export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf
if [[ -d $ASDF_DATA_DIR ]]; then
  source $ASDF_DATA_DIR/asdf.sh
  javahome=$ASDF_DATA_DIR/plugins/java/set-java-home.zsh
  dotnethome=$ASDF_DATA_DIR/plugins/dotnet-core/set-dotnet-home.zsh
  if [[ -f $dotnethome ]]; then
    source $dotnethome
    # export MSBuildSDKsPath=/home/kbroom/.asdf/installs/dotnet-core/3.1.403/sdk/3.1.403/Sdks
  fi
  if [[ -f $javahome ]]; then
    source $javahome
  fi
  unset javahome dotnethome
  fpath+=(${ASDF_DATA_DIR}/completions)
fi
# -------------------- tabtab  --------------------

if [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]]; then
  source ~/.config/tabtab/zsh/__tabtab.zsh
fi
# -------------------- broot   --------------------

if [[ -f $XDG_CONFIG_HOME/broot/launcher/bash/br ]]; then
  source $XDG_CONFIG_HOME/broot/launcher/bash/br
  alias broot='br'
fi
# -------------------- zinit    -------------------

declare -A ZINIT
ZINIT[BIN_DIR]=$XDG_DATA_HOME/zinit/bin
ZINIT[HOME_DIR]=$XDG_DATA_HOME/zinit
if [[ -d $ZINIT[BIN_DIR] ]]; then
  source $ZINIT[BIN_DIR]/zinit.zsh
  unalias zini zpl zplg zi # unalias the default alias for zinit
  autoload -Uz _zinit
  if (( ${+_comps} )); then 
  _comps[zinit]=_zinit
  fi
  # # annexes
  zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
    zinit-zsh/z-a-submods
  source $ZDOTDIR/zinit/zinit.zsh
fi
# -------------------- p10k    -------------------

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# if [[ -f $XDG_CONFIG_HOME/zsh/p10k.zsh ]];then
#     source $XDG_CONFIG_HOME/zsh/p10k.zsh
# fi
# -------------------- bindkeys  -----------------

# -------------------- vi mode  ------------------
zmodload zsh/complist
# export KEYTIMEOUT=1
# # Change cursor shape for different vi modes.
# function zle-keymap-select() {
#   if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#     [[ ${KEYMAP} == viins ]] ||
#     [[ ${KEYMAP} = '' ]] ||
#     [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#   zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#   echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q'                # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q'; } # Use beam shape cursor for each new prompt.
autoload edit-command-line
zle -N edit-command-line
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' rehash true
compinit
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey '^e' edit-command-line
bindkey '^[[P' delete-char

# -------------------- starship theme--------------
eval "$(starship init zsh)"

