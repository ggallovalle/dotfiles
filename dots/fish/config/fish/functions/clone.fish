function clone
    # $1 repository
    # $2 tmsut tags separated by comma
    set -l repo $argv[1]
    set -l tags $argv[2]
    set -l new_repo "grepos['$repo']='$tags'"
    set -l ghq_script "$DOTFILES/scripts/ghq"
    set -l marker '#_others'
    set -l sed_command "/^$marker.*/i "$new_repo
    sed -i $sed_command $ghq_script
    bash $ghq_script
end
