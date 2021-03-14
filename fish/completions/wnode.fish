set -l this wnode

# builtin
complete -f -c $this -n __gg_needs_command -a 'add add-dev rm rm-dev install run pm'
