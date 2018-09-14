; --------------------------------------------------------------
; Base remmaping
; --------------------------------------------------------------
; Remap CapsLock to Backspace
CapsLock::Backspace

; Win+Q alias to Alt+F4
!q::
  Send,{alt down}{F4}{alt up}
  Return

; Alt+Shift+R - Reload AutoHotkey script
!+r::Reload

; Empty trash
#Del::FileRecycleEmpty ; win + del
return

; Always on Top
^!f:: Winset, Alwaysontop, , A ; ctrl + space
Return

; Win+Space to change keyboard language
; #Space::
;   WinWait, Program Manager,
;   Send, {CTRLDOWN}{SHIFTDOWN}{SHIFTUP}{CTRLUP}
