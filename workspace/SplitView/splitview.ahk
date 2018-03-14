#SingleInstance, force
#MaxHotkeysPerInterval, 2000
#InstallKeybdHook
menu, tray, Icon, %A_ScriptDir%\pi.ico

gui:
FileRead, Contents, %A_ScriptDir%\pi.txt
Gui, Color, 252525, 303030
Gui, Font, s20 cWhite, Source Code Pro
Gui, Add, Edit, x15  y15 w550 h700 vOriginal, %contents%
Gui, Add, Edit, x580 y15 w550 h700 vFileEdit,
Gui, Show, w1145, pi

GuiControl, focus, FileEdit
if WinActive("ahk_class AutoHotkeyGUI")
	send 3.
else
	return
; Rest of the code
rest:
if ( WaitForAnyKey( 10000 ) )
{
	Gui, Submit, Nohide
	if WinActive("ahk_class AutoHotkeyGUI")
	{
		;MsgBox, %FileEdit% × %Original%
		IfInString, Original, %FileEdit%
		{
		}
		else {
			GuiControl, font, FileEdit, cRED
			MsgBox, You don't wanna see me angry
		}
	}
	else
		Gosub, Guiclose
}
else
	tooltip
Gosub, rest

WaitForAnyKey( p_timeout )
{
	start := A_TickCount
	
	loop
	{
		if ( idle > A_TimeIdlePhysical )
			return, true
		else if ( A_TickCount-start >= p_timeout )
			return, false
		
		idle := A_TimeIdlePhysical
		
		Sleep, 10
	}
}
return



GuiClose:
ExitApp
return