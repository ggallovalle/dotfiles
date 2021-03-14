function wnode_add -S
    set -l cmd add add add
    # NOTE just figure out which package manager to use based on the lock file
    # for i in $locks
    #     set f (find-up $i)
    #     test -n $f
    #     and set index
    # end
    eval "$pm[3] $cmd[3] $argv"
end

function wnode_add_dev -S
    set -l cmd add add "add -D"
    eval "$pm[3] $cmd[3] $argv"
end

function wnode_rm -S
    set -l cmd add add rm
    eval "$pm[3] $cmd[3] $argv"
end

function wnode_rm_dev -S
    set -l cmd add add "rm -D"
    eval "$pm[3] $cmd[3] $argv"
end

function wnode_install -S
    set -l cmd add add install
    eval "$pm[3] $cmd[3] $argv"
end

function wnode_run -S
    set -l cmd add add run
    eval "$pm[3] $cmd[3] $argv"
end

function wnode -d 'Node Wraper'
    # $1 cmd
    # $argv[2..-1] specific command

    set -l pm npm yarn pnpm
    set -l identifier package-lock.json yarn.lock pnpm-lock.yaml
    switch $argv[1]
        case add
            wnode_add $argv[2..-1]
        case add-dev
            wnode_add_dev $argv[2..-1]
        case rm
            wnode_rm $argv[2..-1]
        case rm-dev
            wnode_rm_dev $argv[2..-1]
        case install
            wnode_install $argv[2..-1]
        case run
            wnode_run $argv[2..-1]
        case pm
            pnpm $argv[2..-1]
        case '*'
            msg -e default
    end
    for f in add add_dev rm rm_dev install run
        set -e wnode_$f
    end
end
