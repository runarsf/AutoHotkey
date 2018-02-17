#SingleInstance, force
#MaxHotkeysPerInterval, 2000
#InstallKeybdHook
#InstallMouseHook
CoordMode, Mouse, Screen
SetWorkingDir, %A_ScriptDir%
menu, tray, Icon, %A_ScriptDir%\browser.ico

gui:
ComObjError(false)
IniRead, site, config.ini, Main, site,

/*	GUI setup
*/
Gui, +LastFound +Caption +Resize
Gui, Color, 252525, 303030
Gui, Font, s10 cWhite, Source Code Pro,

/*	Gets the monitor size
*/
SysGet, workArea, MonitorWorkArea
workAreaWidth := workAreaRight - workAreaLeft
workAreaHeight := workAreaBottom - workAreaTop
wa := workAreaWidth - 43
ha := workAreaHeight - 43

/*	Create tab group
*/
Gui, Add, Tab3, w%wa%, Browse|Notepad|Appearance|Settings

/* TAB 1
*/

Gui, Tab, 1
Gui, Add, Edit, w%wa% r1 vURLBar,
/*	Hidden ok button that triggers on enter
*/
Gui, Add, Button, x0 y0 Hidden Default, OK

/*	Startpage
	 - ActiveX decides window size
*/
Gui Add, ActiveX, w%A_ScreenWidth% h%A_ScreenHeight% y75 vWB, Mozilla.Browser
URL:="google.com"
WB.Navigate(URL)

/* TAB 2
*/

Gui, Tab, 2
Gui, Add, Edit, w%wa% h%ha% vFileEdit

/* Show GUI
*/
Gui, Font, s9 cBlack, Segoe UI,
Gui, Show,, browser-source
return

ButtonOK:
Gui, Submit, Nohide
WB.Navigate(URLBar)
return

GuiClose:
ExitApp
return

~Esc::
If EscIsPressed
	return
EscIsPressed := true
SetTimer, WaitForRelease, 1000
return

~Esc Up::
SetTimer, WaitForRelease, Off
EscIsPressed := false
return

WaitForRelease:
SetTimer, WaitForRelease, Off
ExitApp
return