#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Pixel, Screen
menu, tray, icon, shell32.dll, 246

submenu := 1
interval := 50
transparency := 200
bgcolor := 006400
fgcolor := WHITE
aX := 0

maingui()
bar()
loop 
{
	ImageSearch, aX, aY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, insert.PNG
	
	place:
	if aX >= 1
	{
		Gui, color, 01352f
		GuiControl,, TextInsert, Insert
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

maingui() {
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
	Gui, Add, Text, Center y37 vTextInsert, '    '
	
	Gui, Show, w50 h0, indicator
	
	WinMove, ahk_exe AutoHotkey.exe,, %WinPosX%, %WinPosY%
}
bar() {
	global bgcolor
	global transparency
	global fgcolor
	
	Gui 3: +AlwaysOnTop +ToolWindow +LastFound +Caption -DPIScale
	WinSet, Transparent, 0, BarGui
	Gui 3: Color, %bgcolor%, %bgcolor%
	
	Gui 3: Font, s12 cWHITE
	Gui 3: Add, Text, x2540 y-2 gSubmenu, =
	Gui 3: Font, s9 cWHITE
	Gui 3: Add, Text, x5 y2 gSubmenu, -- INSERT MODE --
	Gui 3: Font, s9
	
	Gui 3: Show, w1920 h0 y0 x0, BarGui
	WinSet, Style, -0xC00000, A
	WinMove, A,, 0, 1395, %A_ScreenWidth%, 15

	return
}

Submenu:
if submenu = 0
{
	Gui 2: Submit, NoHide
	Gui 2: Destroy
	submenu := 1
	return
}
else if submenu = 1 
{
	Gui 2: +AlwaysOnTop +ToolWindow +LastFound +Caption +LabelGui -DPIScale
	WinSet, Transparent, %transparency%, Submenu
	Gui 2: Color, 01352f
	Gui 2: Font, s9 cWHITE, Consolas
	
	Gui 2: Add, Text, x4 y3 gExitApp, ExitApp
	Gui 2: Add, Text, x4 y20 gTrayReload, Reload
	Gui 2: Add, Text, x4 y37 gTrayEdit, Edit
	Gui 2: Add, Text, x4 y54 gExplore, Explore
	
	Gui 2: Show, w200 h150 x2350 y1215, Submenu
	WinSet, Style, -0xC00000, Submenu
	submenu := 0
	return
}
return

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
submenu := 1
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