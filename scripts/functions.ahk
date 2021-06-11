/*
 Function Documentation: http://ahkscript.org/docs/Functions.htm

 Examples:

 Add(x, y)
 {
     return x + y
 }

 Add(2, 3) ; Simply calls the function
 MyNumber := Add(2, 3) ; Stores the value

*/

Edit(file) {
	global
    Run % Settings.EditorPath " " file
}

MouseIsOver(WinTitle) {
  MouseGetPos,,,WinID
  WinGetClass, WinClass, ahk_id %WinID%
  return WinClass=WinTitle
}
