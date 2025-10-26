export def "tbl busctl introspect" [
  service: string
  object: string
  interface?: string
  --parse-signature
] {
  (
    ^busctl introspect $service $object 
    | from ssv --aligned-columns 
    | rename "name" "type" "signature"
    | if $parse_signature { 
        $in
        | update signature {|it| 
            let encoded_signature = ( 
            $it.signature 
            | str replace -a "\\s+" "," 
            | str replace -a -n "-" ""
            | split row ","
            )   
            { args: $encoded_signature.0, result: $encoded_signature.1, flags: $encoded_signature.2 }
          }
        | flatten signature
      } else { $in }
    | if $interface != null {
        $in
        | skip until {|it| $it.name == $interface }
        | skip 1
        | take until {|it| $it.type == "interface" }
    } else { $in }
  )
}

