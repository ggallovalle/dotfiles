function php.la() {
    local base=$(find-up artisan) artisan
    if [[ -z $base ]]; then
        +zinit-message "{info3}Not inside a laravel project.{rst}"
        return 1
    fi
    artisan="$base/artisan"
    # Laravel functions
    case "$1" in
        server) shift;"$artisan" serve;;
        g:model)
            shift
            +zinit-message "{warn} Usage:{rst}"
            +zinit-message "    make:model [options] [--] <name>"
            echo
            +zinit-message "{keyword}-a, --all {rst}        Generate a migration, seeder, factory, and resource controller for the model"
            +zinit-message "{keyword}-c, --controller {rst} Generate a new controller for the model"
            +zinit-message "{keyword}-f, --factory {rst}    Generate a new factory for the model"
            +zinit-message "{keyword}--force {rst}          Create the class even if the model already exist"
            "$artisan" make:model "$@"
            ;;
        *)  "$artisan" "$@";;
    esac
}
alias laravel='php artisan'

# one time
alias laravel.server='php artisan serve'
alias laravel.shell='php artisan tinker'

# migrations
alias laravel.mi.up='php artisan migrate'
alias laravel.mi.down='php artisan migrate:rollback'
alias laravel.mi.ls='php artisan migrate:status'

function laravel.mi.roll() {
    php artisan migrate:rollback
    php artisan migrate
}

# generate
alias laravel.g.migration='php artisan make:migration'
alias laravel.g.model='php artisan make:model'
alias laravel.g.model.full='php artisan make:model -a'
