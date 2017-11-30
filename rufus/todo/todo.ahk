#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
DetectHiddenWindows, On																					; Enables the detection of hidden windows
#EscapeChar ¤
CoordMode, Mouse, Screen

;https://autohotkey.com/docs/commands/Gui.htm
;https://autohotkey.com/docs/commands/GuiControls.htm

gui:
Gui, +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 200
Gui, Font, s10 cBlack, Source code pro,
Gui, Add, Tab2,, Tasks|Finished

Gui, Tab, Tasks,, Exact
Gui, Color, 2f343f, 2f343f
Gui, Add, Checkbox, vCheck, Task

Gui, Tab, Finished,, Exact
Gui, Color, 2f343f, 2f343f

;Gui, Add, Button, Default, OK
;GuiControl, Hide, OK

Gui, Show,, ToDo
return

GuiClose: 
ButtonOK: 
Gui, Submit
FileDelete, contents.ini
FileAppend, True: %Check%, contents.ini,
ExitApp
return