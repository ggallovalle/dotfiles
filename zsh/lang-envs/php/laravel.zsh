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
