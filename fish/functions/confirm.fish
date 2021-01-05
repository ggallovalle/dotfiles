function confirm
    set -l msg (chalk header)'Continue?'
    test -n "$argv"
    set msg "$argv"
    # echo $msg
    while true
        read -l -n 1 -p "echo \$msg ' [y/N] '; chalk green; echo '[>] '" confirm
        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end
