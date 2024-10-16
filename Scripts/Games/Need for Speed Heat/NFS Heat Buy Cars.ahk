#MaxThreadsPerHotkey 2

F4::
Toggle := !Toggle
loop
{
    If not Toggle
        break

Sleep, 1000
Click, Down Right
Sleep, 1500
Send {enter}
Sleep, 1000
Send {enter}
Sleep, 1000
Send {Esc}
Sleep, 1000
}
return														