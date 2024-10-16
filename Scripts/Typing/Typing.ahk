#Persistent
SetTimer, TypeAndClear, 2000
return

F4::ToggleScript()
return

TypeAndClear:
    if (Toggle) {
        Send, hello world
        Sleep, 500
        Send, ^a
        Sleep, 50
        Send, {Backspace}
    }
return

ToggleScript() {
    Toggle := !Toggle
    SetTimer, TypeAndClear, % (Toggle ? "2000" : "Off")
}
