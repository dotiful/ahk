; --------------------------------------------------------------
; Functions
; --------------------------------------------------------------
appToggle(exe) {
  IfWinExist, ahk_exe %exe%
		IfWinActive
			WinMinimize
		else
			WinActivate
	else
		Run, %exe%
}

WinShortcut(Path){
  IfWinExist, %Path%
  {
    WinActivate, %Path%
    return 1
  }
  Run explorer.exe %Path%
  return 0
}

; --------------------------------------------------------------
; Toggle Apps
; --------------------------------------------------------------
; Ctrl+Alt+C - Google Chrome
^!c::	appToggle("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")

; Ctrl+Alt+T - Telegram
^!t::	appToggle("C:\Users\amedv\AppData\Roaming\Telegram Desktop\Telegram.exe")

; Ctrl+Alt+V - VS Code
^!e::	appToggle("C:\Users\amedv\AppData\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe")
; ^!e::	appToggle("C:\Users\Artem Medvedev\AppData\Local\Programs\Microsoft VS Code\Code.exe")
; ^!e:: appToggle("C:\Program Files\Sublime Text 3\sublime_text.exe")

; Ctrl+Alt+S - Spotify
^!s:: appToggle("C:\Users\Artem Medvedev\AppData\Roaming\Spotify\Spotify.exe")

; ^!s::
; WinGetPos, x,,,,ahk_exe Spotify.exe
; if !x
; {
;     DetectHiddenWindows, On
;     WinGet, windows, List, ahk_exe Spotify.exe
;     Loop, %windows% {
;         winId := windows%A_Index%
;         WinGetTitle, title, ahk_id %winId%
;         if (title != "" && title != "GDI+ Window" && title != "MSCTFIME UI" && title != "Default IME")
;             WinShow %title%
;     }
;     DetectHiddenWindows, Off
; }
; else
; {
;     WinGet, windows, List, ahk_exe Spotify.exe
;     Loop, %windows% {
;         winId := windows%A_Index%
;         WinGetTitle, title, ahk_id %winId%
;         if (title != "" && title != "GDI+ Window" && title != "MSCTFIME UI" && title != "Default IME")
;             WinHide %title%
;     }
; }

; --------------------------------------------------------------
; Google Chrome
; --------------------------------------------------------------
#IfWinActive, ahk_class Chrome_WidgetWin_1
  !1::Send {XButton1} ; Alt+1 Go Back
  !2::Send {XButton2} ; Alt+2 Go Forward
  return
#IfWinActive

; Forward and Back Navigation with Mouse Buttons
~LButton & ~RButton:: ; Browser_Forward
  Send, {XButton2}
  return
~RButton & ~LButton:: ; Browser_Back
  Send, {XButton1}
  return

; --------------------------------------------------------------
; CMD
; --------------------------------------------------------------
; Close cmd window
#IfWinActive, ahk_class ConsoleWindowClass
  !q::WinClose, A   ; Alt+q
#IfWinActive

; --------------------------------------------------------------
; Explorer
; --------------------------------------------------------------
; Press middle mouse button to move up a folder in Explorer
#IfWinActive, ahk_class CabinetWClass
  ~MButton::Send !{Up}
#IfWinActive
return

; Open Downloads folder
!+l::Run "C:\Users\amedv\Downloads" ; ctrl+shift+d
return

; Win+Shift+E - Explorer
; #+e::	appToggle("%SystemRoot%\explorer.exe")
; #e:: Run explorer.exe "C:\Users\User\Downloads"
; Empty trash

; Win+Shift+Q - Toggle Q-Dir
; ^!q:: appToggle("C:\Program Files\Q-Dir\Q-Dir.exe")
