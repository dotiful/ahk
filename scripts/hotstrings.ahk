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

:*:;ah::autohotkey `
:*:;ow::openwrt `
:*:;vs::vs code `
:*:;st::sublime text `
:*:;ps::powershell `
:*:;ce::conemu `
:*:;w1::windows 10 `

; ::;as::\U0001f3a8

; :x*?:b``::TextMenu("🦄 | Unicorn,🐀 | Rat
; ::;as::TextMenu("🦄 | Unicorn,🐀 | Rat
;           ,🐁 | Mouse,🐂 | Ox,🐃 | Water Buffalo
;           ,🐄 | Cow,❓ | Red,❔ | White")

; MenuAction:
;   InsertText := StrSplit(A_ThisMenuItem, "|")
;   TextOut := StrReplace(RTrim(InsertText[1]), "&")
;   SendInput {raw}%TextOut%%A_EndChar%
; Return

TextMenu(TextOptions)
{
  StringSplit, MenuItems, TextOptions , `,
  Loop %MenuItems0%
  {
    Item := MenuItems%A_Index%
    Menu, MyMenu, add, %Item%, MenuAction
  }
  Menu, MyMenu, Show
  Menu, MyMenu, DeleteAll
}

MenuAction:
  SendInput %A_ThisMenuItem%%A_EndChar%
Return

:x:flux::TextMenu("Flux,Flux {#}1,Flux {#}2")
