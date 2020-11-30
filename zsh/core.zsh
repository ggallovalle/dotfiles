#  ________
# < source >
#  --------
#   \     .    _  .
#    \    |\_|/__/|
#        / / \/ \  \
#       /__|O||O|__ \
#      |/_ \_/\_/ _\ |
#      | | (____) | ||
#      \/\___/\__/  //
#      (_/         ||
#       |          ||
#       |          ||\
#        \        //_/
#         \______//
#        __ || __||
#       (____(____)
#  ____________
fpath+="$ZDOTDIR/completions"
source $ZDOTDIR/bindkeys.zsh
for f in $ZDOTDIR/plugins/* $ZDOTDIR/lang-envs/* $ZDOTDIR/lang-envs/**/*; do
  source $f
done
if command -v thefuck&>/dev/null; then
    eval $(thefuck --alias)
fi
# < alias >
#  ------------
#         \    ,-^-.
#          \   !oYo!
#           \ /./=\.\______
#                ##        )\/\
#                 ||-----w||
#                 ||      ||
#
function src() {
  clear
  exec zsh
}
alias path='echo -e ${PATH//:/\\n}'
alias grep='grep --color'
alias inotify='sudo sysctl fs.inotify.max_user_watches=35000'
alias xclip='xclip -selection clipboard'
# < functions >
#  -------
#    \
#     \
#         .--.
#        |o_o |
#        |:_/ |
#       //   \ \
#      (|     | )
#     /'\_   _/`\
#     \___)=(___/
#
function backup() {
    cp $filename $filename.bak
}
function mkcd() {
    mkdir -p $1
    cd $1
}
function cexa() {
  cd $1
  exa
}
function zinit-colors() {
  echo '+zinit-message "{level}Text.{rst}"' | xclip
  echo 'Zinit message format copy to clipboard'
  +zinit-message '{success}----------------------------------{rst}'
  +zinit-message "{pname}pname{rst} {uname}uname{rst} {keyword}keyword{rst} {note}note{rst}"
  +zinit-message "{error}error{rst} {p}p{rst} {info}info{rst} {info2}info2{rst} {b}b{rst}"
  +zinit-message "{info3}info3{rst} {uninst}uninst{rst} {nb}nb{rst} {failure}failure{rst}"
  +zinit-message "{success}success{rst}"
  # # The more recent, fresh ones:
  +zinit-message "{success}----------------------------------{rst}"
  +zinit-message "{success}More recent fresh colors.{rst}"
  +zinit-message "{success}----------------------------------{rst}"
  # #
  +zinit-message "{pre}pre{rst} {msg}msg{rst} {msg2}msg2{rst} {obj}obj{rst}"
  +zinit-message "{obj2}obj2{rst} {file}file{rst} {url}url{rst} {meta}meta{rst}"
  +zinit-message "{meta2}meta2{rst} {data}data{rst} {hi}hi{rst} {data2}data2{rst}"
  +zinit-message "{ehi}ehi{rst} {var}var{rst} {glob}blob{rst} {cmd}cmd{rst}"
  +zinit-message "{ice}ice{rst} {txt}txt{rst} {num}num{rst} {term}term{rst}"
  +zinit-message "{warn}warn{rst} {apo}apo{rst} {ok}ok{rst} {dbg}dbg{rst}"
  +zinit-message "{opt}opt{rst} {lhi}lhi{rst} {tab}tab{rst} {msg3}msg3{rst}"
  +zinit-message "{blhi}blhi{rst} {…}…{rst} {ndsh}ndsh{rst} {mdsh}mdsh{rst}"
  +zinit-message "{mmdsh}mmdsh{rst} {lr}lr{rst} {u}u{rst} {it}it{rst}"
  +zinit-message "{st}st{rst} {nu}nu{rst} {nit}nit{rst} {nst}nst{rst}"
}
