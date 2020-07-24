/*
 Hotkey Documentation: http://ahkscript.org/docs/Hotkeys.htm

 Examples:

 #n::Run, Notepad

 #n::
    Run, Notepad
 Return

  Alt::Return ;Disables the key alt when it's pressed alone
  !x:: ;alt+x works
  !y:: ;alt+y works
  ToolTip,% A_ThisHotkey
  Return

 Modifiers:
   ^ - Ctrl
   ! - Alt
   + - Shift
   # - Win

*/

; Reload entire script
#Esc::Reload

#1::ListLines
#2::ListVars
#3::ListHotkeys
#4::KeyHistory


; --------------------------------------------------------------
; Base remmaping
; --------------------------------------------------------------
; Remap CapsLock to Backspace
CapsLock::Backspace

; Disable winkey start menu
; LWin & vk07::return
; LWin::return
; #a::return

; Both Shift toggle CapsLock
LShift & RShift::CapsLock

; Win+Del Empty trash
#Del::
  FileRecycleEmpty
  SoundPlay, %A_ScriptDir%\sounds\recycle.wav
  return
