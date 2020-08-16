/*
  Hotkey Documentation:
  https://autohotkey.com/docs/Hotkeys.html
  https://autohotkey.com/docs/KeyList.htm

  Examples:

  #n::Run, Notepad

  Alt::Return ;Disables the key alt when it's pressed alone
  !x:: ;alt+x works
  !y:: ;alt+y works
  ToolTip,% A_ThisHotkey
  Return

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

; Reload entire script
#Esc::
  Reload
  ; Notify("Autohotkey", "Script reloaded",-3)
  Return

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
