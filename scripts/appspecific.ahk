/*
  Context-sensitive Documentation: http://ahkscript.org/docs/commands/_If.htm

  Examples:

  The following hotkey and hotstring will only be active within Notepad

  #If WinActive("ahk_class Notepad")
  #Space::Msgbox, You pressed Win+Spacebar in Notepad

  ::btw::by the way

  #If ; turns off context sensitivity

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

#Include %A_ScriptDir%\appspecific\helpers.ahk
#Include %A_ScriptDir%\appspecific\chrome.ahk
#Include %A_ScriptDir%\appspecific\cmd.ahk
#Include %A_ScriptDir%\appspecific\explorer.ahk
; #Include %A_ScriptDir%\appspecific\telegram.ahk

#a::
  WinGetClass, active_class, A
  WinGetTitle, active_title, A
  WinGet, active_id, ID, A

  MsgBox,
  (LTrim
    The active window's:

    ID      : %active_id%
    Title  : %active_title%
    Class : %active_class%
  )
  return

  ; WinGetClass, Var ,A
  ; MsgBox ahk_class %Var%
  ; Return


; --------------------------------------------------------------
; CmdQuit
; --------------------------------------------------------------
; Alt+Q - quit
if WinExist("ahk_class TaskManagerWindow") or WinExist("ahk_class CabinetWClass") or WinExist("ahk_class ConsoleWindowClass") or WinExist("ahk_class MMCMainFrame")
  !q::
    WinGet, process_id, ProcessName, A
    Process, close, %process_id%
    ; Send, {Alt Down}{F4 Down}{F4 Up}{Alt Up}
    return


; GroupAdd, CmdQuit, ahk_class ConsoleWindowClass
; GroupAdd, CmdQuit, ahk_class Notepad
; GroupAdd, CmdQuit, ahk_class CabinetWClass
; GroupAdd, CmdQuit, ahk_class MMCMainFrame
; GroupAdd, CmdQuit, ahk_class TaskManagerWindow
; ; return

; #IfWinExist ahk_group CmdQuit
;   ; Alt+Q - quit
;   ; !q::WinClose, A
;   !q::
;     MsgBox, Exist
;     WinGet, process_id, ProcessName, A
;     Process, close, %process_id%
;     ; Send, {Alt Down}{F4 Down}{F4 Up}{Alt Up}
;     return
; #IfWinExist

; #If WinActive("ahk_class ConsoleWindowClass") || WinActive("ahk_class Notepad") || WinActive("ahk_class CabinetWClass")
;   !q::WinClose, A

; !q::
;   Send, {Alt Down}{F4 Down}{F4 Up}{Alt Up}
;   Send, {F4 Up}{Alt Up}
; return
; !q::
;     WinClose ; use the window found above
;   ; PostMessage, 0x112, 0xF060,,, WinTitle, WinText  ; 0x112 = WM_SYSCOMMAND, 0xF060 = SC_CLOSE
; return

; #Persistent
; SetTitleMatchMode, 2 ;A window's title can contain WinTitle anywhere inside
; GroupAdd, WinMaximize, ahk_class ConsoleWindowClass
; SetTimer, Max, 1000
; Return

; Max:
; IfWinActive, ahk_group WinMaximize
; {
;   MsgBox, Max
;   WinGet, MinMax, MinMax
;   WinGet, ID, ID
;   If !MinMax And !MinMax%ID%
;   {
;     WinMaximize
;     MinMax%ID% := True
;   }
; }
; Return
