; --------------------------------------------------------------
; AutoHotkey related
; --------------------------------------------------------------
; Alt+Shift+R - Reload AHK
^+r::
  Reload
  Notify("Autohotkey", "Script reloaded")

; Win + scrollLock - Suspend
#ScrollLock::
  Suspend
  return

; --------------------------------------------------------------
; Base remmaping
; --------------------------------------------------------------
; Remap CapsLock to Backspace
CapsLock::Backspace

; Disable winkey start menu
LWin & vk07::return
LWin::return

; Both Shift toggle CapsLock
LShift & RShift::CapsLock

; Win+Del Empty trash
#Del::
  FileRecycleEmpty
  SoundPlay, %A_ScriptDir%\sounds\recycle.wav
  return

; Win+Space to change keyboard language
; #Space::
;   Sleep 300
;   PostMessage, 0x50, 2, 0,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST
;   return



; --------------------------------------------------------------
; Open Folders
; --------------------------------------------------------------
; Alt+Shift+H Open Home folder
!+h::Run "C:\Users\%A_UserName%\"

; Alt+Shift+L Open Downloads folder
; !+l::Run "C:\Users\%A_UserName%\Downloads"

!+l::Run Explorer /select`,"c:\users\User\code"

;!+d::Run "C:\Users\%A_UserName%\dev"
; LControl & RAlt::Send {Alt}
