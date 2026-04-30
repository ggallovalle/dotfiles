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
