; --------------------------------------------------------------
; Helpers and functions
; --------------------------------------------------------------

Notify(title="", message="", second:=2, options:=16) {
  TrayTip %title%, %message%, %second%, %options%
  Sleep % second . "000"
  HideTrayTip()
}

HideTrayTip() {
  TrayTip      ; Attempt to hide it the normal way.
  if SubStr(A_OSVersion,1,3) = "10." {
    Menu Tray, NoIcon
    Sleep 200  ; It may be necessary to adjust this sleep.
    Menu Tray, Icon
  }
}

evalVariablesInString(string) {
  pos := 0
  while (pos := RegExMatch(string, "%(.*?)%", regex, ++pos += StrLen(%regex1%)))
    string := RegExReplace(string, regex, %regex1%)
  return string
}
