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
alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'
alias grep='grep --color'
alias inotify='sudo sysctl fs.inotify.max_user_watches=35000'
alias xclip='xclip -selection clipboard'
alias copy='xclip -selection clipboard'
# ----------------- functions    ------------------

function rm() {
  if git status &> /dev/null; then
    git rm "$@"
  else
    command rm "$@"
  fi
}

function mv() {
  if git status &> /dev/null; then
    git mv "$@"
  else
    command mv "$@"
  fi
}

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
# ----------------- source     --------------------

fpath+="$ZDOTDIR/completions"
for f in $ZDOTDIR/plugins/* $ZDOTDIR/langs/* $ZDOTDIR/langs/**/*; do
  source $f
done
if command -v thefuck&>/dev/null; then
    eval $(thefuck --alias)
fi
# -------------------- p10k    --------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# -------------------- asdf    --------------------

if [[ -d $ASDF_DATA_DIR ]];then
    source $ASDF_DATA_DIR/asdf.sh
    javahome=$ASDF_DATA_DIR/plugins/java/set-java-home.zsh
    dotnethome=$ASDF_DATA_DIR/plugins/dotnet-core/set-dotnet-home.zsh
    if [[ -f $dotnethome ]];then
        source $dotnethome
        # export MSBuildSDKsPath=/home/kbroom/.asdf/installs/dotnet-core/3.1.403/sdk/3.1.403/Sdks
    fi
    if [[ -f $javahome ]];then
        source $javahome
    fi
    unset javahome dotnethome
    fpath+=(${ASDF_DATA_DIR}/completions)
fi
# -------------------- tabtab  --------------------

if [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]];then
    source ~/.config/tabtab/zsh/__tabtab.zsh
fi
# -------------------- broot   --------------------

if [[ -f $XDG_CONFIG_HOME/broot/launcher/bash/br ]]; then
    source $XDG_CONFIG_HOME/broot/launcher/bash/br
    alias broot='br'
fi
# -------------------- zinit    -------------------

if [[ -d $ZINIT[BIN_DIR] ]]; then
    source $ZINIT[BIN_DIR]/zinit.zsh
    unalias zini zpl zplg zi # unalias the default alias for zinit
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
    # annexes
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
if [[ -f $XDG_CONFIG_HOME/zsh/p10k.zsh ]];then
    source $XDG_CONFIG_HOME/zsh/p10k.zsh
fi
# -------------------- bindkeys  -----------------

bindkey -s ^t 'taskwarrior-tui^M'
# -------------------- vi mode  ------------------
zmodload zsh/complist
export KEYTIMEOUT=1
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
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
