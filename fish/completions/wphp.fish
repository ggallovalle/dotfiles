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

set -l this wphp
complete -f -c $this
complete -c $this -n __composer_needs_command -a pm -d 'package manager "composer"'
# root, composer inside project
complete -c $this -n '__composer_inside_project; and __composer_needs_command' -a test -d 'test "phpunit"'
complete -c $this -n '__composer_inside_project; and __composer_needs_command' -a remove -d 'remove package'
complete -c $this -n '__composer_inside_project; and __composer_needs_command' -a remove-dev -d 'remove dev package'

# remove
complete -f -c $this -n '__fish_seen_subcommand_from remove' -a '(__composer_required_packages_prod)'
complete -f -c $this -n '__fish_seen_subcommand_from remove-dev' -a '(__composer_required_packages_dev)'
