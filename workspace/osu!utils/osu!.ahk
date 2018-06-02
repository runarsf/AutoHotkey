#SingleInstance Force
#Persistent
#InstallKeybdHook
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
#EscapeChar ¤
#MaxHotkeysPerInterval 2000
Menu, Tray, Icon, %A_ScriptDir%\osu!.ico

#o::run, %localappdata%\osu!\osu!.exe

+AppsKey::
ShortcutGui:
IniRead, mods, osumods.ini, txtmods, osumods
Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 200
Gui, Font, s10 cWhite,
Gui, Add, Edit, r1 w150 vShortcutGuiE, %mods%
Gui, Show,, osu!mods
Gui, Add, Button, Default, OK
GuiControl, Hide, OK
return

ButtonOK:
Gui, Submit, Nohide
IniWrite, %ShortcutGuiE%, osumods.ini, txtmods, osumods
GuiClose:
GuiEscape:
Gui, Destroy
return

#IfWinActive, ahk_exe osu!.exe

AppsKey::
IniRead, mods, osumods.ini, txtmods, osumods
sleep, 100
SendInput, {!}recommend %mods%
sleep, 100
sendInput, {Enter Down}
sleep, 25
sendInput, {Enter Up}
sleep, 100
return

;z::Numpad2
;x::Numpad1
NumpadDot::LButton
Numpad9::Escape

#IfWinActive

/*
	ImageSearch, aX, aY, 0, 0, A_ScreenWidth, A_ScreenHeight, A.png
	ImageSearch, bX, bY, 0, 0, A_ScreenWidth, A_ScreenHeight, B.png
	ImageSearch, cX, cY, 0, 0, A_ScreenWidth, A_ScreenHeight, C.png
	
	ImageSearch, ButtonAX, ButtonAY, 0, 0, A_ScreenWidth, A_ScreenHeight, buttonA.png
	ImageSearch, ButtonBX, ButtonBY, 0, 0, A_ScreenWidth, A_ScreenHeight, buttonB.png
	ImageSearch, ButtonCX, ButtonCY, 0, 0, A_ScreenWidth, A_ScreenHeight, buttonC.png
	
	if aX >= 1 
	{
		MouseClick, Left, ButtonAX+15, ButtonAY+10
	}
	else if bX >= 1 
	{
		MouseClick, Left, ButtonBX+15, ButtonBY+10
	} 
	else if cX >= 1 
	{
		MouseClick, Left, ButtonCX+15, ButtonCY+10
	}
*/