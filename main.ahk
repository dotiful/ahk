#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#WinActivateForce
#SingleInstance force
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include *i %A_ScriptDir%\scripts\functions.ahk
#Include %A_ScriptDir%\util\init.ahk
#Include %A_ScriptDir%\util\parsesettings.ahk
#Include %A_ScriptDir%\util\traymenu.ahk

If (Settings.StartupNotification)
	 Notify(Settings.ScriptName " Started",,-3,"Style=StandardGray")

If (Settings.UseAutoCorrect)
	Run, %A_ScriptDir%\util\autocorrect.ahk
Else
{
	DetectHiddenWindows, On
	WinClose, %A_ScriptDir%\util\autocorrect.ahk ahk_class autohotkey
}

FullFilePath := A_ScriptDir . "\local.ahk"
If FileExist(FullFilePath)
{
  #Include *i local.ahk
}

#Include *i %A_ScriptDir%\scripts\hotkeys.ahk
#Include *i %A_ScriptDir%\scripts\appspecific.ahk
#Include *i %A_ScriptDir%\scripts\hotstrings.ahk
#Include *i %A_ScriptDir%\scripts\media.ahk
#Include *i %A_ScriptDir%\scripts\window.ahk
#Include *i local.ahk
