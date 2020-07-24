/*
 Context-sensitive Documentation: http://ahkscript.org/docs/commands/_If.htm

 Examples:

 The following hotkey and hotstring will only be active within Notepad

 #If WinActive("ahk_class Notepad")
	#Space::Msgbox, You pressed Win+Spacebar in Notepad

	::btw::by the way

 #If ; turns off context sensitivity

*/

#Include %A_ScriptDir%\appspecific\chrome.ahk
#Include %A_ScriptDir%\appspecific\explorer.ahk


; #a::
;   WinGetClass, class, A
;   MsgBox, The active window's class is "%class%".
