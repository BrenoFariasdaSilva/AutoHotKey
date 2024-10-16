#MaxThreadsPerHotkey 2

F2::
Toggle := !Toggle
loop
{
    If not Toggle
        break

Sleep, 1000
Send {w down}
Sleep, 160000
Send {w up}
Sleep, 100
}
return														