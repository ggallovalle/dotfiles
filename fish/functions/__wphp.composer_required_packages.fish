function __wphp.composer_required_packages
    set -l from 'composer.json'
    set -l base (find-up $from)
    test -z $base
    and return 1
    echo "
            require 'json'
            file = File.read '$base/$from'
            data = JSON.parse file
            packages = data['require'].keys
            packages.delete 'php'
            puts packages
" | ruby
end

function __wphp.composer_required_packages-dev
    set -l from 'composer.json'
    set -l base (find-up $from)
    test -z $base
    and return 1
    echo "
            require 'json'
            file = File.read '$base/$from'
            data = JSON.parse file
            packages = data['require-dev'].keys
            packages.delete 'php'
            puts packages
" | ruby
end
