#SingleInstance, force
SetWorkingDir %A_ScriptDir%

; #####################################
; Scripts
; #####################################

gui:
Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 200
Gui, Font, s10 cWhite, Source Code Pro,
Gui, add, Edit, r1 w150 vFileEdit,
Gui, Show,, CMD Launcher
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
run, cmd.exe /k prompt %user%$G & color 06 & %contents%
Gui, Destroy
FileDelete, command.log
ExitApp
return


GuiClose:
ExitApp
return

Esc::ExitApp

#IfWinNotActive, ahk_class AutoHotkeyGUI
{
~LButton::
~LButton Up::
Gui, Destroy
ExitApp
}
return
#IfWinNotActive