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


; LControl & RAlt::Send {Alt}
