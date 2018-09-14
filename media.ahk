; --------------------------------------------------------------
; Multimedia
; --------------------------------------------------------------
^+WheelDown::Send {Volume_Down}        ; Ctrl+Shift+Scroll up
^+WheelUp::Send {Volume_Up}            ; Ctrl+Shift+Scroll down
^+MButton::Send {Volume_Mute}          ; Ctrl+Shift+Middle click

^+LButton::Send   {Media_Prev}         ; Ctrl+Shift+LeftClick
^+RButton::Send   {Media_Next}         ; Ctrl+Shift+RightClick
!+MButton::Send   {Media_Play_Pause}   ; Alt+Shift+MiddleClick

!F7::Send   {Media_Prev}               ; Alt+F7
!F8::Send   {Media_Play_Pause}         ; Alt+F8
!F9::Send   {Media_Next}               ; Alt+F9
!F11::Send  {Volume_Down}              ; Alt+F11
!F12::Send  {Volume_Up}                ; Alt+F12
!F10::Send  {Volume_Mute}              ; Alt+F10

Return