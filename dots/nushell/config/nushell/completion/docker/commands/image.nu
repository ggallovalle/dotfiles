use ../utils.nu *

# Manage images
export extern "docker image" [
  --help # Get help text
]

# Display detailed information on one or more images
export extern "docker image inspect" [
  ...image: string@"nu-complete docker image ls"
]

# List images
export extern "docker image ls" [
  --format: string # Format the output using the given Go template
]

# Remove one or more images
export extern "docker image rm" [
  ...image: string@"nu-complete docker image ls"
  --force(-f) # Force removal
  --no-prune # Do not delete untagged parents
]
