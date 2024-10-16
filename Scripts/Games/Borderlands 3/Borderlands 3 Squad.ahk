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
return
Return
^#!F4::ExitApp

borderlands(){
#IfWinActive ahk_exe Borderlands3.exe
MouseMove, 580, 246
Sleep, 500
Send {enter}
Sleep, 1000
MouseMove, 581, 211
Sleep, 500
Send {enter}
Sleep, 30000
MouveMouseRelative(400, 0)
Send {w down}
Sleep,5500
Send {w up}
MouveMouseRelative(370, 0)
Send {w down}
Sleep,2000
Send {w up}
Sleep, 2000
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 800
MouseClick, left
Sleep, 800
MouseClick, left
Sleep, 800
MouseClick, left
Sleep, 800
MouseClick, left
Sleep, 800
MouseClick, left
Sleep, 800
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
Sleep, 20000
Send {esc}
Sleep, 1000
MouseMove, 505, 644
Sleep, 1000
Send {enter}
Sleep, 500
MouseMove, 776, 664
Sleep, 500
Send {enter}
Sleep, 5000
}

MouveMouseRelative(dx,dy)
{
DllCall("mouse_event", "UInt", 0x0001, "Int", dx, "Int", dy, "UInt", 0, "UPtr", 0)
}