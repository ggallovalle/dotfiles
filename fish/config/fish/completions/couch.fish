set -l this couch

complete -f -c $this -n __gg_needs_command -a auth -d 'authenticate'

complete -f -c $this -n __gg_needs_command -a _all_dbs -d 'list all dbs'
