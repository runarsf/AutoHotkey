#SingleInstance, force
#MaxHotkeysPerInterval,2000
start:
Gosub, gui
return


gui:
Gui, Color, 252525, 303030
Gui, Font, s10 cWhite, Source Code Pro
FileRead, Contents, %A_ScriptDir%\read.txt
Gui, Add, Edit, r35 w550 vFileEdit, %contents%

Gui, Font, s10, Consolas
Gui, Add, Button, gSaveButton, Save
Gui, Show,, AHK-Notepad
return

read:
FileRead, Contents, %A_ScriptDir%\read.txt
Gui, Destroy
Gui, Add, Text,, %contents%
Gui, Font, s10, Consolas
Gui, Show, w450, read.txt (read-only)
return

^s::
SaveButton:
Gui, Submit, NoHide
FileDelete, read.txt
FileAppend, %FileEdit%, read.txt
return

^r::Gosub, read





GuiClose:
ExitApp
return

~Esc::
If EscIsPressed
	return
EscIsPressed := true
SetTimer, WaitForRelease, 500
return

~Esc Up::
SetTimer, WaitForRelease, Off
EscIsPressed := false
return

WaitForRelease:
SetTimer, WaitForRelease, Off
ExitApp
return

