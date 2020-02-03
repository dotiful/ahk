; This AutoHotkey script is to Open, Restore or Minimize the desires Apps using the configured shortcuts key
; There are three functions you can use for this:
;
; 1) OpenOrShowAppBasedOnExeName(AppAddress)                       // regular Window Apps
; 2) OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)  // Chrome Apps and Chrome Shortcuts
; 3) OpenOrShowAppBasedOnAppModelUserID(AppTitle, AppModelUserID)  // Windows Store Apps (contained in the "shell:AppsFolder\")
;
; Alt + ` switching between open Windows of the same "type" and same App
; The "type" checking is based on the App's Title convention that stipulates that the App name should be at the end of the Window title (Eg: New Document - Word )

; --------------------------------------------------------------
; Functions
; --------------------------------------------------------------
; #WinActivateForce ; Prevent task bar buttons from flashing when different windows are activated quickly one after the other.

; AppAddress: The address to the .exe (Eg: "C:\Windows\System32\SnippingTool.exe")
OpenOrShowAppBasedOnExeName(AppAddress) {
	AppExeName := SubStr(AppAddress, InStr(AppAddress, "\", false, -1) + 1)

	IfWinExist ahk_exe %AppExeName%
	{

		IfWinActive
		{
			WinMinimize
			Return
		}
		else
		{
			WinActivate
			Return
		}

	}
	else
	{
		Run, %AppAddress%, UseErrorLevel
      If ErrorLevel
      {
        Msgbox, File %AppAddress% Not Found
        Return
      }
		else
		{
			WinWait, ahk_exe %AppExeName%
			WinActivate ahk_exe %AppExeName%
			Return
		}
	}
}

; WindowTitleWord: Usually the word at the end of the app window title (Eg: in: "New Document - Word" will be "Word")
; AppAddress: The address to the .exe (Eg: "C:\Windows\System32\SnippingTool.exe")
OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)
{
	SetTitleMatchMode, 2
  IfWinExist, %WindowTitleWord%
  {
    IfWinActive
    {
      WinMinimize
      Return
    }
    else
    {
      WinActivate
      Return
    }

  }
  else
  {
    Run, %AppAddress%, UseErrorLevel
    If ErrorLevel
    {
      Msgbox, File %AppAddress% Not Found
      Return
    }
    else
    {
      WinActivate
      Return
    }
  }
}

; AppTitle: Usually the word at the end of the app window title(Eg: in: "New Document - Word" will be "Word")
; AppModelUserID: A comprehensive guide on how to find the AppModelUserID of a windows store app can be found here: https://jcutrer.com/windows/find-aumid
OpenOrShowAppBasedOnAppModelUserID(AppTitle, AppModelUserID)
{
	SetTitleMatchMode, 2
  IfWinExist, %AppTitle%
  {
    IfWinActive
    {
      WinMinimize
      Return
    }
    else
    {
      WinActivateBottom %AppTitle%
    }
  }
  else
  {
    Run, shell:AppsFolder\%AppModelUserID%, UseErrorLevel
    If ErrorLevel
    {
      Msgbox, File %AppModelUserID% Not Found
      Return
    }
  }
}

ExtractAppTitle(FullTitle)
{
	AppTitle := SubStr(FullTitle, InStr(FullTitle, " ", false, -1) + 1)
	Return AppTitle
}


; --------------------------------------------------------------
; Toggle Apps
; --------------------------------------------------------------
^!c:: OpenOrShowAppBasedOnExeName("C:\Program Files\Mozilla Firefox\firefox.exe")
^!e:: OpenOrShowAppBasedOnExeName("C:\Users\User\AppData\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe")
^!f:: OpenOrShowAppBasedOnExeName("%WinDir%\explorer.exe")
^!t:: OpenOrShowAppBasedOnExeName("C:\Program Files\ConEmu\ConEmu64.exe")

; --------------------------------------------------------------
; Explorer
; --------------------------------------------------------------
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
#IfWinActive

; --------------------------------------------------------------
; Firefox
; --------------------------------------------------------------
; alt+Bb- Toggle Bookmarks Bar
#IfWinActive, ahk_class MozillaWindowClass
  !b::
    SendInput {Alt} ; Activates "File" Menu
    sleep 100
    SendInput {Right}{Right}{Down}{Right}{Down}
    sleep 100
    SendInput {Enter}

  :*:;ac::about:config
  :*:;ap::about:profiles
  :*:;aa::about:about
#IfWinActive

; --------------------------------------------------------------
; Chrome
; --------------------------------------------------------------
#IfWinActive ahk_exe chrome.exe
  ::cce::chrome://extensions/{Enter}
  ::ccs::chrome://settings/{Enter}
  ::ccw::https://chrome.google.com/webstore{Enter}
  ::cca::chrome://settings/help{Enter}
  ::ccb::chrome://bookmarks{Enter}
  !WheelDown:: SendInput,{CtrlDown}{Tab}{CtrlUp}
  !WheelUp:: SendInput, {CtrlDown}{ShiftDown}{Tab}{ShiftUp}{CtrlUp}
#IfWinActive

; --------------------------------------------------------------
; CMD
; --------------------------------------------------------------
#IfWinActive, ahk_class ConsoleWindowClass
  ; Alt+Q - quit
  !q::WinClose, A

  /*
  ; Ctrl+v - paste
  ; ^v::SendInput {Raw}%clipboard%

  ; Ctrl+d - logout
  ; ^d::Send {Esc}{Esc}exit{Enter} ; First send ESC, in case we're in select mode.

  ; Ctrl+l for clear
	; ^l::SendInput, {Esc}cls{Enter}
  */
#IfWinActive


; ^!1::GoSub, FocusOrStartConEmu

; ;; This will probably not act as intended if you have more than one ConEmu64 process running
; FocusOrStartConemu:
; if WinExist("ahk_exe ConEmu64.exe")
;   ; WinActivate
;   If WinActive("ahk_exe ConEmu64.exe")
; 		{
; 			WinMinimize
; 			Return
; 		}
; 		else
; 		{
; 			WinActivate
; 			Return
; 		}
; else
;   Run,%A_ProgramFiles%\ConEmu\ConEmu64.exe
; return
