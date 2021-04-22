if command -q exa
    alias ls='exa -al --color=always --group-directories-first' # my preferred listing
    alias la='exa -a --color=always --group-directories-first' # all files and dirs
    alias ll='exa -l --color=always --group-directories-first --header' # long format
    alias lt='exa -aT --color=always --group-directories-first' # tree listing
else
    msg -w "exa not installed"
end
