use ../tablelized.nu *
use ../utils.nu *

export extern "busctl call" [
  service: string@"nu-complete busctl list services",
  object: string@"nu-complete busctl list objects",
  interface: string@"nu-complete busctl list interfaces",
  method: string@"nu-complete busctl list methods",
  args_signature?: string@"nu-complete busctl get args"
  ...args: string
  -j # pretty json output
]

