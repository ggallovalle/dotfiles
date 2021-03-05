set -l this ghq

# CUSTOM
complete -f -c $this -n __gg_needs_command -a mine -d 'my repos'
complete -f -c $this -n '__fish_seen_subcommand_from mine' -l ls -d 'only list'
complete -f -c $this -n __gg_needs_command -a others -d 'other repos'
complete -f -c $this -n '__fish_seen_subcommand_from others' -l ls -d 'only list'

# builtin
complete -f -c $this
complete -f -c $this -n __gg_needs_command -a get -d 'clone/sync remote repo'
complete -f -c $this -n __gg_needs_command -a list -d 'list local repos'
complete -f -c $this -n __gg_needs_command -a root -d 'show repositories root'
complete -f -c $this -n __gg_needs_command -a help -d 'help'


# get
complete -f -c $this -n '__fish_seen_subcommand_from get' -l update -s u -d 'update if already cloneid'
complete -f -c $this -n '__fish_seen_subcommand_from get' -s p -d 'clone with SSH'
complete -f -c $this -n '__fish_seen_subcommand_from get' -l look -s l -d 'look after get'
complete -f -c $this -n '__fish_seen_subcommand_from get' -l vcs -d 'specify vcs backend for cloning'
complete -f -c $this -n '__fish_seen_subcommand_from get' -l silent -s s -d 'silently'
complete -f -c $this -n '__fish_seen_subcommand_from get' -l no-recursive -d 'prevent recursive fetching'
complete -f -c $this -n '__fish_seen_subcommand_from get' -l branch -s b -d 'specify branch'

# create
complete -f -c $this -n '__fish_seen_subcommand_from create' -l vcs -d 'specify vcs backend for cloning'

# list
complete -f -c $this -n '__fish_seen_subcommand_from list' -l unique -d 'print unique subpaths'
complete -f -c $this -n '__fish_seen_subcommand_from list' -l full-path -s p -d 'print full paths'h
complete -f -c $this -n '__fish_seen_subcommand_from list' -l vcs -d 'specify vcs backend for cloning'
complete -f -c $this -n '__fish_seen_subcommand_from list' -l exact -s e -d 'perform exact match'

# root
complete -f -c $this -n '__fish_seen_subcommand_from root' -l all -d 'show all roots'

# help
complete -c $this -n '__fish_seen_subcommand_from help' -a 'get list root create'
complete -f -c $this -n '__fish_seen_subcommand_from help' -l help

# global options
complete -f -c $this -n __gg_needs_command -l help -s h
complete -f -c $this -n __gg_needs_command -l version -s v
