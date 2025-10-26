export def "h str change-empty" [
  old_empty: string
  new_empty: string
  ] {
  if $in == $old_empty {
    $new_empty
  } else { $in }
}

export def "h str change-extension" [
  new_extension: string
] {
  let current = $in
  let new_str = "\$1" + $new_extension
  $current | str replace '(.+)\.\w+$' $new_str
}
