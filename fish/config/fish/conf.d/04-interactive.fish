function fish_greeting
end

if status --is-interactive

    # if [ -d ]
    #     source $OMF_PATH/init.fish
    # else
    #     git clone https://github.com/oh-my-fish/oh-my-fish $OMF_PATH
    # end

    fish_vi_key_bindings
    thefuck --alias | source
    keychain --quiet --eval id_rsa | source
    
    starship init fish | source
end
