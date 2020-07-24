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
