### generic
alias pnpm.h='pnpm -h'
alias pnpm.run='pnpm run'
alias pnpm.search='npm search'
function pnpm.new() {
    mkcd $1
    npm init -y
    mkdir lib
}
alias pnpm.watch='pnpm run watch'


### install
alias pnpm.in='pnpm install'
function pnpm.un() {
    +zinit-message "{file}{st}node_modules{rst}"
    rm -r node_modules
}


### manage dependencies
function pnpm.ls() {
    pnpm list -P  --color $@ | sed "/not saved/Q"
}
function pnpm.lsD() {
    pnpm list -D --color $@ | sed "/not saved/Q"
}
# pnpm.lsT
alias pnpm.ad='pnpm add --save-prod'
alias pnpm.adD="pnpm add --save-dev"
# pnpm.adT
alias pnpm.rm='pnpm remove --save-dev'
alias pnpm.rmD='pnpm remove --save-prod'
# pnpm.rmT
