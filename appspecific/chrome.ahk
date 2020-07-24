#IfWinActive, ahk_class Chrome_WidgetWin_1

	; Mouse shortcuts for changing tabs
	^+LButton::Send, ^+{Tab}
	^+RButton::Send, ^{Tab}

	; KB shortcuts for specific tabs
	!1::Send, ^1
	!2::Send, ^2
	!3::Send, ^3
	!4::Send, ^4
	!5::Send, ^5
	!6::Send, ^6

	F1::
		IfWinActive, New Tab
			Send ^l
		else
			Send ^t
		SendInput chrome`:`/`/extensions`/{Enter}
		Return
#IfWinActive
