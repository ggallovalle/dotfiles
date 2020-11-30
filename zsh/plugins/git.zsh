alias g='git'

alias g.mv='git mv'
alias g.rm='git rm'

alias g.commit='git commit'
alias g.commit.all='git commit --all'
function g.commit.allmessage() {
    git add --all
    git commit --message $1
} 
alias g.commit.amend='git commit --amend'
function g.commit.amendnoedit() {
    git add --all
    git commit --amend --no-edit
} 
alias g.commit.message='git commit --message'

alias g.checkout='git checkout'
alias g.checkout.branch='git checkout -b'
alias g.checkout.last='git checkout -'

alias g.stash='git stash -m'
alias g.stash.all='git stash -u -m'
alias g.stash.ls='git stash list'
alias g.stash.pop='git stash pop'
alias g.stash.rm='git stash drop'
alias g.stash.clear='git stash clear'
alias g.stash.apply='git stash apply'

alias g.diff='git diff'
alias g.diff.stat='git diff --stat'

alias g.log='git log'
alias g.log.stat='git log --oneline --stat'
alias g.log.graph="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

alias g.status='git status'
alias g.status.short='git status --short'

alias g.add='git add'
alias g.add.all='git add --all'
alias g.unstage='git restore --staged'
