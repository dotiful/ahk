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
#WinActivateForce ; Prevent task bar buttons from flashing when different windows are activated quickly one after the other.

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
;^!c:: OpenOrShowAppBasedOnExeName("%A_ProgramFiles%\Mozilla Firefox\firefox.exe")
^!e:: OpenOrShowAppBasedOnExeName("%A_AppData%\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe")
^!f:: OpenOrShowAppBasedOnExeName("%WinDir%\explorer.exe")

; F8 - Open||Show "Gmail as Chrome App"
; F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")

; F9 - Open||Show "Windows store Calculator app"
; F9:: OpenOrShowAppBasedOnAppModelUserID("Calculator", "Microsoft.WindowsCalculator_8wekyb3d8bbwe!App")
; ^!f:: OpenOrShowAppBasedOnAppModelUserID("Exploirer", "Microsoft.WindowsCalculator_8wekyb3d8bbwe!App")
