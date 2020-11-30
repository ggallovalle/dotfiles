### generic
alias gradle.h='gradle help'
alias gradle.run='gradle'
# gradle.search
function gradle.new() {
  mkcd $1
  gradle init --dsl kotlin
}
alias gradle.watch='gradle --continuous run'


### install
# gradle.in
# gradle.un


### manage dependencies
function gradle.ls() {
  gradle app:dependencies --configuration implementation
}
# gradle.lsD
function gradle.lsT() {
  gradle app:dependencies --configuration testImplementation
}
# gradle.ad
# gradle.adD
# gradle.adT
# gradle.rm
# gradle.rmD
# gradle.rmT

### others
# Looks for a gradlew file in the current working directory
# or any of its parent directories, and executes it if found.
# Otherwise it will call gradle directly.
function gradle-or-gradlew() {
  # find project root
  # taken from https://github.com/gradle/gradle-completion
  local dir="$PWD" project_root="$PWD"
  while [[ "$dir" != / ]]; do
    if [[ -f "$dir/settings.gradle" || -f "$dir/settings.gradle.kts" || -f "$dir/gradlew" ]]; then
      project_root="$dir"
      break
    fi
    dir="${dir:h}"
  done

  # if gradlew found, run it instead of gradle
  if [[ -f "$project_root/gradlew" ]]; then
    +zinit-message "{warn}executing gradlew instead of gradle.{rst}"
    "$project_root/gradlew" "$@"
  else
    command gradle "$@"
  fi
}


alias gradle=gradle-or-gradlew
