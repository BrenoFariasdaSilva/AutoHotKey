; F4 to start/stop scrolling
F4::
Toggle := !Toggle
if (Toggle) {
    SetTimer, ScrollDown, 100 ; Adjust the timer interval as needed
} else {
    SetTimer, ScrollDown, Off
}
return

ScrollDown:
    ; Adjust the number of lines scrolled and sleep time as needed
    Send {WheelDown 3}
    Sleep, 50
return
