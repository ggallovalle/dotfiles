function confirm
    while true
        read -l -n 1 -p 'chalk header;echo "Continue? y/N "; chalk;chalk ok; echo "> "' confirm
        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end
