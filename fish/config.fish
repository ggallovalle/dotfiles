# [[ fish stuff
fish_vi_key_bindings
function fish_greeting
    # neofetch
    command -q thefuck
    and thefuck --alias | source
end
if not test "$SHELL" = /bin/fish; or not test "$SHELL" = /usr/bin/fish
    msg -w "fish is not the default shell"
end
# END ]]

# [[ stuff that needs to start first
function load-component
    # $1 component
    source "$__fish_config_dir/components/$argv[1].fish"
end
load-component asdf
source "$__fish_config_dir/exports.fish"
load-component keychain
# END ]]

# [[ components
load-component exa
load-component git
load-component sane-defaults
# END  ]]

# [[ load for specific environmet work | laptop | etc
if test -f $HOME/.in-work.txt
    source "$__fish_config_dir/env/work.fish"
end
# END ]]

# [[ this two needs to always be the last two
load-component omf
load-component starship
# END ]]
