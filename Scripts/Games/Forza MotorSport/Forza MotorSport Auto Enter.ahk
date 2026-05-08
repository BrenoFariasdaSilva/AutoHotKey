; AutoHotkey script: waits 1 seconds, then sends {Enter} every second when toggled on with F4.
; After every 300 Enter presses, it sends: Hold Down → Left click → Right click (each 100ms press + 100ms sleep).

#NoEnv
SendMode Input

running := false
enterCount := 0

F4::
    running := !running
    if (running) {
        SetTimer, StartLoop, -1000       ; Wait 1 seconds before starting
    } else {
        SetTimer, StartLoop, Off
        SetTimer, PressKeys, Off
    }
return

StartLoop:
    if (running) {
        SetTimer, PressKeys, 1000        ; Run every 1 second
    }
return

PressKeys:
    if (!running) {
        SetTimer, PressKeys, Off
        return
    }

    ; Send Enter
    Send, {Enter}
    enterCount++

    ; After 300 Enters, perform Left and Right while holding Down
    if (enterCount >= 300) {
        enterCount := 0

        ; Hold DOWN
        Send, {Down down}

        Sleep, 200
        ; LEFT key (100ms press + 100ms pause)
        Send, {Left down}
        Sleep, 100
        Send, {Left up}
        Sleep, 100

        ; RIGHT key (100ms press + 100ms pause)
        Send, {Right down}
        Sleep, 100
        Send, {Right up}
        Sleep, 200

        ; Release DOWN
        Send, {Down up}
    }
return
