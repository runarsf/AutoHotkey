#SingleInstance, force
#MaxHotkeysPerInterval,2000
CoordMode, Mouse, Screen
SetWorkingDir, %A_ScriptDir%
menu, tray, Icon, %A_ScriptDir%\browser.ico

gui:
ComObjError(false)
ComObjError(disable)
IniRead, site, config.ini, Main, site,

Gui, +LastFound +Caption +Resize
Gui, Color, 252525, 303030

Gui, Font, s10 cWhite, Source Code Pro,
Gui, Add, Edit, w1280 r1 vURLBar,

Gui Add, ActiveX, w1280 h720 vWB, Mozilla.Browser
URL:="google.com"
WB.Navigate(URL)

Gui, Font, s9 cBlack, Segoe UI,

Gui, Add, StatusBar,,
SB_SetIcon("cmd.ico")

Gui, Show,, browser-source
return

/*
loop {
	MouseGetPos, Xpos, Ypos,
	SB_SetText("x:" . Xpos + 1 . " y:" . Ypos + 1)
}
*/

#IfWinActive, ahk_exe AutoHotkey.exe
Enter::Gosub, URLEnter
#IfWinActive

URLEnter:
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