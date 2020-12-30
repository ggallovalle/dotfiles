function js() {
    local cmd="$1" pm=npm pkg=$(find-up package.json) pmx=npx \
    pkgconf="$pkg"/package.json pkgdepsdir="$pkg"/node_modules
    if [[ -n $(find-up pnpm-lock.yaml) ]]; then
        pm=pnpm
        pmx=pnpx
    elif [[ -n $(find-up yarn.lock) ]]; then
        pm=yarn
    fi
    shift
    # TODO In the npx commands figure out a solution in case of a monorepo,
    # where the bins are up in the tree

    case "$cmd" in
    # others
    bin) "$pmx" "$@" ;;
    docs) npm docs "$@" ;;
    # TODO fmt)
    # TODO lint)
    repl) command node "$@" ;;
    repo) xdg-open 'https://www.npmjs.com/' &>/dev/null ;;
    script) command node "$cmd" "$@" ;;
    search) npm search "$@" ;;
    test)
        # if it has a script.test execute it
        if [[ "true" = $(jq '.scripts | has("test")' $pkgconf -r) ]]; then
            "$pm" run "test" "$@"
        else
            "$pmx" jest "$@"
        fi
        ;;

    # pnpm/yarn/npm
    pm) "$pm" "$@" ;;
    pm:init) npm init ;;
    pm:ad | pm:add) "$pm" add "$@" ;;
    pm:adD | pm:add-dev) "$pm" add -D "$@" ;;
    pm:in | pm:install) "$pm" install ;;
    pm:un | pm:uninstall)
        if [[ -z $pkg ]]; then
            +zinit-message "{info3}Not inside a {uname}Node{info3} project.{rst}"
            return 1
        fi
        read -q '? Yes/No: '
        echo
        if [[ $REPLY = y ]]; then
            if [[ -d $pkgdepsdir ]]; then
                rm -r $pkgdepsdir
            fi
            +zinit-message "{st}node_modules{rst}"
        fi
        ;;
    pm:ls | pm:list)
        if [[ $pm = pnpm ]]; then
            pnpm list -P --color $@ | sed "/not saved/Q"
        else
            jq .dependencies $pgkconf
        fi
        ;;
    pm:lsD | pm:list-dev)
        if [[ $pm = pnpm ]]; then
            pnpm list -D --color $@ | sed "/not saved/Q"
        else
            jq .devDependencies $pkgconf
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
