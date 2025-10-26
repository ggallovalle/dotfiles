# Nushell Config File


# Get just the extern definitions without the custom completion commands
use utils/str.nu *
use utils/fzf.nu *
use utils/config.nu *
use completion/init.nu *

use configs/v0923.nu

export def "config dotfiles" [] {
  let target_dir = $"($env.HOME)/.dotfiles"
  (^zellij action new-pane --close-on-exit --floating
  --name dotfiles 
  --cwd $target_dir 
  -- nvim .
  )
}

export def "config dotfiles-new" [] {
  let target_dir = $"($env.HOME)/.dotfiles-new"
  (^zellij action new-pane --close-on-exit --floating
  --name dotfiles-new
  --cwd $target_dir 
  -- nvim .
  )
}

export def "config nu" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/nushell"
  (^zellij action new-pane --close-on-exit --floating
  --name nushell 
  --cwd $target_dir 
  -- nvim env.nu config.nu
  )
}

# Edit kitty configuration
export def "config kitty" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/kitty"
  (^zellij action new-pane --close-on-exit --floating
  --name kitty 
  --floating
  --cwd $target_dir 
  -- nvim kitty.conf
  )
}

# Edit bash configuration
export def "config bash" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/bash"
  (^zellij action new-pane --close-on-exit --floating
  --name bash 
  --cwd $target_dir 
  -- nvim bashrc
  )
}

# Edit astronvim configuration
export def "config astronvim" [] {
  let layout_dir = $"($env.XDG_CONFIG_HOME)/zellij/layouts"
  # let target_dir = $"($env.XDG_CONFIG_HOME)/astronvim"
  let target_dir = "~/.dotfiles-new/programs/nvim/config/astronvim"
  let layout = "astronvim"
  (zellij action new-tab 
  --layout $"($layout_dir)/($layout).kdl"
  --cwd $target_dir
  --name "astronvim"
  )
  # let target_dir = $"($env.XDG_CONFIG_HOME)/astronvim"
  # (^zellij action new-pane --close-on-exit --floating
  # --name astronvim 
  # --cwd $target_dir 
  # -- nvim lua/user/polish.lua lua/user/plugins/init.lua
  # )
}

# Edit nvim configuration
export def "config nvim" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/nvim"
  (^zellij action new-pane --close-on-exit --floating
  --name nvim 
  --cwd $target_dir 
  -- nvim  lua/core/plugins.lua lua/core/mappings.lua lua/core/utils/init.lua
  )
}

# Edit starship configuration
export def "config starship" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/starship"
  (^zellij action new-pane --close-on-exit --floating
  --name starship 
  --cwd $target_dir 
  -- nvim  rc.toml
  )
}

# Edit zellij configuration
export def "config zellij" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/zellij"
  (^zellij action new-pane --close-on-exit --floating
  --name zellij 
  --cwd $target_dir 
  -- nvim config.kdl
  )
}

# Edit wezterm configuration
export def "config wezterm" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/wezterm"
  (^zellij action new-pane --close-on-exit --floating
  --name wezterm 
  --cwd $target_dir 
  -- nvim rc.lua
  )
}

# Edit awesome configuration
export def "config awesome" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/awesome"
  (^zellij action new-pane --close-on-exit --floating
  --name awesome 
  --cwd $target_dir 
  -- nvim .
  )
}

# Edit zsh configuration
export def "config zsh" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/zsh"
  (^zellij action new-pane --close-on-exit --floating
  --name zsh 
  --cwd $target_dir 
  -- nvim .zshrc
  )
}

# Edit vscode configuration
export def "config vscode" [] {
  let target_dir = $"($env.XDG_CONFIG_HOME)/Code/User"
  (^zellij action new-pane --close-on-exit --floating
  --name vscode 
  --cwd $target_dir 
  -- nvim settings.json
  )
}
