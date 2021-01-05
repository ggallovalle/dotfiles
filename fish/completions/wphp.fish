function __composer_required_packages
    set -l base (find-up composer.json)
    test -z $base
    and return 1

    echo "
require 'json'
file = File.read '$base/composer.json'
data = JSON.parse file
packages = data['require'].keys + data['require-dev'].keys
packages.delete 'php'
puts packages
      " | ruby
end

function __composer_required_packages_prod
    set -l base (find-up composer.json)
    test -z $base
    and return 1

    echo "
require 'json'
file = File.read '$base/composer.json'
data = JSON.parse file
packages = data['require'].keys
packages.delete 'php'
puts packages
      " | ruby
end

function __composer_required_packages_dev
    set -l base (find-up composer.json)
    test -z $base
    and return 1

    echo "
require 'json'
file = File.read '$base/composer.json'
data = JSON.parse file
packages = data['require-dev'].keys
packages.delete 'php'
puts packages
      " | ruby
end

function __composer_inside_project
    set -l base (find-up composer.json)
    test -z "$base"
    and return 1
    or return 0
end


function __composer_needs_command
    set -l cmd (commandline -opc)

    if [ (count $cmd) -eq 1 ]
        return 0
    end

    return 1
end

complete -f -c wphp
complete -c wphp -n __composer_needs_command -a test -d 'test "phpunit"'
complete -f -c wphp -n __composer_needs_command -a pm -d 'package manager "composer"'
complete -f -c wphp -n '__composer_inside_project; and __composer_needs_command' -a pm:remove -d 'remove package'
complete -f -c wphp -n '__composer_inside_project; and __composer_needs_command' -a pm:remove-dev -d 'remove dev package'

# remove
complete -f -c wphp -n '__fish_seen_subcommand_from pm:remove' -a '(__composer_required_packages_prod)'
complete -f -c wphp -n '__fish_seen_subcommand_from pm:remove-dev' -a '(__composer_required_packages_dev)'
