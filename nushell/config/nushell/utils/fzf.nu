# Select repo of ghq/github.com
def --env cd-do [arg: string] {
  cd $arg
}

export def --env "h fzf ghq-github" [
  --cd
  --code
  --nvim
] {
  let search_term = $"(ghq root)/github.com/*/*" | into glob
  let path = (
    ls --full-paths $search_term
    | get name 
    | str join "\n" 
    | fzf --preview 'glow {}/README.md'
  )

  let len = ($path | str length)

  if  $len <= 0 {
    return ""
  }

  if $cd {
    cd $path
  } else if $code {
    code $path
  } else if $nvim {
    cd $path
    nvim .
  } else {
    $path
  }

}
