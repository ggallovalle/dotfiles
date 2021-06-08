if not command -q git
    msg -w "git not installed"
end

alias gs="git status"
alias gss="git status --short"
alias gd="git diff"
alias gc="git commit"
alias gch="git checkout"
alias gaa="git add --all"
alias gl="git log"
alias glo="git log --oneline"
alias gb="git branch"
alias gba="git branch --all"

function gca -w "git commit"
    git status --short
    if confirm "Show diff?"
        git diff
    end
    if confirm "Add all?"
        git add --all
        if jq 'contains({"scripts": { "commit": "commit"}})' package.json -e >/dev/null
            npm run commit
        else
            git commit
        end
    end
end

function gbd -d "delete branch" -a branch
    if confirm "Remove branch $branch"
        git branch --delete $branch
        git push --delete origin $branch
    end
end
