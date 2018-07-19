#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Pixel, Screen
Menu, Tray, Icon, shell32.dll, 69

maingui()
#IfWinActive, ahk_exe qutebrowser.exe
loop {
		ImageSearch, aX, aY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, insert.PNG
		
		place:
		if aX >= 1
			Gui, color, 01352f
		while aX >= 1
		{
			ImageSearch, aX, aY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, insert.PNG
		}
		Gui, color, 2f343f
		sleep, 100
	}
#IfWinActive
	
maingui() {
	Gui, Destroy
	
	IniRead, WinPosX, config.ini, Settings, WinPosX
	IniRead, WinPosY, config.ini, Settings, WinPosY
	
	Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
	Gui, Font, s14 cWhite, Consolas
	WinSet, Transparent, 200
	Gui, Color, 2f343f
	
	Gui, Show, w100 h100, indicator
	
	WinMove, ahk_exe AutoHotkey.exe,, %WinPosX%, %WinPosY%
}

GuiClose:
Gui, Submit, NoHide
WinGetPos, WinPosX, WinPosY,,, ahk_exe AutoHotkey.exe
IniWrite, %WinPosX%, config.ini, Settings, WinPosX
IniWrite, %WinPosY%, config.ini, Settings, WinPosY
ExitApp