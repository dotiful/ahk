/*
  HotString Documentation: http://ahkscript.org/docs/Hotstrings.htm

  Examples:

  Single Line
  ::btw::by the way

  Multi-Line
  ::btw::
     MsgBox You typed "btw".
  Return
*/

; ctrl+alt+q
^!q:: OpenOrShowAppBasedOnExeName("Telegram.exe")

#IfWinActive, ahk_class Qt5QWindowIcon
  #Include %A_ScriptDir%\lib\emoji.ahk
#IfWinActive

; SetTitleMatchMode 2   ; Window title of GroupAdd should only contain WinTitle
; GroupAdd, emojiGroup, Telegram
; ; GroupAdd, emojiGroup, NameOfWindowApplication

; ; Add "ahk_group emojiGroup" if you want to apply Hotstring to some windows.
; ; Remove "ahk_group emojiGroup" if you want to apply Hotstrings to all windows.
; #IfWinActive
;   ; Use of ? to trigger even if it's inside another word
;   ; No use of * because we need to evaluate the EndChar
;   ; No use of o because we need to print it if it's not a colon
;   #Hotstring ?
;     ; Include of all Hotstrings if files exists (*i → error-friendly)

;     ; Hotstrings from the source alpha codes
;     #Include *i emojiOneAlphaCodes.ahk

;     ; Hotstrings from the source alias list
;     #Include *i emojiOneAliases.ahk

;     ; My personalized Hotstrings with EmojiOne syntaxe
;     #Include *i emojiOnePersonal.ahk
;   #Hotstring ?0
; #IfWinActive



