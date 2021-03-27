function confirm
    set -l msg 'Continue?'
    test -n "$argv"
    set msg "$argv"
    # echo $msg
    while true
        read -l -n 1 -p "chalk green; echo \$msg; echo '[y/N] [>] '" confirm
        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end
