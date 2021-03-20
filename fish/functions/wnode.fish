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

function wnode_bin -S
    set -l node_modules_path "$PWD/node_modules/.bin"
    if test -e "$node_modules_path"
        set -g __node_binpath "$node_modules_path"
        set -x PATH $PATH $__node_binpath
        msg -k "$node_modules_path added to path"
    else
        msg -e "not inside a node project"
    end
end

function wnode_unbin -S
    set -q __node_binpath
    and set -l index (contains -i -- $__node_binpath $PATH)
    and set -e PATH[$index]
    and msg -k "$__node_binpath removed from path"
    and set -e __node_binpath
    or msg -e "there was no nodebin added to path"
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
        case bin
            wnode_bin $argv[2..-1]
        case unbin
            wnode_unbin $argv[2..-1]
        case '*'
            msg -e default
    end
    for f in add add_dev rm rm_dev install run bin unbin
        set -e wnode_$f
    end
end
