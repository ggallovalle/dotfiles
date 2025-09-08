function wruby_add -S
    eval "$pm add $argv"
end

function wruby_add_dev -S
    eval "$pm add -g development $argv"
end

function wruby_rm -S
    eval "$pm remove $argv"
end

function wruby_rm_dev -S
    eval "$pm remove $argv"
end

function wruby_install -S
    eval "$pm install $argv"
end

function wruby_run -S
    eval "rake $argv"
end

function wruby_repl -S
    eval "irb $argv"
end

function wruby_bin -S
    set -l node_modules_path "$PWD/node_modules/.bin"
    if test -e "$node_modules_path"
        set -g __node_binpath "$node_modules_path"
        set -x PATH $PATH $__node_binpath
        msg -k "$node_modules_path added to path"
    else
        msg -e "not inside a node project"
    end
end

function wruby_unbin -S
    set -q __node_binpath
    and set -l index (contains -i -- $__node_binpath $PATH)
    and set -e PATH[$index]
    and msg -k "$__node_binpath removed from path"
    and set -e __node_binpath
    or msg -e "there was no nodebin added to path"
end

function wruby -d 'Ruby Wraper'
    # $1 cmd
    # $argv[2..-1] specific command

    set -l pm bundle
    set -l identifier Gemfile
    switch $argv[1]
        case add
            wruby_add $argv[2..-1]
        case add-dev
            wruby_add_dev $argv[2..-1]
        case rm
            wruby_rm $argv[2..-1]
        case rm-dev
            wruby_rm_dev $argv[2..-1]
        case install
            wruby_install $argv[2..-1]
        case run
            wruby_run $argv[2..-1]
        case pm
            bundle $argv[2..-1]
        case bin
            wruby_bin $argv[2..-1]
        case unbin
            wruby_unbin $argv[2..-1]
        case repl
            wruby_repl $argv[2..-1]
        case '*'
            msg -e default
    end
    for f in add add_dev rm rm_dev install run bin unbin repl
        set -e wruby_$f
    end
end
