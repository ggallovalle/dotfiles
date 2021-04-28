if not test "$SHELL" = /bin/fish
    and not test "$SHELL" = /usr/bin/fish

    msg -w "fish is not the default shell"
end
