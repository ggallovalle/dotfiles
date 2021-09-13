# Always provide completions for command line utilities.
#
# Check Fish documentation about completions:
# http://fishshell.com/docs/current/commands.html#complete
#
# If your package doesn't provide any command line utility,
# feel free to remove completions directory from the project.

complete -c dasel -f
# /
# flag - color
complete -c dasel -l color -l colour -d "Colorurise output"
# flag - compact
complete -c dasel -l compact -s c -d "No pretty print"
# option - file
set -l __dasel_msg_o_file "The file to operate on"
# flag - length
complete -c dasel -l length -d "Output the length of selected value"
# flag - multiple
complete -c dasel -l multiple -s m -d "Return all matching results, not only the first"
# flag - null
complete -c dasel -l null -s n -d "Output `null` instead of `ValueNotFound` error"
# flag - merge-input-documents
complete -c dasel -l merge-input-documents -d "Merge multiple input documents into array"
# flag - plain
complete -c dasel -l plain -d "No formatting, output as string"

complete -c dasel -F -r -l file -s f -a "(__fish_complete_path)" -d "$__dasel_msg_o_file"
# option - read | write | parser
set -l __dasel_a_parser json toml yaml xml csv

complete -c dasel -f -r -l write -s w -a "$__dasel_a_parser" -d "The parser to use when writing"
complete -c dasel -f -r -l read -s r -a "$__dasel_a_parser" -d "The parser to use when reading"
complete -c dasel -f -r -l parser -s p -a "$__dasel_a_parser" -d "The parser to use when reading and writing"
# option - selector
complete -c dasel -f -r -l selector -s s -d "The selector to use when querying"
#end /

#
set -l __dasel_cmds_w_fileflag select put
complete -c dasel -n "__fish_seen_subcommand_from $__dasel_cmds_w_fileflag" -s f -l file -d $__dasel_msg_o_file
