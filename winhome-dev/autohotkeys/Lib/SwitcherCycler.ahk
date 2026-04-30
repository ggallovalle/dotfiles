#Requires AutoHotkey v2.0

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

        loop len {
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
}
