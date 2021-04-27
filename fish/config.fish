# [[ fish stuff
fish_vi_key_bindings
function fish_greeting
    # neofetch
    command -q thefuck
    and thefuck --alias | source
end
if not test "$SHELL" = /bin/fish
    and not test "$SHELL" = /usr/bin/fish

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
load-component lua
# END  ]]

# [[ load for specific environmet work | laptop | etc
if test -f $HOME/.in-work.txt
    source "$__fish_config_dir/env/work.fish"
end
# END ]]

# [[ this two needs to always be the last two
# Omf needs to be inline in config.fish or it gives some nasty errors
set -x OMF_CONFIG "$__fish_config_dir/omf"
set -x OMF_PATH "$XDG_DATA_HOME/omf"
# Load Oh My Fish configuration.
test -d $OMF_PATH
or git clone https://github.com/oh-my-fish/oh-my-fish $OMF_PATH
source $OMF_PATH/init.fish
load-component starship
# END ]]
