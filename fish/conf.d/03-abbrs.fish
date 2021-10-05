if status --is-interactive
    # NOTE prefer the global scope
    abbr --add --global .grubup "sudo update-grub"
    abbr --add --global .untar 'tar -zxvf '
    abbr --add --global .wget 'wget -c '
    abbr --add --global .. 'cd ..'
    abbr --add --global ... 'cd ../..'
    abbr --add --global .... 'cd ../../..'
    abbr --add --global ..... 'cd ../../../..'
    abbr --add --global ...... 'cd ../../../../..'

    abbr --add --global .ls 'exa --icons --group-directories-first' # my preferred listing
    abbr --add --global .lh 'exa -d --icons .*  --group-directories-first' # all files and dirs
    abbr --add --global .ll 'exa --icons --long --no-user  --group-directories-first --header' # long format
    abbr --add --global .lt 'exa --tree --icons  --group-directories-first' # tree listing

    #git
    abbr --add --global .gs "git status"
    abbr --add --global .gss "git status --short"
    abbr --add --global .gd "git diff"
    abbr --add --global .gc "git commit"
    abbr --add --global .gca ":git-commit-all"
    abbr --add --global .gch "git checkout"
    abbr --add --global .gbd ":git-branch-del"
    abbr --add --global .gaa "git add --all"
    abbr --add --global .gl "git log"
    abbr --add --global .glo "git log --oneline"
    abbr --add --global .gb "git branch"
    abbr --add --global .gba "git branch --all"
end
