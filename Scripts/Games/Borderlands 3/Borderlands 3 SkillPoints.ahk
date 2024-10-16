#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 2
MouseMove, 687, 942
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

MouseMove, 687, 942
MouseClick, Left
Sleep, 400
MouseMove, 1121, 445
MouseClick, Left 
Sleep, 400

MouseMove, 687, 942
MouseClick, Left
Sleep, 400
MouseMove, 1069, 479
MouseClick, Left
Sleep, 400

MouseMove, 687, 942
MouseClick, Left
Sleep, 400
MouseMove, 1109, 537 
MouseClick, Left
Sleep, 400

MouseMove, 687, 942
MouseClick, Left
Sleep, 400
MouseMove, 1160, 576 
MouseClick, Left
Sleep, 400

MouseMove, 687, 942
MouseClick, Left
Sleep, 400
MouseMove, 1128, 639 
MouseClick, Left
Sleep, 400

MouseMove, 687, 942
MouseClick, Left
Sleep, 400
MouseMove, 1147, 675
MouseClick, Left
Sleep, 400 

}

MouveMouseRelative(dx,dy)
{
DllCall("mouse_event", "UInt", 0x0001, "Int", dx, "Int", dy, "UInt", 0, "UPtr", 0)
}