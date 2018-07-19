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
	Gui, Submit
	Gui, Destroy
	
	Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
	Gui, Color, 2f343f
	WinSet, Transparent, 200
	Gui, Font, s14 cWhite, Consolas,
	Gui, Show, w100 h100, qutebrowser
}