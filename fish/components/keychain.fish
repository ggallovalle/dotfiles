if command -q keychain
    # TODO make everything in an array and eval only once
    test -f $HOME/.ssh/contollo_rsa
    and keychain --quiet --eval contollo_rsa | source
    test -f $HOME/.ssh/id_rsa
    and keychain --quiet --eval id_rsa | source
else
    msg -w "keychain not installed"
end
