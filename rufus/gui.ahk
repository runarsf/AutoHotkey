#SingleInstance, force
start:
Gosub, gui
return

gui:
	Gui, Font, s10, Source Code Pro
	Gui, Add, Edit, r50 w680 vFileEdit,
	Gui, Font, s10, Consolas
	Gui, Add, Button, gSaveButton, Save
	Gui, Show,, AHK gui test
return

bold:
	FileRead, Contents, %A_ScriptDir%\bold.rsf
	Gui, Destroy
	Gui, Add, Text,, %contents%
	Gui, Font, s10, Consolas
	Gui, Show, h%A_ScreenHeight% w300, bold.rsf (read-only)
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
	
Esc::ExitApp