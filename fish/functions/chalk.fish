function chalk -a spec -w 'set_color' -d 'stdout styling'
    switch $spec
        case ''
            set_color normal
        case header
            set_color bryellow -o -r
        case title
            set_color bryellow
        case cmd
            set_color brcyan
        case path
            set_color brmagenta -o
        case rm
            set_color brmagenta -o -r
        case url
            set_color brblue -u
        case ok
            set_color brgreen --bold
        case error
            set_color brred -o -r
        case colors
            set -l m_header (_ "header:\t"(chalk header)"%s\n"(chalk))
            set -l m_title (_ "title:\t"(chalk title)"%s\n"(chalk))
            set -l m_cmd (_ "cmd:\t"(chalk cmd)"%s\n"(chalk))
            set -l m_path (_ "path:\t"(chalk path)"%s\n"(chalk))
            set -l m_rm (_ "rm:\t"(chalk rm)"%s\n"(chalk))
            set -l m_url (_ "url:\t"(chalk url)"%s\n"(chalk))
            set -l m_ok (_ "ok:\t"(chalk ok)"%s\n"(chalk))
            set -l m_error (_ "error:\t"(chalk error)"%s\n"(chalk))
            printf $m_header 'pretty cool header'
            printf $m_title 'pretty cool title'
            printf $m_cmd 'pretty cool cmd'
            printf $m_path 'pretty cool path'
            printf $m_rm 'pretty cool rm'
            printf $m_url 'pretty cool url'
            printf $m_ok 'pretty cool ok'
            printf $m_error 'pretty cool error'
        case '*'
            set_color $argv
    end
end
