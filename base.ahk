; --------------------------------------------------------------
; Base remmaping
; --------------------------------------------------------------
; Remap CapsLock to Backspace
CapsLock::Backspace

; Win+Q alias to Alt+F4
;!q::SendInput !{F4}
; !q::Send !{F4}
; !q::SendEvent !{F4}

; Alt+Shift+R - Reload AutoHotkey script
; ^+r::
^+r::
  Notify("Autohotkey", "Script reloaded")
  reload

; Win+Del Empty trash
#Del::
  FileRecycleEmpty
  SoundPlay, %A_ScriptDir%\sounds\recycle.wav
  return

; Alt+Space to change keyboard language
; !Space::
;   WinWait, Program Manager,
;   Send, {CTRLDOWN}{SHIFTDOWN}{SHIFTUP}{CTRLUP}

; --------------------------------------------------------------
; Open Folders
; --------------------------------------------------------------
; Alt+Shift+H Open Home folder
!+h::Run "C:\Users\%A_UserName%\"

; Alt+Shift+L Open Downloads folder
!+l::Run "C:\Users\%A_UserName%\Downloads"

; Alt+Shift+L Open ~/dev folder
;!+d::Run "C:\Users\%A_UserName%\dev"

; --------------------------------------------------------------
; Explorer
; --------------------------------------------------------------
#IfWinActive, ahk_class CabinetWClass
  ~MButton::Send !{Right} ; middle click to Go Forward

	; F1::Send !{up}
	^1::Send ^+5 ; List
	^2::Send ^+6 ; Details
	^3::Send ^+4 ; Small Icons
	^4::Send ^+7 ; Tiles
	^5::Send ^+3 ; Medium Icons
	^6::Send ^+2 ; Large icons
	^7::Send ^+8 ; Content
	^8::Send ^+1 ; Extra large icons

  !n::Send !d!vn{enter}ln ; toggle sidebar
  !p::Send !d!vp          ; toggle preview
#IfWinActive

; --------------------------------------------------------------
; Chrome
; --------------------------------------------------------------
#IfWinActive ahk_exe chrome.exe
  ::cce::chrome://extensions/{Enter}
  ::ccs::chrome://settings/{Enter}
  ::ccw::https://chrome.google.com/webstore{Enter}
  ::cca::chrome://settings/help{Enter}
  ::ccb::chrome://bookmarks{Enter}
  !WheelDown:: SendInput,{CtrlDown}{Tab}{CtrlUp}
  !WheelUp:: SendInput, {CtrlDown}{ShiftDown}{Tab}{ShiftUp}{CtrlUp}
#IfWinActive


; LControl & RAlt::Send {Alt}
