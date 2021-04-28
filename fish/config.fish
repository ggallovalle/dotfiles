# [[ fish stuff
fish_vi_key_bindings
function fish_greeting
    # neofetch
    command -q thefuck
    and thefuck --alias | source
    load-component keychain
end
if not test "$SHELL" = /bin/fish
    and not test "$SHELL" = /usr/bin/fish

    msg -w "fish is not the default shell"
end
# END ]]

# [[ stuff that needs to start first
# ALWAYS FIRST
source "$__fish_config_dir/exports.fish"
#
load-component asdf
# END ]]

# [[ components
load-component exa
load-component git
load-component sane-defaults
load-component lua
# END  ]]

# [[ load for specific environmet work | laptop | etc
if test -f $HOME/.in-work.txt
    msg -k "👺 ENV WORK"
    source "$__fish_config_dir/env/work.fish"
else
    msg -k "👺 NO ENV"
end
# END ]]

# [[ this two needs to always be the last two
# Omf needs to be inline in config.fish or it gives some nasty errors
load-component starship
# END ]]
