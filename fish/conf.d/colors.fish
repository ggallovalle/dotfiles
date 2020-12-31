# hash definition
set -U _k_colors
set -U _v_colors
# colors
set -a _k_colors normal
set -a _v_colors (set_color normal)
set -a _k_colors black
set -a _v_colors (set_color black)
set -a _k_colors red
set -a _v_colors (set_color red)
set -a _k_colors green
set -a _v_colors (set_color green)
set -a _k_colors yellow
set -a _v_colors (set_color yellow)
set -a _k_colors blue
set -a _v_colors (set_color blue)
set -a _k_colors magenta
set -a _v_colors (set_color magenta)
set -a _k_colors cyan
set -a _v_colors (set_color cyan)
set -a _k_colors white
set -a _v_colors (set_color white)
# brigth colors
set -a _k_colors brBlack
set -a _v_colors (set_color brblack)
set -a _k_colors brRed
set -a _v_colors (set_color brred)
set -a _k_colors brGreen
set -a _v_colors (set_color brgreen)
set -a _k_colors brYellow
set -a _v_colors (set_color bryellow)
set -a _k_colors brBlue
set -a _v_colors (set_color brblue)
set -a _k_colors brMagenta
set -a _v_colors (set_color brmagenta)
set -a _k_colors brCyan
set -a _v_colors (set_color brcyan)
set -a _k_colors brWhite
set -a _v_colors (set_color brwhite)
# background colors
set -a _k_colors bgBlack
set -a _v_colors (set_color -b black)
set -a _k_colors bgRed
set -a _v_colors (set_color -b red)
set -a _k_colors bgGreen
set -a _v_colors (set_color -b green)
set -a _k_colors bgYellow
set -a _v_colors (set_color -b yellow)
set -a _k_colors bgBlue
set -a _v_colors (set_color -b blue)
set -a _k_colors bgMagenta
set -a _v_colors (set_color -b magenta)
set -a _k_colors bgCyan
set -a _v_colors (set_color -b cyan)
set -a _k_colors bgWhite
set -a _v_colors (set_color -b white)
# modifiers
set -a _k_colors bold
set -a _v_colors (set_color --bold)
set -a _k_colors dim
set -a _v_colors (set_color --dim)
set -a _k_colors italic
set -a _v_colors (set_color --dim)
set -a _k_colors underline
set -a _v_colors (set_color --underline)
set -a _k_colors strike
set -a _v_colors \e\[9m
