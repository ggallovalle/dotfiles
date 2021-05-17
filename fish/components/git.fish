if command -q git
    alias gs="git status"
    alias gss="git status --short"
    alias gd="git diff"
    alias gc="git commit"
    alias gch="git checkout"
    function gca -w "git commit"
        git status --short
        if confirm "Show diff?"
            git diff
        end
        if confirm "Add all?"
            git add --all
            git commit
        end
    end
else
    msg -w "git not installed"
end
