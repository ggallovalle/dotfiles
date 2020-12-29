function php() {
    local cmd="$1" artisan
    # if is a Laravel cmd
    if [[ $cmd = *ar ]]; then
        local base=$(find-up artisan)
        if [[ -z $base ]]; then
            +zinit-message "{info3}Not inside a {term}Laravel{info3} project.{rst}"
            return 1
        fi
        artisan="$base/artisan"
    fi
    shift

    case "$cmd" in
    # laravel specific
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
    ar:serve) "$artisan" serve "$@" ;;
    ar:shell) "$artisan" tinker "$@" ;;
    # others
    bin) composer exec -- "$1" "${@:2}" ;;
    fmt) php bin php-cs-fixer "$@" ;;
    lint) php bin psalm "$@" ;;
    pm) composer "$@" ;;
    pm:ad | pm:add) composer require "$@" ;;
    pm:adD | pm:add-dev) composer require --dev "$@" ;;
    pm:rm | pm:remove) composer remove "$@" ;;
    pm:rmD | pm:remove-dev) composer remove "$@" ;;
    repl) command php --interactive "$@" ;;
    test) php bin phpunit "$@" ;;
    *) command php "$cmd" "$@" ;;
    esac
}
