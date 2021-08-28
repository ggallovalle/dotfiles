# NOTE As we've explained, autoload files are loaded by name, so, while you can put 
# multiple functions into one file, the file will only be loaded automatically once
# you try to execute the one that shares the name.
fish_vi_key_bindings

if not test "$SHELL" = /bin/fish
    and not test "$SHELL" = /usr/bin/fish

    msg -w "fish is not the default shell"
end

function fish_greeting
    # neofetch
    command -q thefuck
    and thefuck --alias | source
    # NOTE Load function information so it shows up in auto completion
    # load-em # this significatly slows down the sehll

    #ssh
    if command -q keychain
        # TODO make everything in an array and eval only once
        test -f $HOME/.ssh/id_rsa
        and keychain --quiet --eval id_rsa | source
    else
        msg -w "keychain not installed"
    end
end


#sane defaults
alias grubup="sudo update-grub"
alias untar='tar -zxvf '
alias wget='wget -c '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# [[ this two needs to always be the last two
# Omf needs to be inline in config.fish or it gives some nasty errors, sometimes
set -x OMF_CONFIG "$__fish_config_dir/omf"
set -x OMF_PATH "$XDG_DATA_HOME/omf"
test -d $OMF_PATH
or git clone https://github.com/oh-my-fish/oh-my-fish $OMF_PATH
source $OMF_PATH/init.fish
if command -q starship
    starship init fish | source
else
    msg -w "starship not installed"
end
# END ]]
