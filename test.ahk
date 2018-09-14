!+n::
  TrayTip #1, This is TrayTip #1
  Sleep 3000   ; Let it display for 3 seconds.
  HideTrayTip()

; Copy this function into your script to use it.
HideTrayTip() {
  TrayTip  ; Attempt to hide it the normal way.
  if SubStr(A_OSVersion,1,3) = "10." {
    Menu Tray, NoIcon
    Sleep 200  ; It may be necessary to adjust this sleep.
    Menu Tray, Icon
  }
}

