typeset -A GHQ
GHQ[user]=ggallovalle
GHQ[root]=$GHQ_ROOT
GHQ[github]=$GHQ[root]/github.com
GHQ[home]=$GHQ[github]/$GHQ[user]

alias ghq.home='cd $GHQ[home]'
alias ghq.github='cd $GHQ[github]'

function ghq.mine() {
    local repo
    cd $GHQ[home]
    repo=$(column -t <(
        for it in *; do
            tmsu tags $it
        done
    ) | sed 's/://g' | fzf | awk '{print $1}')
    if [[ -z $repo ]]; then
        cd -
        return
    fi
    cd $repo
}

function ghq.others() {
    local repo
    cd $GHQ[github]
    repo=$(column -t <(
        for it in */*; do
            tmsu tags $it
        done
    ) | sed 's/://g; /ggallovalle/d' | fzf | awk '{print $1}')
    if [[ -z $repo ]]; then
        cd -
        return
    fi
    if [[ -z "$@" ]]; then
        cd $repo
    else
        cd "$repo"
        "$@"
        cd
    fi

}

function ghq.get() {
    local repo
    repo=$1
    if [[ -z $repo ]]; then
        +zinit-message "{failure}You din't pass a repo.{rst}"
        return
    elif [[ -z ${@:2} ]]; then
        +zinit-message "{failure}You din't pass any tags.{rst}"
        return
    fi
    ghq get -l $repo
    for it in ${@:2}; do
        tmsu tag . $it
    done
}
