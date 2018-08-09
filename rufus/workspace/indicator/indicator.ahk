#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Pixel, Screen
menu, tray, icon, shell32.dll, 246

interval := 50
transparency := 200
bgcolor := 006400
fgcolor := WHITE
aX := 0

caps()
bar()
loop 
{
	ImageSearch, aX, aY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, insert.PNG
	
	while (GetKeyState("CapsLock", "T") = 1)
		caps()

	place:
	if aX >= 1
	{
		Gui, color, 01352f
		GuiControl,, TextInsert, CapsLock
		WinSet, Transparent, %transparency%, BarGui
	}
	while aX >= 1
	{
		ImageSearch, aX, aY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, insert.PNG
	}
	Gui, color, 2f343f
	GuiControl,, TextInsert,
	WinSet, Transparent, 0, BarGui
	sleep, %interval%
}

capss() {
	return
	; Define globals
	global TextInsert
	global transparency
	
	Gui, Destroy
	
	IniRead, WinPosX, config.ini, Settings, WinPosX
	IniRead, WinPosY, config.ini, Settings, WinPosY
	
	Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
	WinSet, Transparent, %transparency%, indicator
	Gui, Color, 2f343f
	Gui, Font, s14 cWhite, Consolas
	Gui, Add, Text, Center x2 y30 vTextInsert, '      '
	
	Gui, Show, w85 h75, indicator
	
	WinMove, ahk_exe AutoHotkey.exe,, %WinPosX%, %WinPosY%
}
bar() {
	global bgcolor
	global transparency
	global fgcolor
	
	Gui 3: +AlwaysOnTop +ToolWindow +LastFound +Caption -DPIScale
	WinSet, Transparent, 0, BarGui
	Gui 3: Color, %bgcolor%, %bgcolor%
	
	Gui 3: Font, s9 cWHITE
	Gui 3: Add, Text, x5 y2, -- INSERT MODE --
	Gui 3: Font, s9
	
	Gui 3: Show, w1920 h0 y0 x0, BarGui
	WinSet, Style, -0xC00000, A
	WinMove, A,, 0, 1395, %A_ScreenWidth%, 15

	return
}
caps() {
	global bgcolor
	global transparency
	global fgcolor
	
	Gui 3: +AlwaysOnTop +ToolWindow +LastFound +Caption -DPIScale
	WinSet, Transparent, 0, BarGui
	Gui 3: Color, %bgcolor%, %bgcolor%
	
	Gui 3: Font, s9 cWHITE
	Gui 3: Add, Text, x5 y2, -- INSERT MODE --
	Gui 3: Font, s9
	
	Gui 3: Show, w1920 h0 y0 x0, BarGui
	WinSet, Style, -0xC00000, A
	WinMove, A,, 0, 1395, 20, 20
	
	return
}
if (GetKeyState("CapsLock", "T") = 1)
	MsgBox, 1
else
	MsgBox, 0
GuiClose:
Gui, Submit, NoHide
WinGetPos, WinPosX, WinPosY,,, ahk_exe AutoHotkey.exe
IniWrite, %WinPosX%, config.ini, Settings, WinPosX
IniWrite, %WinPosY%, config.ini, Settings, WinPosY
ExitApp

GuiEscape:
2GuiEscape:
3GuiEscape:
Gui 2: Submit
Gui 2: Destroy
return

ExitApp:
ExitApp
return
TrayReload:
reload
TrayEdit:
Edit, %A_ScriptName%
return 
Explore:
run, %A_ScriptDir%
return