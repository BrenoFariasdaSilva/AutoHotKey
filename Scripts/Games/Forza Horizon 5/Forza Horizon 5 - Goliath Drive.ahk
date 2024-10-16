#MaxThreadsPerHotkey 2

F2::
Toggle := !Toggle
loop
{
    If not Toggle
        break

Sleep, 1000
Send {w down}
Sleep, 169000
Send {w up}
Sleep, 100
Send {s down}
Sleep, 3000
Send {s up}
Sleep, 100
Send {w down}
Sleep, 5000
Send {w up}
Sleep, 100
Send {s down}
Sleep, 2000
Send {s up}
Sleep, 100
Send {w down}
Sleep, 169000
Send {w up}
Sleep, 100
Send {s down}
Sleep, 3000
Send {s up}
Sleep, 100
Send {w down}
Sleep, 5000
Send {w up}
Sleep, 100
Send {s down}
Sleep, 2000
Send {s up}
Sleep, 100
}
return														