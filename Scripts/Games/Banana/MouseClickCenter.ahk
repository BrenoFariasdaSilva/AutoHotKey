#Persistent

F4::ToggleScript()

ToggleScript() {
    global Toggle
    Toggle := !Toggle
    if (Toggle) {
        SetTimer, SimulateClicks, 100 ; 10 clicks per second (1000ms / 10 = 100ms per click)
    } else {
        SetTimer, SimulateClicks, Off
    }
}

SimulateClicks:
    global ClickCount
    if (ClickCount >= 2000) {
        SetTimer, SimulateClicks, Off
        ClickCount := 0
        return
    }
    
    Click, 960, 540 ; Middle of a 1080p screen (1920/2, 1080/2)
    ClickCount++
return
