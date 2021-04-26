if command -q luarocks
    eval (luarocks path)
else
    msg -w "luarocks not installed"
end
