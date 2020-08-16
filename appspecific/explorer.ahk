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

; --------------------------------------------------------------
; Open Folders
; --------------------------------------------------------------
; Alt+Shift+H Open Home folder
!+h::Run "C:\Users\%A_UserName%\"

; Alt+Shift+L Open Downloads folder
!+l::Run "C:\Users\%A_UserName%\Downloads"

;!+d::Run "C:\Users\%A_UserName%\dev"
; LControl & RAlt::Send {Alt}


#IfWinActive, ahk_class CabinetWClass
  ~MButton::Send !{Right} ; middle click to Go Forward

	; F1::Send !{up}
	^1::Send ^+5 ; List
	^2::Send ^+6 ; Details
	^3::Send ^+4 ; Small Icons
	^4::Send ^+7 ; Tiles
	^5::Send ^+3 ; Medium Icons
	^6::Send ^+2 ; Large icons
	^7::Send ^+8 ; Content
	^8::Send ^+1 ; Extra large icons

  !n::Send !d!vn{enter}ln ; toggle sidebar
  !p::Send !d!vp          ; toggle preview

  ^l::ControlClick,ToolbarWindow


  ;=== Hotkeys for testing ===
  !+e::RMApp_NavControlHandler("D:\")
  !+p::RMApp_NavControlHandler("E:\PortableApps")
  !+i::RMApp_NavControlHandler("D:\install")
  !+c::RMApp_NavControlHandler("C:\Users\art\code")

  /*
  F2::RMApp_NavControlHandler(A_MyDocuments)
  F3::RMApp_NavControlHandler(3)    ; Control Panel
  F4::RMApp_NavControlHandler(17)   ; My Computer
  F5::RMApp_NavControlHandler(10)   ; Recycle Bin
  */

  ; ShellSpecialFolderConstants:  http://msdn.microsoft.com/en-us/library/windows/desktop/bb774096%28v=vs.85%29.aspx

  ;===Functions===========================================================================
  /*
  Part of Radial menu codes posted by Learning one.
  http://www.autohotkey.com/board/topic/46856-radial-menu-scripts/
  http://ahkscript.org/boards/viewtopic.php?p=4673#p4673

  RM's Navigator is a drop down menu which helps you to easily navigate to folders that you often use.
  It navigates to your favorite folders in Windows explorer, My Computer, and in other standard Open, Save, Export, Import, Upload, Select dialog windows.
  */

  RMApp_NavControlHandler(FolderPath, hwnd="", FocusedControl="") {
    /*
    RM executes this function after user selects item in Navigator menu, if it is a folder path, drive path or ShellSpecialFolderConstant.
    All parameters are provided by RM.
    Note that you can't always navigate to all ShellSpecialFolders. For example, you can't navigate to Control panel while you're in standard "Open File" dialog box window, but you can always navigate there while you're in Windows explorer.

    "FolderPath" can be folder path, drive path or ShellSpecialFolderConstant, for example: "C:\Program Files", "C:\", "10"
    "hwnd" is handle to window, for example: "0xa03f0".
    "FocusedControl" is control of the target window which has input focus, if any. Example: "Button2"

    Some functions in use:
    RMApp_IsControlVisible()    returns 1 if control is visible
    RMApp_ControlSetTextR()     same as ControlSetText command, but a little bit more reliable
    RMApp_ControlSetFocusR()    same as ControlSetFocus command, but a little bit more reliable
    RMApp_Explorer_Navigate()   navigates to specified folder in Windows Explorer or MyComputer
    */

    RestoreInitText := 1            ; turn on "restore control's initial text after navigating to specified folder" switch
    hwnd := (hwnd="") ? WinExist("A") : hwnd  ; if omitted, use active window
    WinGetTitle, WinTitle, ahk_id %hwnd%    ; get window's title
    WinGetClass,WinClass, ahk_id %hwnd%     ; get window's class
    if (FocusedControl="")
      ControlGetFocus, FocusedControl, ahk_id %hwnd%  ; if not specified, get FocusedControl

    if FolderPath is integer
      FolderPath := Round(FolderPath)   ; for some strange reason, this has to be done although it looks like nonsense, otherwise try RMApp_Explorer_Navigate(FolderPath, hwnd) won't work properly if FolderPath if ShellSpecialFolderConstant

    ;=== If window is Windows Explorer or MyComputer ===
    if WinClass in ExploreWClass,CabinetWClass
    {
      try RMApp_Explorer_Navigate(FolderPath, hwnd)
      if (FocusedControl != "" and RMApp_IsControlVisible("ahk_id " hwnd, FocusedControl) = 1)
        RMApp_ControlSetFocusR(FocusedControl, "ahk_id " hwnd)        ; focus initialy focused control
      return
    }

    ;=== Other cases (not Windows Explorer or MyComputer) - first we'll decide to which control we will send FolderPath ===
    if (WinClass = "#32770") {    ;  dialog box class
      if RMApp_IsControlVisible("ahk_id " hwnd, "Edit1")
        Control := "Edit1"    ; in standard dialog windows, "Edit1" control is the right choice
      Else if RMApp_IsControlVisible("ahk_id " hwnd, "Edit2")
        Control := "Edit2"    ; but sometimes in MS office, if condition above fails, "Edit2" control is the right choice
      Else            ; if above fails - just return and do nothing.
        Return
    }
    Else if WinTitle contains Open,Save,Export,Import,Upload,Select ; this is the case in some MS office dialog windows, which are not #32770 class.
    {
      if RMApp_IsControlVisible("ahk_id " hwnd, "Edit1")
        Control := "Edit1"      ; if "Edit1" control exists, it is the right choice.
      Else if RMApp_IsControlVisible("ahk_id " hwnd, "RichEdit20W2")
        Control := "RichEdit20W2" ; some MS office dialogs don't have "Edit1" control, but they have "RichEdit20W2" control, which is then the right choice.
      Else              ; if above fails - just return and do nothing.
        Return
    }
    Else {  ; in all other cases, we'll explore FolderPath, and return from this function
      ComObjCreate("Shell.Application").Explore(FolderPath) ; http://msdn.microsoft.com/en-us/library/windows/desktop/bb774073%28v=vs.85%29.aspx
      Return
    }

    ;=== Refine ShellSpecialFolderConstant ===
    if FolderPath is integer
    {
      if (FolderPath = 17)      ; My Computer --> 17 or 0x11
        FolderPath := "::{20d04fe0-3aea-1069-a2d8-08002b30309d}"  ; because you can't navigate to "17" but you can navigate to "::{20d04fe0-3aea-1069-a2d8-08002b30309d}"
      else              ; don't allow other ShellSpecialFolderConstants. For example - you can't navigate to Control panel while you're in standard "Open File" dialog box window.
        return
    }

    /*
    ShellSpecialFolderConstants:  http://msdn.microsoft.com/en-us/library/windows/desktop/bb774096%28v=vs.85%29.aspx
    CSIDL:              http://msdn.microsoft.com/en-us/library/windows/desktop/bb762494%28v=vs.85%29.aspx
    KNOWNFOLDERID:          http://msdn.microsoft.com/en-us/library/windows/desktop/dd378457%28v=vs.85%29.aspx
    */


    ;===In this part (if we reached it), we'll send FolderPath to control and optionaly restore control's initial text after navigating to specified folder===
    if (RestoreInitText = 1)  ; if we want to restore control's initial text after navigating to specified folder
      ControlGetText, InitControlText, %Control%, ahk_id %hwnd% ; we'll get and store control's initial text first

    RMApp_ControlSetTextR(Control, FolderPath, "ahk_id " hwnd)  ; set control's text to FolderPath
    RMApp_ControlSetFocusR(Control, "ahk_id " hwnd)       ; focus control
    if (WinExist("A") != hwnd)      ; in case that some window just popped out, and initialy active window lost focus
      WinActivate, ahk_id %hwnd%    ; we'll activate initialy active window

    ;=== Avoid accidental hotkey & hotstring triggereing while doing SendInput - can be done simply by #UseHook, but do it if user doesn't have #UseHook in the script ===
    If (A_IsSuspended = 1)
      WasSuspended := 1
    if (WasSuspended != 1)
      Suspend, On
    SendInput, {End}{Space}{Backspace}{enter} ; silly but necessary part - go to end of control, send dummy space, delete it, and then send enter
    if (WasSuspended != 1)
      Suspend, Off

    /*
    Question: Why not use ControlSetText, and then send enter to control via ControlSend, %Control%, {enter}, ahk_id %hwnd% ?
    Because in some "Save as"  dialogs in some programs, this causes auto saving file instead of navigating to specified folder! After a lot of testing, I concluded that most reliable method, which works and prevents this, is the one that looks weird & silly; after setting text via ControlSetText, control must be focused, then some dummy text must be sent to it via SendInput (in this case space, and then backspace which deletes it), and then enter, which causes navigation to specified folder.
    Question: Ok, but is "SendInput, {End}{Space}{Backspace}{enter}" really necessary? Isn't "SendInput, {enter}" sufficient?
    No. Sending "{End}{Space}{Backspace}{enter}" is definitely more reliable then just "{enter}". Sounds silly but tests showed that it's true.
    */

    if (RestoreInitText = 1) {  ; if we want to restore control's initial text after we navigated to specified folder
      Sleep, 70       ; give some time to control after sending {enter} to it
      ControlGetText, ControlTextAfterNavigation, %Control%, ahk_id %hwnd%  ; sometimes controls automatically restore their initial text
      if (ControlTextAfterNavigation != InitControlText)            ; if not
        RMApp_ControlSetTextR(Control, InitControlText, "ahk_id " hwnd)   ; we'll set control's text to its initial text
    }
    if (WinExist("A") != hwnd)  ; sometimes initialy active window loses focus, so we'll activate it again
      WinActivate, ahk_id %hwnd%

    if (FocusedControl != "" and RMApp_IsControlVisible("ahk_id " hwnd, FocusedControl) = 1)
      RMApp_ControlSetFocusR(FocusedControl, "ahk_id " hwnd)        ; focus initialy focused control


    /*
    ;==Old method which looks more proper, but is definitely less reliable==
    if RestoreInitText
      ControlGetText, InitControlText, %Control%, ahk_id %hwnd%
    RMApp_ControlSetTextR(Control, FolderPath, "ahk_id " hwnd)
    Sleep, 60
    ControlSend, %Control%, {enter}, ahk_id %hwnd%
    Sleep, 60
    if RestoreInitText
      RMApp_ControlSetTextR(Control, InitControlText, "ahk_id " hwnd)
    if (WinExist("A") != hwnd)
      WinActivate, ahk_id %hwnd%
    */
  }

  RMApp_Explorer_Navigate(FullPath, hwnd="") {  ; by Learning one
    ; http://ahkscript.org/boards/viewtopic.php?p=4568#p4568
    ; http://msdn.microsoft.com/en-us/library/windows/desktop/bb774096%28v=vs.85%29.aspx
    ; http://msdn.microsoft.com/en-us/library/aa752094
    hwnd := (hwnd="") ? WinExist("A") : hwnd ; if omitted, use active window
    WinGet, ProcessName, ProcessName, % "ahk_id " hwnd
    if (ProcessName != "explorer.exe")  ; not Windows explorer
      return
    For pExp in ComObjCreate("Shell.Application").Windows
    {
      if (pExp.hwnd = hwnd) { ; matching window found
        if FullPath is integer  ; ShellSpecialFolderConstant
          pExp.Navigate2(FullPath)
        else
          pExp.Navigate("file:///" FullPath)
        return
      }
    }
  }

  RMApp_IsControlVisible(WinTitle,ControlClass) { ; used in Navigator
    ControlGet, IsControlVisible, Visible,, %ControlClass%, %WinTitle%
    return IsControlVisible
  }

  RMApp_ControlSetFocusR(Control, WinTitle="", Tries=3) { ; used in Navigator. More reliable ControlSetFocus
    Loop, %Tries%
    {
      ControlFocus, %Control%, %WinTitle%       ; focus control
      Sleep, 50
      ControlGetFocus, FocusedControl, %WinTitle%   ; check
      if (FocusedControl = Control)         ; if OK
        return 1
    }
  }

  RMApp_ControlSetTextR(Control, NewText="", WinTitle="", Tries=3) {  ; used in Navigator. More reliable ControlSetText
    Loop, %Tries%
    {
      ControlSetText, %Control%, %NewText%, %WinTitle%      ; set
      Sleep, 50
      ControlGetText, CurControlText, %Control%, %WinTitle%   ; check
      if (CurControlText = NewText)               ; if OK
        return 1
    }
  }

#IfWinActive
