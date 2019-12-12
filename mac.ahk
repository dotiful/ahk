;-----------------------------------------
; Mac keyboard to Windows Key Mappings
;=========================================

; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
;

; Disable start menu on left winkey
LWin & vk07::return
LWin::return ; (or run Launchy)

; Universal shotcuts
!x::Send ^x
!c::Send ^c
!v::Send ^v
!s::Send ^s
!a::Send ^a
!z::Send ^z
!+z::Send ^y
!w::Send ^w
!f::Send ^f
!n::Send ^n
!q::Send !{f4}
!r::Send ^{f5}
; !m::Send {LWin Down}{Down}{LWin Up}
; !`::Send {Alt Down}{Shift Down}{Tab}{Shift Up}

; browser shotcuts
!t::Send ^t
!+t::Send ^+t
!+]::Send {Ctrl Down}{Tab Down}{Tab Up}{Ctrl Up}
!+[::Send {Ctrl Down}{Shift Down}{Tab Down}{Tab Up}{Shift Up}{Ctrl Up}
!l::Send ^l
; tabs switching
^!Left::Send {LCtrl down}{LShift down}{Tab}{LShift up}{LCtrl up}
^!Right::Send {LCtrl down}{Tab}{LCtrl up}

; navigation, selection, delete a word/till end
!Left::Send {Home}
!Right::Send {End}
!Up::Send {Lctrl down}{Home}{Lctrl up}
!Down::Send {Lctrl down}{End}{Lctrl up}

#Left::Send {ctrl down}{Left}{ctrl up}
#Right::Send {ctrl down}{Right}{ctrl up}

#+Left::Send {ctrl down}{shift down}{Left}{shift up}{ctrl up}
#+Right::Send {ctrl down}{shift down}{Right}{shift up}{ctrl up}

!+Left::Send {shift down}{Home}{shift up}
!+Right::Send {shift down}{End}{shift up}
!+Up::Send {Ctrl Down}{shift down}{Home}{shift up}{Ctrl Up}
!+Down::Send {Ctrl Down}{shift down}{End}{shift up}{Ctrl Up}

; command-delete deletes whole line
!BS::Send {LShift down}{Home}{LShift Up}{Del}
; alt-delete deletes previous word
#BS::Send {LCtrl down}{BS}{LCtrl up}

; Language switching
; NB! The trick here is to send winkey/ctrl up at the proper time
; ^Space::Send {LAlt down}{LCtrl up}{LShift down}{LShift up}{LAlt up}

; input methods
; $+,::Send ^,
; ; $+.::Send ^.
; !Space::
  ; WinWait, Program Manager,
  ; Send, {LWin Down}{Space}{LWin Up}
; !Space::Send {Ctrl Down}{LWin Down}{Space}{LWin Up}{Ctrl Up}


; Alt+Space to change keyboard language
; !Space::
;   WinWait, Program Manager,
;   Send, {CTRLDOWN}{SHIFTDOWN}{SHIFTUP}{CTRLUP}
