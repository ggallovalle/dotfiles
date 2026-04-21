function gh.new() {
    local repo
    if [[ -z $1 ]];then
        +zinit-message "{error}You need to provide a repo name.{rst}"
        return
    fi
    repo=$GHQ[home]/$1
    if [[ -d $repo ]];then
        +zinit-message "{error}Directory already exist.{rst}"
        return
    fi
    cd $GHQ[home]
    gh repo create $1
    cd $repo
}

function gh.clone() {
    local cmd repo
    cmd="gh repo view {}"
    if [[ -n $1 ]];then
        repo=$(gh api users/$1/repos | jq '.[] | [.owner.login, .name] | join("/")' -r | fzf --preview $cmd)
        [[ -z $repo ]] && return
    else
        repo=$(gh api user/repos | jq '.[] | [.owner.login, .name] | join("/")' -r | fzf --preview $cmd)
        [[ -z $repo ]] && return
    fi
    if [[ -d $GHQ[github]/$repo ]]; then
        echo "Directory already exist"
        return
    fi
    ghq get -p $repo
}
