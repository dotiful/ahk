#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#InstallMouseHook           ; Forces the unconditional installation of the mouse hook.
; #InstallKeybdHook           ; Forces the unconditional installation of the keyboard hook.
#WinActivateForce           ; Skips the gentle method of activating a window and goes straight to the forceful method.
#SingleInstance force       ; Skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
; #Warn                       ; Enable warnings to assist with detecting common errors.

; SetTitleMatchMode RegEx     ;
; DetectHiddenWindows, On     ; Determines whether invisible windows are "seen" by the script.

; --------------------------------------------------------------
; Hotkey Modifier Symbols
; https://autohotkey.com/docs/Hotkeys.html
; https://autohotkey.com/docs/KeyList.htm
; + = Shift
; ^ = Ctrl
; # = Win
; ! = Alt
; & = combine multiple keys
; <> = left/right key of the pair
; * = fire the hotkey even if extra modifiers are being held down
; ~ = do not block the key's native function
; --------------------------------------------------------------

FullFilePath := A_ScriptDir . "\local.ahk"
If FileExist(FullFilePath)
{
  #Include local.ahk
}

#Include helpers.ahk
#Include mac.ahk
#Include base.ahk
#Include apps.ahk
#Include media.ahk
#Include strings.ahk
#Include window-actions.ahk
