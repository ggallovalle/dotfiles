function php() {
    case "$1" in
        pm) shift;php.pm "$@";;
        la) shift;php.la "$@";;
        repl)   shift;command php --interactive "$@";;
        cmd)
            +zinit-message "{info3}Php related commands.{rst}"
            +zinit-message "{cmd}cmd{rst} -> {obj}this info msg{rst}"
            +zinit-message "{cmd}pm{rst} -> {obj}composer{rst}"
            +zinit-message "{cmd}la{rst} -> {obj}laravel{rst}"
            +zinit-message "{cmd}repl{rst} -> {obj}repl{rst}"
            ;;
        *)
            command php "$@";;
    esac
}
