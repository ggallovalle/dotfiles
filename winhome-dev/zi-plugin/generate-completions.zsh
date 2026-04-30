# zi creinstall _local/kbroom

generated_completions_count=0

# command → completion generator mapping
typeset -A _completion_cmds

_completion_cmds=(
  # can't be move to zi snippet, has to be generated
  # https://github.com/zellij-org/zellij/blob/a8372a09cd7ac14af0016b38fd9561f975ec17f3/Cargo.toml#L143
  zellij   "zellij setup --generate-completion zsh"
  # can't be move to zi snippet, has to be generated
  uv       "uv generate-shell-completion zsh"
  # can't be move to zi snippet, has to be generated
  hl       "hl --shell-completions zsh _hl"
  # can't be move to zi snippet, has to be generated
  codex    "codex completion zsh"
  # can't be move to zi snippet, has to be generated
  glab "glab completion -s zsh"
)

for _complete_this _gen_cmd in ${(kv)_completion_cmds}; do
  _target="${Plugins[KBROOM_DIR]}/_${_complete_this}"

  if (( ${+commands[${_complete_this}]} )) && [[ ! -e "$_target" ]]; then
    echo "'${_complete_this}' generate completion"
    eval "$_gen_cmd" > "$_target"
    (( generated_completions_count++ ))
  fi
done

if [[ $generated_completions_count -gt 0 ]]; then
  echo "Generated ${generated_completions_count} completions"
  zi creinstall _local/kbroom
fi


# if [[ ! -f "${Plugins[KBROOM_DIR]}/mise.zsh" ]]; then
#     echo "Generated mise activate"
#     mise activate zsh >> "${Plugins[KBROOM_DIR]}/mise.zsh"
# fi

source "${Plugins[KBROOM_DIR]}/mise.zsh"

# if [[ ! -f "${Plugins[KBROOM_DIR]}/typspec.zsh" ]]; then
#     typspec completion zsh > "${Plugins[KBROOM_DIR]}/typspec.zsh"
# fi

source "${Plugins[KBROOM_DIR]}/typspec.zsh"
