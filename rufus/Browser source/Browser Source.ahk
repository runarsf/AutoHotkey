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

Gui, +LastFound +Caption +Resize
Gui, Color, 252525, 303030
Gui, Font, s10 cWhite, Source Code Pro,

Gui, Add, Edit, w1280 r1 vURLBar,
/*	HIDDEN OK BUTTON
	*/
Gui, Add, Button, x0 y0 Hidden Default, OK

/*	STARTPAGE
	 - ActiveX decides window size
*/
sw := 100
sh := 100
Gui Add, ActiveX, w%A_ScreenWidth% h%A_ScreenHeight% vWB, Mozilla.Browser
URL:="google.com"
WB.Navigate(URL)

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