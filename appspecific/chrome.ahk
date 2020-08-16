/*
  Hotkey Documentation: http://ahkscript.org/docs/Hotkeys.htm

  Examples:

  Modifiers:
    +  - Shift
    ^  - Ctrl
    #  - Win
    !  - Alt
    &  - combine multiple keys
    <> - left/right key of the pair
    *  - fire the hotkey even if extra modifiers are being held down
    ~  - do not block the key's native function
*/

; Ctrl+Alt+C
^!c:: OpenOrShowAppBasedOnExeName("chrome.exe")

#IfWinActive ahk_exe chrome.exe
	; Mouse shortcuts for changing tabs
	!+WheelDown:: Send,^+{Tab}
  !+WheelUp:: Send, ^{Tab}

  ; Mouse shortcuts for changing tabs
	; !+LButton::Send, ^+{Tab}
	; !+RButton::Send, ^{Tab}

	F1::
		IfWinActive, New Tab
			Send ^l
		else
			Send ^t
		SendInput chrome`:`/`/extensions`/{Enter}
		Return
#IfWinActive
