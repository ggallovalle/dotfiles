# [[ stuff that needs to start first
# ALWAYS FIRST
source "$__fish_config_dir/exports.fish"
#
load-component asdf
# END ]]
# [[ fish stuff
fish_vi_key_bindings
load-component shell-is-fish
# END ]]

# [[ components
load-component exa
load-component git
load-component sane-defaults
load-component lua
load-component whereami
# END  ]]

# [[ this two needs to always be the last two
# Omf needs to be inline in config.fish or it gives some nasty errors, sometimes
load-component omf
load-component starship
# END ]]
