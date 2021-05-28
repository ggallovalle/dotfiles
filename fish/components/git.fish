if command -q git
    alias gs="git status"
    alias gss="git status --short"
    alias gd="git diff"
    alias gc="git commit"
    alias gch="git checkout"
    alias gaa="git add --all"
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
else
    msg -w "git not installed"
end
