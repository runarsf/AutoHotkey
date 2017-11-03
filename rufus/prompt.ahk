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
	Gui, Show,, ( ͡° ͜ʖ ͡°) CMD Launcher
	loop
	WinWait, ahk_class AutoHotkeyGUI
	WinActivate, ahk_class AutoHotkeyGUI
	if !WinActive("ahk_class AutoHotkeyGUI")
		LButton::
		MButton::
		RButton::
	Gui, Destroy
ExitApp
return
Enter::Gosub, SaveButton
NumpadEnter::Gosub, SaveButton
return

SaveButton:
Gui, Submit, NoHide
FileDelete, command.log
FileAppend, %FileEdit%, command.log
Gosub, done
return

done:
FileRead, contents, %A_ScriptDir%\command.log

if (contents = "sha")
	contents := "shutdown /a"
if (contents = "startup")
	contents := "start shell:startup"
run, cmd.exe /k prompt rufus$G & color 06 & %contents%
Gui, Destroy
FileDelete, command.log
ExitApp
return

GuiClose:
ExitApp
return

Esc::ExitApp