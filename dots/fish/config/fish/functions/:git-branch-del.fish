function :git-branch-del -d "delete branch, locally and remotly" -a branch
    if confirm "Remove branch $branch"
        git branch --delete $branch
        git push --delete origin $branch
    end
end
