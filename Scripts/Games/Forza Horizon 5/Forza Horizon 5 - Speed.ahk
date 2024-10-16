#MaxThreadsPerHotkey 2

F2::
Toggle := !Toggle
loop
{
    If not Toggle
        break

Sleep, 1000
Send {w down}
}
return														