# [[ stuff that needs to start first
# ALWAYS FIRST
#
load-component asdf
load-component kb
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
load-component az
# END  ]]

# [[ this two needs to always be the last two
# Omf needs to be inline in config.fish or it gives some nasty errors, sometimes
load-component omf
load-component starship
# END ]]
