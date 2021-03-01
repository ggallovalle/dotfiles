set -l this ghq
set -l commands get list root create help h

complete -f -c $this
complete -f -c $this -n __gg_needs_command -a get -d 'clone/sync remote repo'
complete -f -c $this -n __gg_needs_command -a list -d 'list local repos'
complete -f -c $this -n __gg_needs_command -a root -d 'show repositories root'
complete -f -c $this -n __gg_needs_command -a help -d 'help'


# get
complete -f -c $this -n '__gg_using_command get' -l update -s u -d 'update if already cloneid'
complete -f -c $this -n '__gg_using_command get' -s p -d 'clone with SSH'
complete -f -c $this -n '__gg_using_command get' -l look -s l -d 'look after get'
complete -f -c $this -n '__gg_using_command get' -l vcs -d 'specify vcs backend for cloning'
complete -f -c $this -n '__gg_using_command get' -l silent -s s -d 'silently'
complete -f -c $this -n '__gg_using_command get' -l no-recursive -d 'prevent recursive fetching'
complete -f -c $this -n '__gg_using_command get' -l branch -s b -d 'specify branch'

# create
complete -f -c $this -n '__gg_using_command create' -l vcs -d 'specify vcs backend for cloning'

# list
complete -f -c $this -n '__gg_using_command list' -l unique -d 'print unique subpaths'
complete -f -c $this -n '__gg_using_command list' -l full-path -s p -d 'print full paths'h
complete -f -c $this -n '__gg_using_command list' -l vcs -d 'specify vcs backend for cloning'
complete -f -c $this -n '__gg_using_command list' -l exact -s e -d 'perform exact match'

# root
complete -f -c $this -n '__gg_using_command root' -l all -d 'show all roots'

# help
complete -c $this -n '__gg_using_command help' -a 'get list root create'
complete -f -c $this -n '__gg_using_command help' -l help

# global options
complete -f -c $this -n __gg_needs_command -l help -s h
complete -f -c $this -n __gg_needs_command -l version -s v
