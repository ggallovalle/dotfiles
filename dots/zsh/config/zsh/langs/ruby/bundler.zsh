### generic
alias bundle.h='bundle -h'
alias bundle.run='bundle exec'
# bundle.search
alias bundle.new='bundle gem'
# bundle.watch


### install
alias bundle.in='bundle install'
# bundle un


### manage dependencies
alias bundle.ls='bundle list --without-group development --without-group test'
alias bundle.lsD='bundle list --only-group development'
alias bundle.lsT='bundle list --only-group test'
alias bundle.ad='bundle add'
alias bundle.adD='bundle add --group development'
alias bundle.adT='bundle add --group test'
alias bundle.rm='bundle remove'
alias bundle.rmD='bundle remove'
alias bundle.rmT='bundle remove'
