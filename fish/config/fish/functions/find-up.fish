function find-up -d "find a file up the tree recursively" -a file
    set -l found (pwd)
    while test -n "$found"
        and not test -e "$found/$afile"

        set found (string split -r -m1 / $found)[1]
    end
    test -z $found
    and return 1
    or echo $found
end
