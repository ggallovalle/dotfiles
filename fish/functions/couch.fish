function couch -w http
    set -l verb get
    set -l hpie $argv[3..-1]
    set -l url $argv[2]
    switch $argv[1]
        case put PUT
            set verb put
        case pos post POST
            set verb post
        case del delete DELETE
            set verb delete
        case '*'
            set verb get
            set hpie $argv[2..-1]
            set url $argv[1]
    end
    test -z $url
    and http $verb kbroom:ggerson@127.0.0.1:5984/
    or http $verb kbroom:ggerson@127.0.0.1:5984/$url $hpie
end