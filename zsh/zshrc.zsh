#  ________
# < source >
#  --------
#   \     .    _  .
#    \    |\_|/__/|
#        / / \/ \  \
#       /__|O||O|__ \
#      |/_ \_/\_/ _\ |
#      | | (____) | ||
#      \/\___/\__/  //
#      (_/         ||
#       |          ||
#       |          ||\
#        \        //_/
#         \______//
#        __ || __||
#       (____(____)
#  ____________
# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# core
source $ZDOTDIR/core.zsh
# asdf
if [[ -f $HOME/.asdf/asdf.sh ]];then
    source $HOME/.asdf/asdf.sh
    javahome=$HOME/.asdf/plugins/java/set-java-home.zsh
    dotnethome=$HOME/.asdf/plugins/dotnet-core/set-dotnet-home.zsh
    [[ -f $dotnethome ]] && {
        source $dotnethome
        export MSBuildSDKsPath=/home/kbroom/.asdf/installs/dotnet-core/3.1.403/sdk/3.1.403/Sdks
    }
    [[ -f $javahome ]] && source $javahome
    unset javahome dotnethome
    fpath+=(${ASDF_DIR}/completions)
fi
# tabtab
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && source ~/.config/tabtab/zsh/__tabtab.zsh
# broot
if [[ -f $XDG_CONFIG_HOME/broot/launcher/bash/br ]]; then
    source $XDG_CONFIG_HOME/broot/launcher/bash/br
    alias broot='br'
fi
# < zsh setopt >
#  ------------ 
#         \    ,-^-.
#          \   !oYo!
#           \ /./=\.\______
#                ##        )\/\
#                 ||-----w||
#                 ||      ||
#
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
# < zinit >
#  ------- 
#    \
#     \
#         .--.
#        |o_o |
#        |:_/ |
#       //   \ \
#      (|     | )
#     /'\_   _/`\
#     \___)=(___/
#
if [[ -r $HOME/.zinit/bin/zinit.zsh ]]; then
    source $HOME/.zinit/bin/zinit.zsh
    unalias zini zpl zplg zi # unalias the default alias for zinit
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
    # ----------------- anenexes ----------------------
    zinit light-mode for \
        zinit-zsh/z-a-rust \
        zinit-zsh/z-a-as-monitor \
        zinit-zsh/z-a-patch-dl \
        zinit-zsh/z-a-bin-gem-node \
        zinit-zsh/z-a-submods
    source $ZDOTDIR/zinit.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ -f $XDG_CONFIG_HOME/zsh/p10k.zsh ]] && source $XDG_CONFIG_HOME/zsh/p10k.zsh
