function php() {
    local cmd="$1" artisan
    # if is a Laravel cmd
    if [[ $cmd = *ar ]]; then
        local base=$(find-up artisan)
        if [[ -z $base ]]; then
            +zinit-message "{info3}Not inside a {uname}Laravel{info3} project.{rst}"
            return 1
        fi
        artisan="$base/artisan"
    fi
    shift

    case "$cmd" in
    # others
    bin) composer exec -- "$1" "${@:2}" ;;
    # TODO docs
    fmt) php bin php-cs-fixer "$@" ;;
    lint) php bin psalm "$@" ;;
    repl) command php --interactive "$@" ;;
    script) command php "$cmd" "$@" ;;
    # TODO search
    test) php bin phpunit "$@" ;;

    # laravel
    ar) "$artisan" "$@" ;;
    # generate
    ar:g:model) "$artisan" "$@" ;;
    ar:g:migration) "$artisan" make:migration "$@" ;;
    # migrate
    ar:mi:down) "$artisan" migrate:rollback "$@" ;;
    ar:mi:ps) "$artisan" migrate:status "$@" ;;
    ar:mi:redo)
        "$artisan" migrate:rollback
        "$artisan" migrate
        ;;
    ar:mi:up) "$artisan" migrate "$@" ;;
    ar:start) "$artisan" serve "$@" ;;
    ar:shell) "$artisan" tinker "$@" ;;

    # composer
    pm) composer "$@" ;;
    pm:ad | pm:add) composer require "$@" ;;
    pm:adD | pm:add-dev) composer require --dev "$@" ;;
    pm:init) composer init "$@" ;;
    pm:in | pm:install) composer install "$@" ;;
    pm:un | pm:uninstall)
        local pkg=$(find-up composer.json)
        if [[ -z $pkg ]]; then
            +zinit-message "{info3}Not inside a {uname}PHP{info3} project.{rst}"
            return 1
        fi
        read -q '? Yes/No: '
        echo
        if [[ $REPLY = y ]]; then
            if [[ -d $pgk/vendor ]]; then
                rm -r $pkg/vendor
            fi
            +zinit-message "{st}vendor{rst}"
        fi
        ;;
    # TODO pm:ls | pm:list
    # TODO pm:lsD | pm:list-dev
    pm:rm | pm:remove) composer remove "$@" ;;
    pm:rmD | pm:remove-dev) composer remove --dev "$@" ;;
    *) command php "$cmd" "$@" ;;
    esac
}
