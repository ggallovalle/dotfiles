#Requires AutoHotkey v2.0

; ================================
; SwitcherEntry
; ================================
class SwitcherEntry {
    __New(program) {
        this.exe := program
        this.sig := "ahk_exe " program
    }

    Exist() {
        return WinExist(this.sig)
    }

    IsActive() {
        return WinActive(this.sig)
    }

    Activate() {
        if this.Exist()
            WinActivate(this.sig)
    }

    Run() {
        Run(this.exe)
    }
}

; ================================
; SwitcherCycler
; ================================
class SwitcherCycler {
    __New(entries) {
        this.entries := entries
        this.index := 0
        this.lastWin := 0
    }

    Next() {
        this.Cycle(1)
    }

    Previous() {
        this.Cycle(-1)
    }

    Focus(index) {
        entry := this.entries[index]

        current := WinActive("A")

        ; Toggle back to previous window
        if entry.IsActive() && this.lastWin {
            WinActivate(this.lastWin)
            return
        }

        this.lastWin := current

        if entry.Exist()
            entry.Activate()
        else
            entry.Run()

        this.index := index
    }

    Cycle(direction) {
        len := this.entries.Length

        Loop len {
            this.index += direction

            if (this.index > len)
                this.index := 1
            else if (this.index < 1)
                this.index := len

            entry := this.entries[this.index]

            if entry.Exist() {
                this.Focus(this.index)
                return
            }
        }

        ; fallback: run current entry
        this.Focus(this.index)
    }

  Tab() {
    len := this.entries.Length

    ; Find currently active entry
    currentIndex := 0
    for i, entry in this.entries {
        if entry.IsActive() {
            currentIndex := i
            break
        }
    }

    ; If none active, fallback to stored index
    if (currentIndex = 0)
        currentIndex := this.index

    nextIndex := currentIndex

    Loop len {
        nextIndex++

        if (nextIndex > len)
            nextIndex := 1

        entry := this.entries[nextIndex]

        if entry.Exist() {
            this.Focus(nextIndex)
            return
        }
    }

    ; fallback: run next target if nothing is open
    this.Focus(nextIndex)
  }

  TabHold() {
    len := this.entries.Length

    ; Find currently active entry
    currentIndex := 0
    for i, entry in this.entries {
        if entry.IsActive() {
            currentIndex := i
            break
        }
    }

    if (currentIndex = 0)
        currentIndex := this.index

    nextIndex := currentIndex

    ; Wait for Tab press (since Win is already down)
    KeyWait("Tab", "D")

    while GetKeyState("LWin", "P") {
        found := false

        Loop len {
            nextIndex++

            if (nextIndex > len)
                nextIndex := 1

            entry := this.entries[nextIndex]

            if entry.Exist() && this.IsWindowUsable(entry) {
                this.Focus(nextIndex)
                found := true
                break
            }
        }

        if !found {
            ; fallback: run something
            this.Focus(nextIndex)
        }

        Sleep(120) ; speed of cycling (tweak to taste)
    }
  }

  IsWindowUsable(entry) {
      hwnd := WinExist(entry.sig)

      if !hwnd
          return false

      ; Skip minimized
      if WinGetMinMax(hwnd) = -1
          return false

      ; Skip invisible
      return DllCall("IsWindowVisible", "ptr", hwnd)
  }
}

; ================================
; App Definitions
; ================================
apps := [
    SwitcherEntry("Obsidian.exe"),
    SwitcherEntry("firefox.exe"),
    SwitcherEntry("ChatGPT.exe"),
    SwitcherEntry("Zed.exe"),
    SwitcherEntry("alacritty.exe"),
    SwitcherEntry("Marvin.exe")
]

cycler := SwitcherCycler(apps)

; ================================
; Keybindings
; ================================
#h::cycler.Focus(1)
#j::cycler.Focus(2)
#k::cycler.Focus(3)
#l::cycler.Focus(4)
#;::cycler.Focus(5)
#'::cycler.Focus(6)

#Space::cycler.Next()
#+Space::cycler.Previous()
#Tab::{
    cycler.Tab()
}

