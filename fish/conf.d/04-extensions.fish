# NOTE all extensions MUST start with "!"
#   and containa "!{command}" version which is basically a usage section

#git
function !git -d "Extensions - git"
    echo "!gca          - Git add all and commit"
    echo "!gbd  <branch> - Delete a branch, locally and remotly"
end

function !gca -d "git add all and commit" -w "git commit"
    git status --short
    if confirm "Show diff?"
        git diff
    end
    if confirm "Add all?"
        git add --all
        git commit
    end
end

function !gbd -d "delete branch, locally and remotly" -a branch
    if confirm "Remove branch $branch"
        git branch --delete $branch
        git push --delete origin $branch
    end
end
#git
