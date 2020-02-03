; --------------------------------------------------------------
; Toggle Hide/Show frontmost window
; --------------------------------------------------------------
; Win+W
#w::
  IfWinNotExist, ahk_id %selected_id%
  {
    If (IsWindow(WinExist("A")) || WinActive("ahk_class ArtRage 3"))
      WinGet, selected_id, ID, A
    else
    {
      MsgBox, No window selected
        return
    }
  }
  WinGet, WinState, MinMax, ahk_id %selected_id%
    If WinState = -1    ; the selected window is minimized
    {
      WinRestore
      selected_id := ""
    }
    else
      WinMinimize
  return

  IsWindow(hwnd){
    WinGet, s, Style, ahk_id %hwnd%
    return s & 0xC00000 ? (s & 0x100 ? 0 : 1) : 0
  }

; --------------------------------------------------------------
; Hide frontmost Window
; --------------------------------------------------------------
; Win+H
#h::
  lastWindows:=[]
  lastWindows.Insert(lastWindow:=WinExist("A"))
  WinGet,MinMax,MinMax,ahk_id %lastWindow%
  If MinMax!=-1
    WinMinimize, ahk_id %lastWindow%
    Return
  If !lastWindow:=lastWindows.Remove()
    return ;nothing to restore
  WinGet,MinMax,MinMax,ahk_id %lastWindow%
  If MinMax=-1
    WinRestore, ahk_id %lastWindow%
  Return

; --------------------------------------------------------------
; Center Window
; --------------------------------------------------------------
; Alt+Shift+C
!#c::
	WinGetActiveStats, cT, cW, cH, cX, cY
	SysGet, mon, MonitorWorkArea
	newX	:= (monRight - cW) / 2
	newY	:= (monBottom - cH) / 2
	WinMove, % cT, , % newX, newY
  return

; --------------------------------------------------------------
; FullScreen Window
; --------------------------------------------------------------
; Alt+Win+F
!#f::Send, {LWinDown}{Up}{LWinUp}

; --------------------------------------------------------------
; Keep a Window on top
; --------------------------------------------------------------
; Ctrl+Alt+Shift+F - Always on Top
^!+f::
  Winset, Alwaysontop, , A
  Notify("Alwaysontop", "State toggled")
  return

;********************************************************************************
; Resize Window by 1/2 - 1/3 - 2/3
;********************************************************************************
; Akt+Win+Left
!#Left::
	MoveCycleLeft(-1)
  return

; Akt+Win+Right
!#Right::
	MoveCycleRight(1)
  return

MoveCycleLeft(Add) {
	static SizeCycle = 0
	SizeCycle := Mod(SizeCycle + Add, 3)
	if (SizeCycle < 0) {
		SizeCycle := SizeCycle + 3
	}

	if (SizeCycle = 0) {
		MoveWindow(0, 33.3333)
	}
	else if (SizeCycle = 1) {
		MoveWindow(0, 66.6666)
	}
	else if (SizeCycle = 2) {
		MoveWindow(0, 50)
	}
}

MoveCycleRight(Add) {
	static SizeCycle = 0
	SizeCycle := Mod(SizeCycle + Add, 3)

  if (SizeCycle = 0) {
    MoveWindow(33.3333, 66.6666)
	}
	else if (SizeCycle = 1) {
		MoveWindow(66.6666, 33.3333)
	}
	else if (SizeCycle = 2) {
		MoveWindow(50, 50)
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


; Ctrl+Alt+scroll transparency
{
	#IfWinActive
	; ^!LButton::
	; MouseGetPos,,, currentWindow
	; %currentWindow% := 255

	^!Wheelup::
	MouseGetPos,,, currentWindow
	if not (%currentWindow%)
	{
		GoSub GetTransparent
	}
	if (%currentWindow% < 255)
	{
		%currentWindow% += 45
	}
	WinSet, Transparent, % %currentWindow%, ahk_id %currentWindow%
	SplashImage,,w150 x0 y0 b fs12, % currentWindow . "—" . %currentWindow%
	SetTimer, TurnOffSI, 1000, On
	Return

	^!Wheeldown::
	MouseGetPos,,, currentWindow
	if not (%currentWindow%)
	{
		GoSub GetTransparent
	}
	if (%currentWindow% > 50)
	{
		%currentWindow% -= 30
	}
	WinSet, Transparent, % %currentWindow%, ahk_id %currentWindow%
	SplashImage,, w150 x0 y0 b fs12, % currentWindow . "—" . %currentWindow%
	SetTimer, TurnOffSI, 1000, On
	Return

	GetTransparent:
	WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
	if (ExStyle & 0x80000)  ; 0x8 is WS_EX_LAYERED.
		{
		WinGet, TransLevel, Transparent, ahk_id %currentWindow%
		%currentWindow% := TransLevel
		}
		else
		%currentWindow% := 255
	Return

	TurnOffSI:
	SplashImage, off
	SetTimer, TurnOffSI, 1000, Off
	Return
}

; Alt Drag
{
	!LButton::

	MouseGetPos,KDE_X1,KDE_Y1,KDE_id
	WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
	If KDE_Win
		return
	WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
	Loop
	{
		GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
		If KDE_Button = U
			break
		MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
		KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
		KDE_Y2 -= KDE_Y1
		KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
		KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
		WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
	}
	return

	!RButton::
	If DoubleAlt
	{
		MouseGetPos,,,KDE_id
		; Toggle between maximized and restored state.
		WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
		If KDE_Win
			WinRestore,ahk_id %KDE_id%
		Else
			WinMaximize,ahk_id %KDE_id%
		DoubleAlt := false
		return
	}

	MouseGetPos,KDE_X1,KDE_Y1,KDE_id
	WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
	If KDE_Win
		return

	WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
	If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
		KDE_WinLeft := 1
	Else
		KDE_WinLeft := -1
	If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
		KDE_WinUp := 1
	Else
		KDE_WinUp := -1
	Loop
	{
		GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
		If KDE_Button = U
			break
		MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
		; Get the current window position and size.
		WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
		KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
		KDE_Y2 -= KDE_Y1
		; Then, act according to the defined region.
		WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
								, KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
								, KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
								, KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
		KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
		KDE_Y1 := (KDE_Y2 + KDE_Y1)
	}
	return

}

return


; ; Alt + ` -  Activate NEXT Window of same type (title checking) of the current APP
; !`::
;   WinGet, ActiveProcess, ProcessName, A
;   WinGet, OpenWindowsAmount, Count, ahk_exe %ActiveProcess%

; If OpenWindowsAmount = 1  ; If only one Window exist, do nothing
;   Return
; Else
; 	{
; 		WinGetTitle, FullTitle, A
; 		AppTitle := ExtractAppTitle(FullTitle)

; 		SetTitleMatchMode, 2
; 		WinGet, WindowsWithSameTitleList, List, %AppTitle%

; 		If WindowsWithSameTitleList > 1 ; If several Window of same type (title checking) exist
; 		{
; 			WinActivate, % "ahk_id " WindowsWithSameTitleList%WindowsWithSameTitleList%	; Activate next Window
; 		}
; 	}
; Return
