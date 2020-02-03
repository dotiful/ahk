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
^!Left::Send {LCtrl Down}{LShift Down}{Tab}{LShift Up}{LCtrl Up}
^!Right::Send {LCtrl Down}{Tab}{LCtrl Up}

#IfWinNotActive, ahk_class CabinetWClass
  ; navigation, selection, delete a word/till end
  !Left::Send {Home}
  !Right::Send {End}
  !Up::Send {Lctrl Down}{Home}{Lctrl Up}
  !Down::Send {Lctrl Down}{End}{Lctrl Up}
#IfWinNotActive

#Left::Send {Ctrl Down}{Left}{Ctrl Up}
#Right::Send {Ctrl Down}{Right}{Ctrl Up}
#Down::Send {AltDown} {Down} {AltUp}
#Up::Send {AltDown} {Up} {AltUp}

#+Left::Send {Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}
#+Right::Send {Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}

!+Left::Send {Shift Down}{Home}{Shift Up}
!+Right::Send {Shift Down}{End}{Shift Up}
!+Up::Send {Ctrl Down}{Shift Down}{Home}{Shift Up}{Ctrl Up}
!+Down::Send {Ctrl Down}{Shift Down}{End}{Shift Up}{Ctrl Up}

; command-delete deletes whole line
!BS::Send {LShift Down}{Home}{LShift Up}{Del}
; alt-delete deletes previous word
#BS::Send {LCtrl Down}{BS}{LCtrl Up}

; change keyboard language
!Space::Send {LAlt down}{LShift down}{LShift up}{LAlt up}
