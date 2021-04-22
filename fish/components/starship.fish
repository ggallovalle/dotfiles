if command -q starship
    starship init fish | source
else
    msg -w "starship not installed"
end
