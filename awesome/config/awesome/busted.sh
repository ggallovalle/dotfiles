suite=$@
suite=lua/randr/

./lua_modules/bin/busted \
    -m "./lua/?.lua;./lua/?/?.lua;./ lua/?/init.lua" \
    "$suite"
