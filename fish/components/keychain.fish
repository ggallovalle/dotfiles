if command -q keychain
    test -f $HOME/.ssh/github_ggallovalle
    and keychain --quiet --eval github_ggallovalle --eval id_rsa | source
    test -f $HOME/.ssh/id_rsa
    and keychain --quiet --eval id_rsa | source
else
    msg -w "keychain not installed"
end
