if test "$SHELL" = /bin/fish; or test "$SHELL" = /usr/bin/fish
    source "$__fish_config_dir/exports.fish"
end

# ----------------- sources ------------------
# asdf
source $ASDF_DATA_DIR/asdf.fish
source $ASDF_DATA_DIR/plugins/dotnet-core/set-dotnet-home.fish
# source $ASDF_DATA_DIR/plugins/java/set-java-home.fish
# ssh-agent
keychain --quiet --eval github_ggallovalle | source
# ----------------- sane defaults ------------------

fish_vi_key_bindings
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first' # all files and dirs
alias ll='exa -l --color=always --group-directories-first --header' # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias aup="paru -Syu"
alias grubup="sudo update-grub"
alias untar='tar -zxvf '
alias wget='wget -c '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias upd='sudo reflector --latest 5 --country Germany --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist && sudo pacman -Syu'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# ----------------- thefuck ------------------

thefuck --alias | source
# ----------------- greeting ------------------

function fish_greeting
    # neofetch
end
# ----------------- omf ------------------

# Path to Oh My Fish install.
set OMF_CONFIG "$XDG_CONFIG_HOME/fish/omf"
set -q XDG_DATA_HOME
and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
or set -gx OMF_PATH "$HOME/.local/share/omf"
# Load Oh My Fish configuration.
test -d $OMF_PATH
or git clone https://github.com/oh-my-fish/oh-my-fish $OMF_PATH
source $OMF_PATH/init.fish
# ----------------- theme ------------------

starship init fish | source
