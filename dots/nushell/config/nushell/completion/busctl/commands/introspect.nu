use ../utils.nu *

export extern "busctl introspect" [
  service: string@"nu-complete busctl list services",
  object: string@"nu-complete busctl list objects",
  interface?: string@"nu-complete busctl list interfaces",
]

