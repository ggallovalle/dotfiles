# List the files in the database that match the QUERY. If no query, list all files
export extern "tmsu files" [
    ...query: string # Tag names to match, operators and parantheses
    --directory(-d) # List only items thata are directories
    --file(-f) # List only items that are files
    --print0(-0) # Delimit files with a NUL character rather than newline
    --count(-c) # List the number of files rather than the files themselves
    --path(-p): string # List only items under PATH
]

# Tags the FILE with the TAGS and VALUEs specified
#
# Examples:
#  `$ tmsu tag --from=mountain1.jpg mountain2.jpg`
#  $ tmsu tag --tags="landscape" field1.jpg field2.jpg 
#  $ tmsu tag --create bad rubbish awful =2017
#  $ tmsu tag --where="bad and good" confused
#  $ tmsu tag sheep.jpg '<tag>'
export extern "tmsu tag" [
    file?: string # The file to tag
    ...tags: string # The tags to apply TAG[=VALUE]
    --recursive(-r) # Recursively tag all files in the directory
    --create(-c) # Create tags or values withtout tagging any files
    --explicit(-e) # Explicitly apply tags even if they are already implied
    --force(-F) # Apply tags to non-existent or non-permissioned paths
    --no-dereference(-P) # Do not follow symbolic links (tag the link itself)
    --tags(-t): string # The tags to apply TAG[=VALUE]
    --from(-f): string # Copy tags from another file
    --where(-w): string # Tags files matching QUERY
]
