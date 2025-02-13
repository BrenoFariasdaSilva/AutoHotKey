#Requires AutoHotkey v2.0+
Toggle := false ; Initialize toggle state
TabsCount := 9 ; Define the number of tabs to process (you can change this value as needed)

; Auto-execute section: Set up context-sensitive hotkeys
HotIfWinActive("ahk_exe msedge.exe") ; Microsoft Edge
Hotkey("F4", ToggleScript)

HotIfWinActive("ahk_exe chrome.exe") ; Google Chrome
Hotkey("F4", ToggleScript)

HotIfWinActive("ahk_exe firefox.exe") ; Mozilla Firefox
Hotkey("F4", ToggleScript)

HotIfWinActive("ahk_exe opera.exe") ; Opera
Hotkey("F4", ToggleScript)

; Reset HotIfWinActive so it applies globally after these two
HotIfWinActive()

; Function to toggle the replacement process
ToggleScript(*) {
	global Toggle ; Use the global Toggle variable
	Toggle := !Toggle ; Toggle the state
	if (Toggle) {
		SetTimer(TypeAndClear, 2000) ; Start the timer
	} else {
		SetTimer(TypeAndClear, 0) ; Stop the timer
		MsgBox("Script Stopped Executing!") ; Optional: Notify that the script has stopped
	}
}

; Helper function to remove all whitespace from a string
RemoveWhitespace(value) {
	return StrReplace(value, A_Space, "")
}

; Timer function that performs the replacements
TypeAndClear() {
	global Toggle, TabsCount ; Use the global Toggle and TabsCount variables
	if (Toggle) {
		Loop TabsCount { ; Use the TabsCount constant here
			; Define the dictionary of search-and-replace pairs
			pairs := Map(
				"Jason Marques", "[Suspeito 1]",
				"Mike Costa", "[Suspeito 2]",
				"Laura Rodrigues", "[Suspeito 3]",
				"Adam Pereira", "[Suspeito 4]",
				"Joseph Lopez", "[Suspeito 5]",
				"Marko Vidmar", "[Suspeito 6]",
				"Lucia Navarro", "[Suspeito 7]",
				"Sara Dias", "[Vitima_Passado]",
				"Emily Silva", "[Vitima]"
			)

			; First, handle the search and replace for keys with "@" suffix
			for key, value in pairs {
				; Add "@" to the key (suffix)
				at_key := key "@"

				; Remove whitespaces from the value
				whitespace_removed_value := RemoveWhitespace(at_key)

				; Press Escape to clear any existing search
				Send("{Esc}")
				Sleep 1000 ; Wait for escape action

				; Control + F to search
				Send("^f")
				Sleep 1000 ; Wait for the search bar to appear

				; Type the "@"-suffixed key (what you're searching for)
				SendInput(whitespace_removed_value)
				Sleep 1000

				; Press Tab three times to move focus to the replacement field
				Send("{Tab}")
				Sleep 500
				Send("{Tab}")
				Sleep 500
				Send("{Tab}")
				Sleep 500

				; Type the whitespace-removed value (the replacement)
				SendInput(value "@")
				Sleep 1000

				; Press Tab two times to move focus to the replace button (if needed)
				Send("{Tab}")
				Sleep 500
				Send("{Tab}")
				Sleep 500

				; Press Enter to confirm the replacement
				Send("{Enter}")
				Sleep 1000
			}

			; After "@" replacements, perform normal replacements
			for key, value in pairs {
				; Press Escape to clear any existing search
				Send("{Esc}")
				Sleep 1000 ; Wait for escape action

				; Control + F to search
				Send("^f")
				Sleep 1000 ; Wait for the search bar to appear

				; Type the current key (what you're searching for)
				SendInput(key)
				Sleep 1000

				; Press Tab three times to move focus to the replacement field
				Send("{Tab}")
				Sleep 500
				Send("{Tab}")
				Sleep 500
				Send("{Tab}")
				Sleep 500

				; Type the current value (the replacement)
				SendInput(value)
				Sleep 1000

				; Press Tab two times to move focus to the replace button (if needed)
				Send("{Tab}")
				Sleep 500
				Send("{Tab}")
				Sleep 500

				; Press Enter to confirm the replacement
				Send("{Enter}")
				Sleep 1000
			}

			; Perform F5 to reload the page
			Sleep 1000 ; Wait for the page to reload
			Send("{F5}")
			Sleep 2000 ; Wait for the page to reload

			; Control + Tab to switch to the next browser tab
			Sleep 1000
			Send("{Ctrl down}")
			Send("{Tab}")
			Sleep 500 ; Give some time for the tab switch to register
			Send("{Ctrl up}") ; Release the Control key
			Sleep 2000 ; Wait for 2 seconds before starting replacements again
		}

		MsgBox("All " TabsCount " tabs processed!") ; Show a message box after all loops
		Toggle := false ; Automatically turn off after finishing
		SetTimer(TypeAndClear, 0) ; Stop the timer
	}
}

; Return to stop further execution
Return
