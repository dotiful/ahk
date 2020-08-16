/*
  Hotkey Documentation: http://ahkscript.org/docs/Hotkeys.htm

  Examples:

  Modifiers:
    +  - Shift
    ^  - Ctrl
    #  - Win
    !  - Alt
    &  - combine multiple keys
    <> - left/right key of the pair
    *  - fire the hotkey even if extra modifiers are being held down
    ~  - do not block the key's native function
*/

; Ctrl+Alt+1
^!1::
  OpenOrShowAppBasedOnExeName("cmd.exe")

  WinGet, WinState, MinMax, ahk_exe cmd.exe

  Switch WinState {
    ; Case -1:
    ;   MsgBox window is minimized

    ; Case 1:
    ;   MsgBox window is maximized

    Case 0:
      WinMaximize
      ; MsgBox window is neither minimized nor maximized

    ; Default:
    ;   MsgBox Chrome window does not exist
  }

  Return

; ^!1::
;   Run, cmd, , max
;   Run, cmd, , min
;   return
