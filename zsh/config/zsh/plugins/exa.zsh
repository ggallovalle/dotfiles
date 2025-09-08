typeset -A EXA
EXA[tree]="exa -T -L 3 --git-ignore --color always --group-directories-first"
if command -v exa&>/dev/null; then
  alias ls='exa --group-directories-first'
  alias ll='exa --long --group-directories-first --header'
  alias lla='exa --long --group-directories-first --all --header'
  alias la='exa --all --group-directories-first'
  alias ld='exa --only-dirs'
fi
