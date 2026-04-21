export use ./commands/container.nu *
export use ./commands/image.nu *
export use ./tablelized.nu *


# A self-sufficient runtime for containers
export extern "docker" [
  --help # Get help text
  --version(-v) # Print version information and quit
  --debug(-D) # Enable debug mode
]
