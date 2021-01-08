function ghq
    set -l from_dir $PWD
    switch $argv[1]
        case mine
            set -l tagi
            cd $HOME/ghq
            set -l repo (for rep in (ghq list ggallovalle)
                set tagi (tmsu tags $rep)
                echo $tagi
            end | sed 's/://g' | column -t | fzf | awk '{print $1}')
            set -e tag
            cd $repo

        case others
            set -l tagi
            cd $HOME/ghq
            set -l repo (for rep in (ghq list | sed '/ggallovalle/d')
                set tagi (tmsu tags $rep)
                echo $tagi
            end | sed 's/://g' | column -t | fzf | awk '{print $1}')
            set -e tag
            cd $repo
        case '*'
            command ghq $argv
    end
end
