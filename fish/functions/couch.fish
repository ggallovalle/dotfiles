function couch -w http -a url
    set -l verb
    set -l shifted $argv[2..-1]
    # set -l basepath ':5984'
    set -l basepath http://kbroom:ggerson@127.0.0.1:5984
    set -l name kbroom
    set -l password ggerson
    switch $argv[1]
        case get GET post POST put PUT delete DELETE
            set verb $argv[1]
            set url $argv[2]
            set shifted $argv[3..-1]
        case auth
            rm ~/.config/httpie/sessions/localhost_5984/$name.json
            if http $basepath/_session name=$name password=$password --session $name \
                    --ignore-stdin --check-status &>/dev/null
                msg -k 'couch session restablished'
                return 0
            else
                msg -e 'bad auth'
                return 1
            end
        case '*'
            set url $argv[1]
            set shifted $argv[2..-1]
    end
    # test -z $verb
    # and echo $basepath/$url $shifted --session=$name
    # or echo $verb $basepath/$url $shifted --session=$name
    http $verb $basepath/$url $shifted
end
