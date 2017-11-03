#SingleInstance, force
SetWorkingDir %A_ScriptDir%

start:
Gosub, gui
return

gui:
	Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
	Gui, Color, 2f343f, 434852
	WinSet, Transparent, 200
	Gui, Font, s10 cWhite, Source Code Pro,
	Gui, add, Edit, r1 w150 vFileEdit +0x100 HwndEditID,
	Gui, Show,, ( ͡° ͜ʖ ͡°)
	loop
	{
	WinWait, ahk_class AutoHotkeyGUI
	WinActivate, ahk_class AutoHotkeyGUI
	}
	Enter::Gosub, SaveButton
	NumpadEnter::Gosub, SaveButton
	LButton::
		Gui, Destroy
		ExitApp
	return
return

SaveButton:
	Gui, Submit, NoHide
	FileDelete, command.ini
	FileAppend, %FileEdit%, command.ini
	Gosub, done
return

done:
	FileRead, contents, %A_ScriptDir%\command.ini
	
	if (contents = "sha")
	{
	contents := "shutdown /a"
	}
	if (contents = "startup")
	{
	contents := "start shell:startup"
	}
	run, cmd.exe /k prompt rufus$G & %contents%
	Gui, Destroy
	ExitApp
return

GuiClose:
ExitApp
return

Esc::ExitApp