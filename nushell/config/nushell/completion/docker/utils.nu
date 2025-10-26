use ./tablelized.nu *

export def "nu-complete docker image ls" [] {
  (
    tbl docker image ls |
    each { |it| $it.Repository + ":" +  $it.Tag }
  )
}

export def "nu-complete docker container ls" [] {
  (
    tbl docker container ls |
    select ID Image Names |
    each { |it|  
        {value: $it.ID, description: $"name: ($it.Names), image: ($it.Image)"} 
    }
  )
}

export def "nu-complete docker container ls-all" [] {
  (
    tbl docker container ls --all |
    select ID Image Names |
    each { |it|  
        {value: $it.ID, description: $"name: ($it.Names), image: ($it.Image)"} 
    }
  )
}

