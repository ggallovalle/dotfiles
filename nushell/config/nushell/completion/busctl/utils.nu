use ./tablelized.nu *


export def "nu-complete busctl list services" [buffer: string, position: int] {
  (
  ^busctl list --json=short 
  | from json
  | get name
  )
}

export def "nu-complete busctl list objects" [buffer: string, position: int] {
  let args = ($buffer | split row " ")
  let a_service = $args.2
  tbl busctl tree $a_service | get objects
}

export def "nu-complete busctl list interfaces" [buffer: string, position: int] {
  let args = ($buffer | split row " ")
  let a_service = $args.2
  let a_object = $args.3

  (
  tbl busctl introspect $a_service $a_object
  | where type == "interface"
  | get name
  )
}

export def "nu-complete busctl list methods" [buffer: string, position: int] {
  let args = ($buffer | split row " ")
  let a_service = $args.2
  let a_object = $args.3
  let a_interface = $args.4
  (
  tbl busctl introspect $a_service $a_object $a_interface
  | get name
  )
}

export def "nu-complete busctl get args" [buffer: string, position: int] {
  let args = ($buffer | split row " ")
  let a_service = $args.2
  let a_object = $args.3
  let a_interface = $args.4
  let a_method = $args.5

  (
    tbl busctl introspect $a_service $a_object $a_interface
    | where name == $a_method
    | get args
  )
}

