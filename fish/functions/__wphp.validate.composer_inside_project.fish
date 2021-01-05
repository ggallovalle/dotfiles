function __wphp.validate.composer_inside_project -S
    set -l base (find-up composer.json)
    test -z "$base"
    and return 1
    or return 0
end
