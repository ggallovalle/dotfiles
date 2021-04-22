set -x OMF_CONFIG "$__fish_config_dir/omf"
set -x OMF_PATH "$XDG_DATA_HOME/omf"
# Load Oh My Fish configuration.
test -d $OMF_PATH
or git clone https://github.com/oh-my-fish/oh-my-fish $OMF_PATH
source $OMF_PATH/init.fish
