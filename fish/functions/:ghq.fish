function :ghq
    switch $argv[1]
        case mine
            __:ghq-mine $argv[2..-1]
        case others
            __:ghq-others $argv[2..-1]
    end
end

function __:ghq-others
    argparse 'l-ls' -- $argv
    or return
    set -l tagi
    cd $HOME/ghq
    if test -z "$_flag_ls"
        set -l repo (for rep in (ghq list | sed '/ggallovalle/d')
            set tagi (tmsu tags $rep)
            echo $tagi
        end | sed 's/://g' | column -t | fzf | awk '{print $1}')
        cd $repo
    else
        for rep in (ghq list | sed '/ggallovalle/d')
            set tagi (tmsu tags $rep)
            echo $tagi
        end | sed 's/://g' | column -t
        cd -
    end
end

function __:ghq-mine
    argparse 'l-ls' -- $argv
    or return
    set -l tagi
    cd $HOME/ghq
    if test -z "$_flag_ls"
        set -l repo (for rep in (ghq list ggallovalle)
            set tagi (tmsu tags $rep)
            echo $tagi
        end | sed 's/://g' | column -t | fzf | awk '{print $1}')
        cd $repo
    else
        for rep in (ghq list ggallovalle)
            set tagi (tmsu tags $rep)
            echo $tagi
        end | sed 's/://g' | column -t
        cd -
    end
end
