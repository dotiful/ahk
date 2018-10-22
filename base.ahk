; --------------------------------------------------------------
; Base remmaping
; --------------------------------------------------------------
; Remap CapsLock to Backspace
CapsLock::Backspace

; Win+Q alias to Alt+F4
!q::
  Send,{alt down}{F4}{alt up}
  return

; Alt+Shift+R - Reload AutoHotkey script
!+r::
  TrayTip Autohotkey, Script reloaded
  Sleep 2000
  HideTrayTip()
  Reload

; Empty trash
#Del::FileRecycleEmpty ; win + del
return

; Always on Top
^!f:: Winset, Alwaysontop, , A ; ctrl + space
return

; Win+Space to change keyboard language
; #Space::
;   WinWait, Program Manager,
;   Send, {CTRLDOWN}{SHIFTDOWN}{SHIFTUP}{CTRLUP}
