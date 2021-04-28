if test -f $HOME/.in-work.txt
    msg -k "👺 ENV WORK"
    source "$__fish_config_dir/env/work.fish"
else
    msg -k "👺 NO ENV"
end
