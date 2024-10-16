#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 2

F4::
Toggle := !Toggle
loop
{
    If not Toggle
        break
    borderlands()
   
}
Return
^#!F4::ExitApp

borderlands(){
#IfWinActive ahk_exe Borderlands3.exe
Sleep, 3000
MouseMove, 158, 164
Sleep, 500
Send {enter}
Sleep, 1000
MouseMove, 143, 149
Sleep, 500
Send {enter}
Sleep, 20000
MouveMouseRelative(400, 0)
Send {w down}
Sleep,5500
Send {w up}
MouveMouseRelative(370, 0)
Send {w down}
Sleep,2000
Send {w up}
Sleep, 1500
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 1000
Send {w down}
Sleep, 3000
Send {w up}
Sleep, 4000
Send {d down}
Sleep, 3500
Send {d up}
Send {a down}
Sleep, 3500
Send {a up}
Send {d down}
Sleep, 1500
Send {d up}
Send {s down}
Sleep, 2000
Send {s up}
Send {w down}
Sleep, 3500
Send {w up}
Send {esc}
Sleep, 1000
MouseMove, 117, 388
Sleep, 1000
Send {enter}
Sleep, 500
MouseMove, 329, 386
Sleep, 500
Send {enter}
Sleep, 3000
}

MouveMouseRelative(dx,dy)
{
DllCall("mouse_event", "UInt", 0x0001, "Int", dx, "Int", dy, "UInt", 0, "UPtr", 0)
}