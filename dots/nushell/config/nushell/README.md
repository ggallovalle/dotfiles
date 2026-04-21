
  (
    ^busctl introspect $service $object 
    | from ssv --aligned-columns 
    | rename "name" "type" "signature"
  )
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




    | each {|it| 
        let name = ($it.name | str trim --left --char "." )
        let args = ($it.args | str change-empty "-" "")
        let result = ($it.result | str change-empty "-" "")
        let flags = ($it.flags | str change-empty "-" "")
        {name: $name, type: $it.type, args: $args, result: $result, flags: $flags}
      }
