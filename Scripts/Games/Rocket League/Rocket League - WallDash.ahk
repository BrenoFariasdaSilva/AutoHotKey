#MaxThreadsPerHotkey 2
#IfWinActive ahk_exe RocketLeague.exe

F2::
Toggle := !Toggle
loop
{
    If not Toggle
        break

Click, Down Right
Sleep, 5
Click, Up Right
Sleep, 5
}
return														