export def "tbl git log" [

] {
  (
    git log --pretty=format:'{%n  ^^^^commit^^^^: ^^^^%H^^^^,%n  ^^^^abbreviated_commit^^^^: ^^^^%h^^^^,%n  ^^^^tree^^^^: ^^^^%T^^^^,%n  ^^^^abbreviated_tree^^^^: ^^^^%t^^^^,%n  ^^^^parent^^^^: ^^^^%P^^^^,%n  ^^^^abbreviated_parent^^^^: ^^^^%p^^^^,%n  ^^^^refs^^^^: ^^^^%D^^^^,%n  ^^^^encoding^^^^: ^^^^%e^^^^,%n  ^^^^subject^^^^: ^^^^%s^^^^,%n  ^^^^sanitized_subject_line^^^^: ^^^^%f^^^^,%n  ^^^^commit_notes^^^^: ^^^^%N^^^^,%n  ^^^^verification_flag^^^^: ^^^^%G?^^^^,%n  ^^^^signer^^^^: ^^^^%GS^^^^,%n  ^^^^signer_key^^^^: ^^^^%GK^^^^,%n  ^^^^author^^^^: {%n    ^^^^name^^^^: ^^^^%aN^^^^,%n    ^^^^email^^^^: ^^^^%aE^^^^,%n    ^^^^date^^^^: ^^^^%aI^^^^%n  },%n  ^^^^commiter^^^^: {%n    ^^^^name^^^^: ^^^^%cN^^^^,%n    ^^^^email^^^^: ^^^^%cE^^^^,%n    ^^^^date^^^^: ^^^^%cI^^^^%n  }%n},'
    | sed 's/"/\\"/g' 
    | sed 's/\^^^^/"/g' 
    | sed "$ s/,$//" 
    | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g'
    | awk 'BEGIN { print("[") } { print($0) } END { print("]") }'
    | from json
  )
}

def "inside git" [] {
  let stdr_length = (do -i { git rev-parse --is-inside-work-tree } 
  | complete 
  | get stderr 
  | str length)

  $stdr_length == 0
}


export def "tbl git log authors" [

] {
  if (inside git) {
    (
      git shortlog --summary --numbered --email 
      | from csv --separator "\t" --noheaders 
      | rename commit_count author 
      | each { |it|
          let commit_count = ($it.commit_count | into int)

          let author_encoded = (
            $it.author
            | str trim --right --char ">"
            | split row "<"
          )

          {
           author_name: ($author_encoded.0 | str trim --right),
           author_email: $author_encoded.1,
           commit_count: $commit_count,
          }  
        }
    )
  } else {
    []
  }
}

