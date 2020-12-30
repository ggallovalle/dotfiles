function php() {
    local cmd="$1" artisan
    # if is a Laravel cmd
    if [[ $cmd = ar || $cmd = *ar\: ]]; then
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
    # TODO if -z $1 open language docs
    docs) composer browse "$@" ;;
    fmt) php bin php-cs-fixer "$@" ;;
    lint) php bin psalm "$@" ;;
    repl) command php --interactive "$@" ;;
    script) command php "$cmd" "$@" ;;
    search) composer search "$@" ;;
    surf) xdg-open 'https://packagist.org/' &>/dev/null ;;
    test) php bin phpunit "$@" ;;

    # laravel
    ar) "$artisan" "$@" ;;
    ar:start) "$artisan" serve "$@" ;;
    ar:shell) "$artisan" tinker "$@" ;;
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

    # composer
    pm) composer "$@" ;;
    pm:init) composer init "$@" ;;
    pm:ad | pm:add) composer require "$@" ;;
    pm:adD | pm:add-dev) composer require --dev "$@" ;;
    pm:rm | pm:remove) composer remove "$@" ;;
    pm:rmD | pm:remove-dev) composer remove --dev "$@" ;;
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
    pm:ls | pm:list) jq .require composer.json ;;
    pm:lsD | pm:list-dev) jq '."require-dev"' composer.json ;;
    *) command php "$cmd" "$@" ;;
    esac
}
