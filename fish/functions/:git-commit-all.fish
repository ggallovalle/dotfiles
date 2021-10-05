function :git-commit-all -d "git add all and commit" -w "git commit"
    git status --short
    if confirm "Show diff?"
        git diff
    end
    if confirm "Add all?"
        git add --all
        git commit
    end
end
