set -l this nest

# builtin
complete -f -c $this -n __gg_needs_command -a 'new n' -d 'generate new app'
complete -f -c $this -n __gg_needs_command -a 'build' -d 'build app'
complete -f -c $this -n __gg_needs_command -a start -d 'start app'
complete -f -c $this -n __gg_needs_command -a 'info i' -d 'display nest project details'
complete -f -c $this -n __gg_needs_command -a 'update u' -d 'update nest dependencies'
complete -f -c $this -n __gg_needs_command -a 'add' -d 'add support for extenal library'
complete -f -c $this -n __gg_needs_command -a 'generate g' -d 'generate schematics'


# generate
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a application
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'class cl' -d 'class'
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'configuration config' -d 'configuration'
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'controller co' -d controller
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'decorator d' -d decorator
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'filter f' -d filter
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'gateway ga' -d gateway
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'guard gu' -d guard
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'interceptor in' -d interceptor
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'interface' -d interface
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'middleware mi' -d middleware
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'module mo' -d module
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'pipe pi' -d pipe
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'provider pr' -d provider
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'resolver r' -d 'Grahpql resolver'
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'service s' -d service
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'libary lib' -d library
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'sub-app app' -d sub-app
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -a 'resource res' -d 'CRUD resource'

complete -f -c $this -n '__fish_seen_subcommand_from generate g' -l collection -s c -d 'schematics collection to use'
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -l flat -d 'enforce flat structure'
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -l spec -d 'enforce spec files generation'
complete -f -c $this -n '__fish_seen_subcommand_from generate g' -l no-spec -d 'disable spec files generation'

# new
complete -f -c $this -n '__fish_seen_subcommand_from generate new' -l directory -d 'destination directory'
complete -f -c $this -n '__fish_seen_subcommand_from generate new' -l skip-git -s g -d 'skip git init'
complete -f -c $this -n '__fish_seen_subcommand_from generate new' -l skip-install -s s -d 'skip npm install'
complete -f -c $this -n '__fish_seen_subcommand_from generate new' -l package-manager -s p -d 'select package manager {pnpm,npm,yarn}'
complete -f -c $this -n '__fish_seen_subcommand_from generate new' -l language -s l -d 'ts or js'
complete -f -c $this -n '__fish_seen_subcommand_from generate new' -l collection -s c -d 'schematics collection to use'

complete -f -c $this -n '__fish_seen_subcommand_from generate new' -l dry-run -s d '-d report actions without touching file system'
complete -f -c $this -n '__fish_seen_subcommand_from generate new' -l help -s h

# start
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l config -s c -d 'path to nest-cli config'
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l path -s p -d 'path to tsconfig.json'
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l watch -s w -d 'live reload'
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l debug -s d -d 'run in debug mode (nodejs --inspect)'
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l exec -s e -d 'binary to run (defaults to "node")'
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l watchAssets -d 'watch non-ts (e.g. graphql)'
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l webpack -d 'use webpack'
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l webpackPath -d 'path to webpack config'
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l preservWatchOutput -d 'use it when "tsc and watch modes"'
complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l tsc -d 'use tsc for compilation'

complete -f -c $this -n '__fish_seen_subcommand_from generate start' -l help -s h
# almost global options for subcommands
set -l subcmds g add
complete -f -c $this -n "__fish_seen_subcommand_from generate $subcmds" -l dry-run -s d '-d report actions without touching file system'
complete -f -c $this -n "__fish_seen_subcommand_from generate $subcmds" -l project -s p -d 'project in which to generate files'
complete -f -c $this -n "__fish_seen_subcommand_from generate $subcmds" -l help -s h
# global options
complete -f -c $this -n __gg_needs_command -l help -s h
complete -f -c $this -n __gg_needs_command -l versio -s v
