#SingleInstance, force
start:
Gosub, FileRead
sleep, 100
Gosub, gui
return

FileRead:
FileRead, MainEdit, %A_ScriptDir%\bold.rsf 
Gui, Add, Text,, %MainEdit%
return

gui:
Gui, Font, s10, Source Code Pro
Gui, Add, Edit, r50 w680 vEded
Gui, Font, s10, Consolas
Gui, Add, Button, gBooten, Save
Gui, Show,, AHK gui test
return

^s::
Booten:
Gui, Submit, NoHide
FileDelete, bold.rsf
FileAppend, %Eded%, bold.rsf
return

^r::
Gosub, FileRead
return

Esc::ExitApp