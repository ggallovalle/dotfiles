# -*- mode: sh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# Copyright (c) 2025 Gerson Gallo
# According to the Zsh Plugin Standard:
# https://wiki.zshell.dev/community/zsh_plugin_standard
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"
# Then ${0:h} to get plugin's directory
if [[ ${zsh_loaded_plugins[-1]} != */kbroom && -z ${fpath[(r)${0:h}]} ]] {
  fpath+=( "${0:h}" )
}
# Standard hash for plugins, to not pollute the namespace
typeset -gA Plugins
Plugins[KBROOM_DIR]="${0:h}"
# autoload -Uz example-script

source "${Plugins[KBROOM_DIR]}/zshenv.zsh"
# echo 'from _local---kbrom/kbroom.plugin.zsh';
source "${Plugins[KBROOM_DIR]}/generate-completions.zsh"
# at the end do on your own:


# create functions directory and add the functions there
# then
# autoload -Uz function-name
# example:
# file: functions/kbroom
#!/usr/bin/env zsh
# local args=("$@")
# local arg_count=$#
# echo "This is an example function"
# echo "You passed in the following arguments(${arg_count}): ${args[*]}"

# autoload -Uz function-name
# also take inspiration from example-script

autoload -Uz zsh-inspect
autoload -Uz remember

source "${Plugins[KBROOM_DIR]}/alias.zsh"
source "${Plugins[KBROOM_DIR]}/zinit-plugins.zsh"
source "${Plugins[KBROOM_DIR]}/interactive.zsh"

_target="${Plugins[KBROOM_DIR]}/zoxide.zsh"
if (( ${+commands[zoxide]} )) && [[ ! -e "${_target}" ]]; then
    echo "'zoxide' generate evaluator"
    zoxide init zsh > "${_target}"
fi

source "${_target}"

# Use alternate vim marks [[[ and ]]] as the original ones can
# confuse nested substitutions, e.g.: ${${${VAR}}}
# vim:ft=zsh:tw=120:sw=2:sts=2:et:foldmarker=[[[,]]]
