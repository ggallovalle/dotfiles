function msg
    argparse -x 'error,ok,warn' 'e/error' 'k/ok' 'w/warn' -- $argv
    or return
    if test -n "$_flag_error"
        echo (chalk error)'  🐍  '(chalk)" $argv "(chalk)
    else if test -n "$_flag_ok"
        echo (chalk ok)'  🦄  '(chalk)" $argv "(chalk)
    else if test -n "$_flag_warn"
        echo (chalk header)'  🚨  '(chalk)" $argv "(chalk)
    end
end
