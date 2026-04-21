function ex() {
    local cmd="$1" pm=mix pkg=$(find-up mix.exs) \
    pkgconf="$pgk"/mix.exs pkgdepsdir="$pkg"/deps
    # initialization
    shift

    case "$cmd" in
    # bin) ;;
    docs)
        if [[ -z $1 ]]; then
            "$pm" hex.docs online elixir &>/dev/null
        elif [[ "$1" != fetch || "$1" != offline ]]; then
            "$pm" hex.docs online "$@" &>/dev/null
        else
            "$pm" hex.docs "$@"
        fi
        ;;
    # fmt) ;;
    # lint) ;;
    repl) iex "$@" ;;
    script) elixir "$@" ;;
    # search) ;;
    surf) xdg-open 'https://hex.pm/' &>/dev/null ;;
    # test) ;;

    # frameworks
    px) "$pm" phx "$@" ;;
    px:start) "$pm" phx.server "$@" ;;

    # package manager
    pm) "$pm" "$@" ;;
    # pm:init) ;;
    # pm:ad | pm:add) ;;
    # pm:adD | pm:add-dev) ;;
    # pm:rm | pm:remove) ;;
    # pm:rmD | pm:remove-dev) ;;
    pm:in | pm:install) "$pm" deps.get "$@" ;;
    # pm:un | pm:uninstall) ;;
    # pm:ls | pm:list) ;;
    # pm:lsD | pm:list-dev) ;;
    *) elixir "$@" ;;
    esac
}
