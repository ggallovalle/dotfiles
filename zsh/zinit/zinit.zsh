# ----------------- theme -------------------------

zinit load romkatv/powerlevel10k
# ----------------- completions -------------------

zinit as'completion' for \
    https://github.com/ogham/exa/blob/master/completions/completions.zsh \
    https://github.com/oniony/TMSU/blob/master/misc/zsh/_tmsu \
    https://github.com/gokcehan/lf/blob/master/etc/lf.zsh \
    https://github.com/gradle/gradle-completion/blob/master/gradle-completion.plugin.zsh
# ----------------- oh-my-zsh --------------------

zinit wait lucid for \
    OMZP::colored-man-pages \
    OMZP::docker/_docker
# ----------------- instant plugins --------------

zinit load AdrieanKhisbe/diractions
zinit load MichaelAquilina/zsh-you-should-use
# ----------------- wait conditions --------------

# https://zdharma.org/zinit/wiki/Example-wait-conditions/
zinit ice wait'[[ -n ${ZLAST_COMMANDS[(r)forgit*]} ]]' atload'FORGIT_NO_ALIASES=true' atinit'source $ZDOTDIR/zinit/atinit/forgit.zsh'
zinit load wfxr/forgit
zinit ice wait'[[ -n ${ZLAST_COMMANDS[(r)k*]} ]]'
zinit load supercrabtree/k
# ----------------- zdharma   --------------------

zinit load zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word
zinit load zdharma/zbrowse
zinit load zdharma/zui
# ----------------- zsh-users --------------------

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit load zsh-users/zsh-autosuggestions
zinit ice wait lucid atinit'source $ZDOTDIR/zinit/atinit/zsh-history-substring-search.zsh'
zinit load zsh-users/zsh-history-substring-search
zinit load zsh-users/zsh-completions

function +zinit-colors() {
  echo '+zinit-message "{level}Text.{rst}"' | xclip
  echo 'Zinit message format copy to clipboard'

  +zinit-message '{success}----------------------------------{rst}'
  +zinit-message "{pname}pname{rst} {uname}uname{rst} {keyword}keyword{rst} {note}note{rst}"
  +zinit-message "{error}error{rst} {p}p{rst} {info}info{rst} {info2}info2{rst} {b}b{rst}"
  +zinit-message "{info3}info3{rst} {uninst}uninst{rst} {nb}nb{rst} {failure}failure{rst}"
  +zinit-message "{success}success{rst}"
  #
  +zinit-message "{success}----------------------------------{rst}"
  +zinit-message "{success}More recent fresh colors.{rst}"
  +zinit-message "{success}----------------------------------{rst}"
  #
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
