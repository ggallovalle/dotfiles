function __io__read_confirm
    while true
        read -l -n 1 -P 'Continue? [y/N] ' confirm
        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end