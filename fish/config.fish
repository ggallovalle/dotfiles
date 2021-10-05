# NOTE As we've explained, autoload files are loaded by name, so, while you can put 
# multiple functions into one file, the file will only be loaded automatically once
# you try to execute the one that shares the name.


# if not test "$SHELL" = /bin/fish
#     and not test "$SHELL" = /usr/bin/fish

#     msg -w "fish is not the default shell"
# end

# command -q thefuck
# and thefuck --alias | source

# NOTE Load function information so it shows up in auto completion
# load-em # this significatly slows down the sehll

#ssh
# if command -q keychain
#     # TODO make everything in an array and eval only once
#     test -f $HOME/.ssh/id_rsa
#     and keychain --quiet --eval id_rsa | source
# else
#     msg -w "keychain not installed"
# end


function fish_greeting
    # neofetch
end


# [[ this two needs to always be the last two
# Omf needs to be inline in config.fish or it gives some nasty errors, sometimes
# set -x OMF_CONFIG "$__fish_config_dir/omf"
# set -x OMF_PATH "$XDG_DATA_HOME/omf"
# test -d $OMF_PATH
# or git clone https://github.com/oh-my-fish/oh-my-fish $OMF_PATH
# source $OMF_PATH/init.fish

# if command -q starship
# else
#     msg -w "starship not installed"
# end
# END ]]

if status --is-interactive
    fish_vi_key_bindings
    thefuck --alias | source
    keychain --quiet --eval id_rsa | source
    starship init fish | source
end
