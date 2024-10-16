#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 2

F3::
Toggle := !Toggle
loop
{
    If not Toggle
        break
    ForzaHorizon5()
   
}
Return
^#!F4::ExitApp

ForzaHorizon5(){
Send {enter}
sleep, 10
}

MouveMouseRelative(dx,dy)
{
DllCall("mouse_event", "UInt", 0x0001, "Int", dx, "Int", dy, "UInt", 0, "UPtr", 0)
}