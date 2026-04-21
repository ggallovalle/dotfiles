
use utils/str.nu *

def "nu-complete cargo run example" [buffer: string, position: int] {
  (
  ls examples --short-names
  | get name 
  | path parse
  | where extension == "rs"
  | get stem
  )
}

# Run a binary or example of the local package
export extern "cargo run" [
  --example: string@"nu-complete cargo run example"  
  --help 
  # Get help text
]
