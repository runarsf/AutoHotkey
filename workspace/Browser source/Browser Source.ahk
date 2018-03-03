#SingleInstance, force
#MaxHotkeysPerInterval, 2000
#InstallKeybdHook
#InstallMouseHook
CoordMode, Mouse, Screen
SetWorkingDir, %A_ScriptDir%
menu, tray, Icon, %A_ScriptDir%\browser.ico

gui:
IniRead, site, config.ini, Settings, site,
IniRead, preload, config.ini, Settings, Preload,

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
Gui, Add, Tab3, w%wa%, Browse|Notepad|Settings

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
Gui, Add, ActiveX, w%A_ScreenWidth% h%A_ScreenHeight% y75 vWB, Shell.Explorer
URL:="google.com"
WB.silent := true 
WB.Navigate(URL)

/* TAB 2
*/
Gui, Tab, 2
FileRead, Contents, %A_ScriptDir%\notepad.txt
if SetPreload = 1 {
	iscont := %contents%
	else
		iscont := ""
	Gui, Add, Edit, w%wa% h%ha% vFileEdit, %iscont%
	
	Gui, Tab, 3
	Gui, Add, Checkbox, vSetPreload, Load previous Notepad text
	
	Gui, Font, s9 cBlack, Segoe UI,
	Gui, Show,, browser-source
	return
	
	ButtonOK:
	Gui, Submit, Nohide
	WB.Navigate(URLBar)
	return
	
	GuiClose:
	Gui, Submit
	FileDelete, notepad.txt
	FileAppend, %FileEdit%, notepad.txt
	IniWrite, %SetPreload%, config.ini, Settings, Preload
	ExitApp
	return