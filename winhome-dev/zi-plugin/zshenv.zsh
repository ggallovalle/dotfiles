# echo 'from _local---kbrom/zshenv.zsh';

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=120000 # Larger than $SAVEHIST for HIST_EXPIRE_DUPS_FIRST to work
export SAVEHIST=100000
export DIRSTACKSIZE=7

if [[ "$SHELL" = /bin/zsh || "$SHELL" = /usr/bin/zsh ]]; then
  # echo 'zsh is your default shell. Good.'
else
  echo 'zsh is not your default shell. To change it, run: chsh -s $(which zsh)'
  echo "SHELL is currently: $SHELL"
fi
