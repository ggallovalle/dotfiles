export def "tbl docker container ls" [
  --all(-a) # List all the containers
] {
  let containers = (if $all {
    ^docker container ls --all --format "{{json .}}"
  } else {
    ^docker container ls --format "{{json .}}"
  })
  echo "hello world"

  ($containers |
  from json --objects
  )
}

export def "tbl docker image ls" [
  --all(-a) # List all the images
] {
  let images = (if $all {
    ^docker image ls --all --format "{{json .}}"
  } else {
    ^docker image ls --format "{{json .}}"
  })

  ($images |
  from json --objects
  )
}

