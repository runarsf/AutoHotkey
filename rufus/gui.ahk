#SingleInstance, force
start:
Gosub, gui
return

gui:
	Gui, Font, s10, Source Code Pro
	Gui, Add, Edit, r35 w550 vFileEdit,
	Gui, Font, s10, Consolas
	Gui, Add, Button, gSaveButton, Save
return

bold:
	FileRead, Contents, %A_ScriptDir%\bold.rsf
	Gui, Destroy
	Gui, Add, Text,, %contents%
	Gui, Font, s10, Consolas
	Gui, Show, w450, bold.rsf (read-only)
return

^s::
SaveButton:
	Gui, Submit, NoHide
	FileDelete, bold.rsf
	FileAppend, %FileEdit%, bold.rsf
return

^r::Gosub, bold





; #####################################
; Stuff you don't need to care about
; #####################################
	
^Esc::ExitApp