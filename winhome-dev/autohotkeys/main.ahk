#Requires AutoHotkey v2.0

#Include Lib/SwitcherEntry.ahk
#Include Lib/SwitcherCycler.ahk

; how to use:
; - arrays
; - maps
; - objects
; - classes
; @see https://www.autohotkey.com/docs/v2/Objects.html

; replaced with 
; @see https://github.com/adambasis/public-quick-switch
env_browser := "chrome.exe"
; env_browser := "firefox.exe"
; env_note_apps := "Obsidian.exe"
env_note_apps := "Notion.exe"

cycler := SwitcherCycler([
    SwitcherEntry(env_note_apps),
    SwitcherEntry(env_browser),
    SwitcherEntry("ChatGPT.exe"),
    SwitcherEntry("Zed.exe"),
    SwitcherEntry("alacritty.exe"),
    SwitcherEntry("ClickUp.exe")
])

; diable it
#Space::return
^#Space::return

; ================================
; Keybindings
; ================================
; #h:: cycler.Focus(1)
#j:: cycler.Focus(2)
#k:: cycler.Focus(3)
; https://learn.microsoft.com/en-us/answers/questions/3975959/how-to-remove-the-(windows-key-l)-shortcut-on-wind
#l:: cycler.Focus(4)
#;:: cycler.Focus(5)
#':: cycler.Focus(6)


; #Space:: cycler.Next()
; #+Space:: cycler.Previous()

#HotIf WinActive("ahk_exe Discord.exe")
Enter::Send("+{Enter}")      ; Enter inserts a newline (Shift+Enter)
^Enter::Send("{Enter}")      ; Ctrl+Enter sends the message
\::Send("{Enter}")           ; "\" sends message
#HotIf

#HotIf WinActive("ahk_exe Copilot.exe")
Enter::Send("+{Enter}")      ; Enter inserts newline
^Enter::Send("{Enter}")      ; Ctrl+Enter sends
\::Send("{Enter}")           ; "\" sends message
#HotIf

#HotIf WinActive("ahk_exe ChatGPT.exe")
Enter::Send("+{Enter}")      ; Enter inserts newline
^Enter::Send("{Enter}")      ; Ctrl+Enter sends
\::Send("{Enter}")           ; "\" sends message
#HotIf

#HotIf WinActive("T3 Code (Alpha) (archlinux) ahk_class RAIL_WINDOW ahk_exe msrdc.exe")
Enter::Send("+{Enter}")      ; Enter inserts newline
^Enter::Send("{Enter}")      ; Ctrl+Enter sends
\::Send("{Enter}")           ; "\" sends message
#HotIf
