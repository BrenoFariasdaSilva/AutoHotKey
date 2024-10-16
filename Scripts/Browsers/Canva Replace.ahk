Toggle := false ; Initialize toggle state

; Function to toggle the replacement process
ToggleScript() {
    global Toggle ; Use the global Toggle variable
    Toggle := !Toggle ; Toggle the state
    if (Toggle) {
        SetTimer(), TypeAndClear(), 2000 ; Start the timer
    } else {
        SetTimer(), TypeAndClear(), Off ; Stop the timer
    }
}

; F4 to start/stop the replacement process
F4::
    ToggleScript() ; Call the function to toggle the script
return

; Timer function that performs the replacements
TypeAndClear():
    if (Toggle) {
       ; Define the dictionary of search-and-replace pairs
        pairs := { "[SUSPEITO 1]": "Eduarda Neto"
                 , "[SUSPEITO 2]": "Mafalda Carvalho"
                 , "[SUSPEITO 3]": "Guilherme Costa"
                 , "[SUSPEITO 4]": "-"
                 , "[SUSPEITO 5]": "Constança Dionísio"
                 , "[SUSPEITO 6]": "Vera Dominguez"
                 , "[SUSPEITO 7]": "-"
                 , "[VITIMA]": "Rafaela Florêncio"
                 }

       ; Loop through each key-value pair in the dictionary
        for key, value in pairs {
           ; Control + F to search
            Send ^f
            Sleep 500 ; Wait for the search bar to appear

           ; Type the current key (what you're searching for)
            SendInput %key%
            Sleep 500

           ; Press Tab three times to move focus to the replacement field
            Send {Tab 3}
            Sleep 500

           ; Type the current value (the replacement)
            SendInput %value%
            Sleep 500

           ; Press Tab two times to move focus to the replace button (if needed)
            Send {Tab 2}
            Sleep 500

           ; Press Enter to confirm the replacement
            Send {Enter}
            Sleep 500
        }

        MsgBox, All replacements finished! ; Show a message box when done
        Toggle := false ; Automatically turn off after finishing
        SetTimer, TypeAndClear, Off ; Stop the timer
    }
return
