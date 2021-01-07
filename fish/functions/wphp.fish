function wphp -a cmd -d 'PHP Wraper'
    set -l shifted $argv[2..-1]
    set -l msg_not_in_project (msg -e 'not inside a PHP project')
    set -l msg_packages_not_provided (msg -e 'dind\'t provide a package to add')

    switch $cmd
        case test

            # validate
            # using pest or phpunit
            set -l base (find-up composer.json)
            set -l runner
            if test -n "$base"; and test -f $base/vendor/bin/pest
                set runner "$base/vendor/bin/pest -c $base/phpunit.xml"
            else if test -n "$base"; and test -f $base/vendor/bin/phpunit
                set runner "$base/vendor/bin/phpunit -c $base/phpunit.xml"
            else
                msg -e 'pest nor phpunit installed'
                return 1
            end
            # execute
            eval (echo "$runner" "$shifted")
        case pm
            composer $shifted
        case init
            composer init $shifted
        case add
            composer require $shifted
        case add-dev
            composer require --dev $shifted
        case remove

            # validate
            # inside a composer project, based on the existance of composer.json
            not __wphp.validate.composer_inside_project; and echo $msg_not_in_project; and return 1
            # packages argument passed
            test -z "$shifted"; and echo $msg_packages_not_provided; and return 1
            # package not installed
            set -l possible_pkgs
            set -l required_packages (__wphp.composer_required_packages)
            set -l required_packages_dev (__wphp.composer_required_packages-dev)
            for pkg in $shifted
                # if is in dev-dependencies show a message
                contains "$pkg" $required_packages_dev; and msg -w "$pkg installed as dev dependency"; and continue
                not contains "$pkg" $required_packages; and msg -e "$pkg not installed"; or set -a possible_pkgs "$pkg"
            end
            # execute
            for pkg in $possible_pkgs
                if confirm "Remove $pkg ?"
                    composer remove $pkg
                    msg -k "$pkg removed"
                end
            end
        case remove-dev

            # validate
            # inside a composer project, based on the existance of composer.json
            not __wphp.validate.composer_inside_project; and echo $msg_not_in_project; and return 1
            # packages argument passed
            test -z "$shifted"; and echo $msg_packages_not_provided; and return 1
            # package not installed
            set -l possible_pkgs
            set -l required_packages (__wphp.composer_required_packages)
            set -l required_packages_dev (__wphp.composer_required_packages-dev)
            for pkg in $shifted
                # if is in dev-dependencies show a message
                contains "$pkg" $required_packages; and msg -e "$pkg installed as dependency"; and continue
                not contains "$pkg" $required_packages_dev; and msg -w "$pkg not installed"; or set -a possible_pkgs "$pkg"
            end
            # execute
            for pkg in $possible_pkgs
                if confirm "Remove $pkg ?"
                    composer remove --dev $pkg
                    msg -k "$pkg removed"
                end
            end
        case install
            composer install $shifted
        case '*'
            command php $argv
    end
end
