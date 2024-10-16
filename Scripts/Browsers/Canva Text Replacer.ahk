#Requires AutoHotkey v2.0+
Toggle := false ; Initialize toggle state
TabsCount := 10 ; Define the number of tabs to process (you can change this value as needed)

; Function to toggle the replacement process
ToggleScript() {
	global Toggle ; Use the global Toggle variable
   Toggle := !Toggle ; Toggle the state
	if (Toggle) {
		SetTimer(TypeAndClear, 2000) ; Start the timer
	} else {
		SetTimer(TypeAndClear, 0) ; Stop the timer
	}
}

; F4 to start/stop the replacement process
F4:: {
	ToggleScript() ; Call the function to toggle the script
	return
}

; Helper function to remove all whitespace from a string
RemoveWhitespace(value) {
	return StrReplace(value, " ")
}

; Timer function that performs the replacements
TypeAndClear() {
	global Toggle, TabsCount ; Use the global Toggle and TabsCount variables
	if (Toggle) {
		Loop TabsCount { ; Use the TabsCount constant here
			; Define the dictionary of search-and-replace pairs
			pairs := Map(
				"[SUSPEITO 1]", "Elena Blackwood",
				"[SUSPEITO 2]", "Isabella Moreau",
				"[SUSPEITO 3]", "Liam Walsh",
				"[SUSPEITO 4]", "Marco Savelli",
				"[SUSPEITO 5]", "Rafael Costa",
				"[SUSPEITO 6]", "Luca Nikoli",
				"[SUSPEITO 7]", "Markus Nkosi",
				"[VITIMA]", "Adrian Blackwood"
			)

			; First, handle the search and replace for keys with "@" suffix
			for key, value in pairs {
				; Add "@" to the key (suffix)
				at_key := key "@"

				; Remove whitespaces from the value
				whitespace_removed_value := RemoveWhitespace(value)

				; Press Escape to clear any existing search
				Send("{Esc}")
				Sleep 500 ; Wait for escape action

				; Control + F to search
				Send("^f")
				Sleep 500 ; Wait for the search bar to appear

				; Type the "@"-suffixed key (what you're searching for)
				SendInput(at_key)
				Sleep 500

				; Press Tab three times to move focus to the replacement field
				Send("{Tab 3}")
				Sleep 500

				; Type the whitespace-removed value (the replacement)
				SendInput(whitespace_removed_value)
				Sleep 500

				; Press Tab two times to move focus to the replace button (if needed)
				Send("{Tab 2}")
				Sleep 500

				; Press Enter to confirm the replacement
				Send("{Enter}")
				Sleep 500
			}

			; After "@" replacements, perform normal replacements
			for key, value in pairs {
				; Press Escape to clear any existing search
				Send("{Esc}")
				Sleep 500 ; Wait for escape action

				; Control + F to search
				Send("^f")
				Sleep 500 ; Wait for the search bar to appear

				; Type the current key (what you're searching for)
				SendInput(key)
				Sleep 500

				; Press Tab three times to move focus to the replacement field
				Send("{Tab 3}")
				Sleep 500

				; Type the current value (the replacement)
				SendInput(value)
				Sleep 500

				; Press Tab two times to move focus to the replace button (if needed)
				Send("{Tab 2}")
				Sleep 500

				; Press Enter to confirm the replacement
				Send("{Enter}")
				Sleep 500
			}

			; Show a message box after one replacement cycle
			MsgBox("All replacements for this tab finished!")

			; Control + Tab to switch to the next browser tab
			Send("^Tab")
			Sleep 2000 ; Wait for 2 seconds before starting replacements again
		}

		MsgBox("All " TabsCount " tabs processed!") ; Show a message box after all loops
		Toggle := false ; Automatically turn off after finishing
		SetTimer(TypeAndClear, 0) ; Stop the timer
	}
}
return

; Ensure the script only works in supported browsers

HotIfWinActive("ahk_exe msedge.exe") ; Microsoft Edge
Hotkey("F4", ToggleScript)

HotIfWinActive("ahk_exe chrome.exe") ; Google Chrome
Hotkey("F4", ToggleScript)

HotIfWinActive("ahk_exe firefox.exe") ; Mozilla Firefox
Hotkey("F4", ToggleScript)

HotIfWinActive("ahk_exe opera.exe") ; Opera
Hotkey("F4", ToggleScript)

HotIfWinActive("") ; End conditional hotkeys, remove context sensitivity
