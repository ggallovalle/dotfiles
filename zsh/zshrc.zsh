# -------------------- source  --------------------

# -------------------- p10k    --------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# -------------------- core    --------------------

source $ZDOTDIR/core.zsh
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
# -------------------- zsh setopt   ---------------

# changing directories
setopt auto_pushd pushd_silent pushd_ignore_dups autocd
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
    source $ZDOTDIR/zinit.zsh
fi
# -------------------- p10k    -------------------

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
if [[ -f $XDG_CONFIG_HOME/zsh/p10k.zsh ]];then
    source $XDG_CONFIG_HOME/zsh/p10k.zsh
fi
