function js() {
    local cmd="$1" pm=npm
    if [[ -n $(find-up pnpm-lock.yaml) ]]; then
        pm=pnpm
    elif [[ -n $(find-up yarn.lock) ]]; then
        pm=yarn
    fi
    shift

    case "$cmd" in
    # others
    # TODO bin
    docs) npm docs "$@" ;;
    # TODO fmt
    # TODO lint
    repl) command node "$@" ;;
    script) command node "$cmd" "$@" ;;
    search) npm search "$@" ;;
    # TODO test

    # pnpm/yarn/npm
    pm) "$pm" "$@" ;;
    pm:ad | pm:add) "$pm" add "$@" ;;
    pm:adD | pm:add-dev) "$pm" add -D "$@" ;;
    pm:init) "$pm" init ;;
    pm:in | pm:install) "$pm" install ;;
    pm:un | pm:uninstall)
        local pkg=$(find-up package.json)
        if [[ -z $pkg ]]; then
            +zinit-message "{info3}Not inside a {uname}Node{info3} project.{rst}"
            return 1
        fi
        read -q '? Yes/No: '
        echo
        if [[ $REPLY = y ]]; then
            if [[ -d $pgk/node_modules ]]; then
                rm -r $pkg/node_modules
            fi
            +zinit-message "{st}node_modules{rst}"
        fi
        ;;
    pm:ls | pm:list)
        if [[ $pm = pnpm ]]; then
            pnpm list -P --color $@ | sed "/not saved/Q"
        else
            jq .dependencies package.json
        fi
        ;;
    pm:lsD | pm:list-dev)
        if [[ $pm = pnpm ]]; then
            pnpm list -D --color $@ | sed "/not saved/Q"
        else
            jq .devDependencies package.json
        fi
        ;;
    pm:rm | pm:remove) "$pm" remove "$@" ;;
    pm:rmD | pm:remove-dev)
        if [[ $pm = yarn ]]; then
            "$pm" remove "$@"
        else
            "$pm" remove -D "$@"
        fi
        ;;
    *) command node "$cmd" "$@" ;;
    esac
}
