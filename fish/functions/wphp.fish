function wphp -a cmd -d 'PHP Wraper'
    set -l shifted $argv[2..-1]
    set -l msg_not_in_project $_msg_error_header(chalk error)" not inside a "(chalk error-hl)' PHP '(chalk error)" project $_msg_error_header"
    set -l msg_packages_not_provided $_msg_error_header(chalk error)"dind't provide a package to %s $_msg_error_header\n"
    set -l errors 0

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
                echo $_msg_error_header(chalk error)' pest nor phpunit installed '$_msg_error_header
                return 1
            end

            # execute
            if test -n "$shifted"
                eval (echo $runner $shifted)
            else
                eval (echo $runner)
            end

        case pm
            composer $shifted
        case pm:init
            composer init $shifted
        case pm:add
            composer require $shifted
        case pm:add-dev
            composer require --dev $shifted

        case pm:remove

            # validate
            # inside a composer project, based on the existance of composer.json
            not __wphp.validate.composer_inside_project; and echo $msg_not_in_project; and return 1
            # packages argument passed
            test -z "$shifted"; and printf $msg_packages_not_provided add; and return 1
            # package not installed
            set -l possible_pkgs
            set -l required_packages (__wphp.composer_required_packages)
            set -l required_packages_dev (__wphp.composer_required_packages-dev)
            set -l msg_package_not_installed $_msg_error_header(chalk error)'package '(chalk error-hl)" %s "(chalk error)" %s $_msg_error_header\n"
            for pkg in $shifted
                # if is in dev-dependencies show a message
                contains "$pkg" $required_packages_dev; and printf $msg_package_not_installed $pkg 'installed as dev dependency'; and continue
                not contains "$pkg" $required_packages; and printf $msg_package_not_installed $pkg 'not installed'; or set -a possible_pkgs "$pkg"
            end

            # execute
            for pkg in $possible_pkgs
                set -l msg (chalk header)'Remove '(chalk ok-hl)" $pkg "(chalk header)
                if confirm "$msg"
                    composer remove $pkg
                    echo $_msg_ok_header(chalk ok)" $pkg removed $_msg_ok_header"
                end
            end

        case pm:remove-dev

            # validate
            # inside a composer project, based on the existance of composer.json
            not __wphp.validate.composer_inside_project; and echo $msg_not_in_project; and return 1
            # packages argument passed
            test -z "$shifted"; and printf $msg_packages_not_provided add; and return 1
            # package not installed
            set -l possible_pkgs
            set -l required_packages (__wphp.composer_required_packages)
            set -l required_packages_dev (__wphp.composer_required_packages-dev)
            set -l msg_package_not_installed $_msg_error_header(chalk error)'package '(chalk error-hl)" %s "(chalk error)" %s $_msg_error_header\n"
            for pkg in $shifted
                # if is in prod-dependencies show a message
                contains "$pkg" $required_packages; and printf $msg_package_not_installed $pkg 'installed as prod dependency'; and continue
                not contains "$pkg" $required_packages_dev; and printf $msg_package_not_installed $pkg 'not installed'; or set -a possible_pkgs "$pkg"
            end

            # execute
            for pkg in $possible_pkgs
                set -l msg (chalk header)'Remove '(chalk ok-hl)" $pkg "(chalk header)
                if confirm "$msg"
                    composer remove $pkg --dev
                    echo $_msg_ok_header(chalk ok)" $pkg removed $_msg_ok_header"
                end
            end
        case install
            composer install $shifted
        case '*'
            command php $argv
    end
end
