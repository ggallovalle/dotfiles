function chalk -a spec -w 'set_color' -d 'stdout styling'
    switch $spec
        case ''
            set_color normal
        case header
            chalk
            set_color bryellow -o -r
        case title
            chalk
            set_color bryellow
        case cmd
            chalk
            set_color brcyan
        case path
            chalk
            set_color brmagenta -o
        case rm
            chalk
            set_color brmagenta -o -r
        case url
            chalk
            set_color brblue -u
        case ok
            chalk
            set_color brgreen --bold -r
        case ok-hl
            chalk
            set_color white -o -b black -r
        case error
            chalk
            set_color brred -o -r
        case error-hl
            chalk
            set_color white -o -b black -r
        case colors
            set -l showcase (chalk)"%s:\t%s\n"

            printf $showcase header (chalk header)'pretty cool header'
            printf $showcase title (chalk title)'pretty cool title'
            printf $showcase cmd (chalk cmd)'pretty cool cmd'
            printf $showcase path (chalk path)'pretty cool path'
            printf $showcase rm (chalk rm)'pretty cool rm'
            printf $showcase url (chalk url)'pretty cool url'
            printf $showcase ok (chalk ok)'pretty cool ok'
            printf $showcase ok-hl (chalk ok-hl)'pretty cool ok-hl'
            printf $showcase error (chalk error)'pretty cool error'
            printf $showcase error-hl (chalk error-hl)'pretty cool error-hl'
        case '*'
            chalk
            set_color $argv
    end
end
