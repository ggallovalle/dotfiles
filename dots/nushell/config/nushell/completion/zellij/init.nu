use utils/str.nu *

def "nu-complete zellij layout" [buffer: string, position: int] {
  (
  ls "~/.config/zellij/layouts/"
  | get name 
  | each { |it|
      $it | path basename  | h str change-extension "" 
    }
  )
}

def "nu-complete zellij direction" [buffer: string, position: int] {
  [up down left right]
}

def "h zellij sessions" [] {
    ^zellij list-sessions 
    | from ssv --noheaders 
    | get column1 
}

def "nu-complete zellij sessions" [buffer: string, position: int] {
  h zellij sessions
  | filter {|it| $it | str contains --not "(current)" }
}


export extern "zellij" [
  --layout(-l): string@"nu-complete zellij layout" # Name of a predeined layout inside the layout directory
  --help # Get help text
]

# Attach to a session
export extern "zellij attach" [
  session?: string@"nu-complete zellij sessions"
  --create(-c) 
  # Numbef or session index in the active sessions ordered creation date
  --help 
  # Get help text
]

# Send actions to a specific session
export extern "zellij action" [
  --help # Get help text
]

# Create a new tab, optionally with a specified tab layout and name
export extern "zellij action new-tab" [
  --cwd: string # Change the working directory of the new tab
  --layout(-l): string@"nu-complete zellij layout" # Name of a predeined layout inside the layout directory
  --name(-n): string # Name of the new tab
  --help # Get help text
]

# Close the focused pane
export extern "zellij action close-pane" [
  --help # Get help text
]

# Close the current tab
export extern "zellij action close-tab" [
  --help # Get help text
]

# Dump the focused pane to a file
export extern "zellij action dump-screen" [
  --full(-f) # Dump the pane with full scrollback
  --help # Get help text
]

# Open the specified file in a new  zellij pane with your default env.EDITOR
export extern "zellij action edit" [
  --cwd: string # Change the working directory of the new tab
  --direction(-d): string@"nu-complete zellij direction"  # Direction to open the new pane in
  --floating(-f) # Open the new pane in floating mode
  --help # Get help text
]

# Open the pane scrollback in your default editor
export extern "zellij action edit-scrollback" [
  --help # Get help text
]

# Change focus to the next pane
export extern "zellij action focust-next-pane" [
  --help # Get help text
]

# Change focus to the previous pane
export extern "zellij action focus-previous-pane" [
  --help # Get help text
]

# Go to the next tab
export extern "zellij action go-to-next-tab" [
  --help # Get help text
]

# Go to the previous tab
export extern "zellij action go-to-previous-tab" [
  --help # Get help text
]

# Go to tab with index
export extern "zellij action go-to-tab" [
  index: int
  --help # Get help text
]

# Scroll up half page in the focus pane
export extern "zellij action half-page-scroll-up" [
  --help # Get help text
]

# Move the focused pane in the specified direction
export extern "zellij action move-focus" [
  direction: string@"nu-complete zellij direction"
  --help # Get help text
]

# Move focus to the pane or tab (if on screen edge) in the specified direction
export extern "zellij action move-focus-or-tab" [
  direction: string@"nu-complete zellij direction"
  --help # Get help text
]

# Change the location of the focused pane in the specified direction 
export extern "zellij action move-pane" [
  direction: string@"nu-complete zellij direction"
  --help # Get help text
]

# Custom Open a new pane in the specified direction, if no direction is specified,
# will try to use the biggest available space
export extern "zellij action new-pane" [
  ...command: any
  --close-on-exit(-c)
  # Close the pane immediately when its command exits
  --cwd: string 
  # Change the working directory of the new tab
  --direction(-d): string@"nu-complete zellij direction"  
  # Direction to open the new pane in
  --floating(-f)
  # Open the new pane in floating mode
  --name(-n): string
  # Name of the new pane
  --start-suspended(-s) 
  # Start the command suspended, only running it after you first press ENTER
  --help 
  # Get help text
]

# Execute all unit and integration tests and build examples of a local package
export extern "cargo test" [
  test_name?: string
  ...args: any
]

