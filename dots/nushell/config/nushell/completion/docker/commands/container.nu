use ../utils.nu *

# Manage containers
export extern "docker container" [
  --help # Get help text
]

# Kill one or more runnig containers
export extern "docker container kill" [
  ...container: string@"nu-complete docker container ls"
  --help # Get help text
]


# List containers
export extern "docker container ls" [
  --all(-a)          # Show all the containers (default shows just running) 
  --format: string # Pretty-print using a Go template
  --help # Get help text
]

# List port mappings for the container
export extern "docker container port" [
  container: string@"nu-complete docker container ls-all"
  --help # Get help text
]

# Remove one or more containers
export extern "docker container rm" [
  ...container: string@"nu-complete docker container ls-all"
  --help # Get help text
]

# Run a command in a new container
export extern "docker container run" [
  image: string@"nu-complete docker image ls"
  ...args: string
  --rm   # Automatically remove the container when it exists
  --detach(-d)  # Run container in background and print container ID
  --publish(-p): string # `{host port}:{container port}`  Publish a container's port to the host
  --name: string # Assign a name to the container
  --env(-e): string # `{key}={value}` Set environment variables
  --help # Get help text
]

