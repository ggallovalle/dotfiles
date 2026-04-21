use utils/str.nu *

export def "tbl busctl list" [] {
  ^busctl list --json=short | from json
}

def "h into object path" [] {
  let replaced = ($in | str replace -a "." "/")
  $"/($replaced)"
}


export def "tbl busctl tree" [ service: string ] {
  let object_root = ($service | h into object path)
  (
    ^busctl tree $service --list 
    | from ssv --noheaders
    | where {|it| $it.column1 | str starts-with $object_root } 
    | rename objects
  )
}

export def "tbl busctl introspect" [
  service: string
  object: string
  interface?: string
] {
  (
    ^busctl introspect $service $object 
    | from ssv --aligned-columns 
    | rename "name" "type" "signature"
    | if $interface != null {
      # only show the members of an interface
        $in
        | skip until {|it| $it.name == $interface }
        | skip 1
        | take until {|it| $it.type == "interface" }
      } else { $in }
    | update signature {|it| 
        let encoded_signature = ( 
        $it.signature 
        | str replace -a "\\s+" "," 
        | split row ","
        )   
        { args: $encoded_signature.0, result: $encoded_signature.1, flags: $encoded_signature.2 }
      }
    | flatten signature
    | each {|it| 
        let name = ($it.name | str trim --left --char "." )
        let args = ($it.args | h str change-empty "-" "")
        let result = ($it.result | h str change-empty "-" "")
        let flags = ($it.flags | h str change-empty "-" "")
        {name: $name, type: $it.type, args: $args, result: $result, flags: $flags}
      }
  )
}

