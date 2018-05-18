#SingleInstance, force
#MaxHotkeysPerInterval, 2000
CoordMode, Mouse, Screen
SetWorkingDir, %A_ScriptDir%
menu, tray, Icon, %A_ScriptDir%\browser.ico

gui:

/*	GUI setup
*/
Gui, +LastFound +Caption +Resize
Gui, Color, 252525, 303030
/*	Gets the monitor size
*/
SysGet, workArea, MonitorWorkArea
workAreaWidth := workAreaRight - workAreaLeft
workAreaHeight := workAreaBottom - workAreaTop
wa := workAreaWidth - 43
ha := workAreaHeight - 43

Gui, Add, Edit, w%wa% r1 vURLBar,
/*	Hidden ok button that triggers on enter
*/
Gui, Add, Button, x0 y0 Hidden Default, OK

/*	Startpage
	- ActiveX decides window size
*/
Gui, Add, ActiveX, w%A_ScreenWidth% h%A_ScreenHeight% x0 y30 vWB, Shell.Explorer
URL:="player.twitch.tv/?volume=1&!muted&channel=sodapoppin"
WB.silent := true 
WB.Navigate(URL)
Gui, Show, w%A_ScreenWidth% h%A_ScreenHeight%, browser-source
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