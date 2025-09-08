# Getting Started

# Project structure

Each folder represents the configuration for a specific application or tool.
For example, the `alacritty` folder contains configuration files for the 
Alacritty terminal emulator, while the `git` folder contains configuration files
for git.


Inside of each folder, it will mirror the structure of where those files
should be placed and they adhere to the 'variable' name of the folder itself.
And instead of using a `.` prefix for hidden files, it uses a `dot_` prefix.
For example:

- zsh
  - home
    - dot_zshrc
    - dot_zshenv
  - config
    - zsh
      - zshrc
      - zshenv
