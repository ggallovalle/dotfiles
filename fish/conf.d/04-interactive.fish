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
    
    if [ $TERM != screen -a $TERM != tmux ]
        if tmux has-session -t main
            tmux attach-session -t main
        else
            tmux new-session -s main
        end
    end
    starship init fish | source
end
