use ../utils.nu *

# Push changes
export extern "git push" [
  remote?: string@"nu-complete git remotes",      # the name of the remote
  ...refs: string@"nu-complete git branches"      # the branch / refspec
  --all                                           # push all refs
  --atomic                                        # request atomic transaction on remote side
  --delete(-d)                                    # delete refs
  --dry-run(-n)                                   # dry run
  --exec: string                                  # receive pack program
  --follow-tags                                   # push missing but relevant tags
  --force-with-lease                              # require old value of ref to be at this value
  --force(-f)                                     # force updates
  --ipv4(-4)                                      # use IPv4 addresses only
  --ipv6(-6)                                      # use IPv6 addresses only
  --mirror                                        # mirror all refs
  --no-verify                                     # bypass pre-push hook
  --porcelain                                     # machine-readable output
  --progress                                      # force progress reporting
  --prune                                         # prune locally removed refs
  --push-option(-o): string                       # option to transmit
  --quiet(-q)                                     # be more quiet
  --receive-pack: string                          # receive pack program
  --recurse-submodules: string                    # control recursive pushing of submodules
  --repo: string                                  # repository
  --set-upstream(-u)                              # set upstream for git pull/status
  --signed: string                                # GPG sign the push
  --tags                                          # push tags (can't be used with --all or --mirror)
  --thin                                          # use thin pack
  --verbose(-v)                                   # be more verbose
  --help                                          # Display the help message for this command
]
