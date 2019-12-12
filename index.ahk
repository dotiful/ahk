#InstallMouseHook           ; monitors mouse clicks for the purpose of activating mouse hotkeys
#SingleInstance force       ; Skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command
#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn                       ; Enable warnings to assist with detecting common errors.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
; SetTitleMatchMode 2

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

#Include helpers.ahk
#Include mac.ahk
#Include base.ahk
#Include apps.ahk
#Include media.ahk
#Include strings.ahk
; #Include window-actions.ahk
#Include local.ahk
; #Include clipboard.ahk
; #Include test.ahk
; #Include test2.ahk
