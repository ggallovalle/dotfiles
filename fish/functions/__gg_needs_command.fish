function __gg_needs_command
    set -l cmd (commandline -opc)
    set -l position 1
    if [ (count $cmd) -eq $position ]
        return 0
    end

    return 1
end