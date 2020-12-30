# TODO add instructions on how to load file when inside the repl
# 	and also before entering on it
### csharp
alias repl.csharp='csi'
alias repl.fsharp='dotnet fsi'

### elixir
alias repl.elixir='iex'

### jvm
alias repl.java='jshell'
alias repl.scala='scala'
alias repl.kotlin='kotlin'

## python
function repl.python() {
  if hash bpython 2>/dev/null; then
    bpython
  else
    python
  fi
}

### ruby
alias repl.ruby='irb'
