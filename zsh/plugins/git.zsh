alias g='git'

alias gmv='git mv'
alias grm='git rm'
alias grmr='git rm'

alias gm='git commit'
function gmallm() {
    git add --all
    git commit --message $1
} 
function gmamend() {
    git add --all
    git commit --amend --no-edit
} 
alias gmm='git commit --message'

alias gc='git checkout'
alias gcb='git checkout -b'
alias gc-='git checkout -'

alias gz='git stash -m'
alias gza='git stash -u -m'
alias gzl='git stash list'
alias gzp='git stash pop'
alias gzr='git stash drop'
alias gzc='git stash clear'
alias gza='git stash apply'

alias gd='git diff'
alias gds='git diff --stat'

alias gl='git log'
alias gls='git log --oneline --stat'
alias glg="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

alias gs='git status'
alias gss='git status --short'

alias ga='git add'
alias gaa='git add --all'
alias gre='git restore'
alias gres='git restore --staged'
