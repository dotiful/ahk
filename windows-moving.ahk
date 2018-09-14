; --------------------------------------------------------------
; Windows moving
; --------------------------------------------------------------
!+c::
	WinGetActiveStats, cT, cW, cH, cX, cY
	SysGet, mon, MonitorWorkArea
	newX	:= (monRight - cW) / 2
	newY	:= (monBottom - cH) / 2
	WinMove, % cT, , % newX, newY
return

;********************************************************************************
; Move Windows by 1/3
;********************************************************************************

MoveCycleLeft(Add) {
	static SizeCycle = 0
	SizeCycle := Mod(SizeCycle + Add, 3)
	if (SizeCycle < 0) {
		SizeCycle := SizeCycle + 3
	}

	if (SizeCycle = 0) {
		MoveWindow(0, 50)
	}
	else if (SizeCycle = 1) {
		MoveWindow(0, 66.6666)
	}
	else if (SizeCycle = 2) {
		MoveWindow(0, 33.3333)
	}
}

MoveCycleRight(Add) {
	static SizeCycle = 0
	SizeCycle := Mod(SizeCycle + Add, 3)

  if (SizeCycle = 0) {
		MoveWindow(50, 50)
	}
	else if (SizeCycle = 1) {
		MoveWindow(66.6666, 33.3333)
	}
	else if (SizeCycle = 2) {
		MoveWindow(33.3333, 66.6666)
	}
}

MoveWindow(XP, WP) {
	;Get current Window
	WinGetActiveTitle, WinTitle
	WinGetPos, X, Y, WinWidth, WinHeight, %WinTitle%

	;Get Taskbar height
	WinGetPos,,, tbW, tbH, ahk_class Shell_TrayWnd

	;Calculate new position and size
	XNew := (A_ScreenWidth * XP / 100)
	WNew := (A_ScreenWidth * WP / 100)
	HNew := (A_ScreenHeight - tbH)

	;MsgBox, %XNew% - %WNew%
	WinRestore, %WinTitle%
	WinMove, %WinTitle%,, %XNew%, 0, %WNew%, %HNew%
}

#Left::
	MoveCycleLeft(-1)
return

#Right::
	MoveCycleRight(1)
return
