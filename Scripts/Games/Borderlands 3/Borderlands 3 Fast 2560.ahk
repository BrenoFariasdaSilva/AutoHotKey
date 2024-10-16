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
Sleep, 12500
Send {4 down}
Sleep, 100
Send {4 up}
Sleep, 100
MouveMouseRelative(400, 0)
Send {w down}
Sleep, 5300
Send {w up}
MouveMouseRelative(370, 0)
Send {w down}
Sleep, 1500
Send {w up}
Sleep, 1750
MouseClick, left
Sleep, 1550
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 1150
MouseClick, left
Sleep, 1150
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 1000
MouseClick, left
Sleep, 900
MouseClick, left
Sleep, 100
Send {w down}
Sleep, 2500
MouseClick, left
Send {w up}
Sleep, 100
Send {d down}
Sleep, 1250
Send {d up}
Sleep, 500
Send {a down}
Sleep, 2500
Send {a up}
Send, 450
Send {d down}
Sleep, 700
Send {d up}
Sleep, 100
MouseClick, left
Send {s down}
Sleep, 2500
Send {s up}
Sleep, 100
Send {w down}
Sleep, 1150
Send {w up}
MouseClick, left
Sleep, 100
Send {d down}
Sleep, 1000
Send {d up}
Sleep, 100
Send {a down}
Sleep, 2000
Send {a up}
Sleep, 100
MouseClick, left
Sleep, 100
Send {d down}
Sleep, 850
Send {d up}
Sleep, 100
MouseClick, left
Send {w down}
Sleep, 1500
Send {w up}
Sleep, 100
Send {esc}
Sleep, 750
MouseMove, 505, 644
Sleep, 750
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