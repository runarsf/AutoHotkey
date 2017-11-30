#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
DetectHiddenWindows, On																					; Enables the detection of hidden windows
#EscapeChar ¤
CoordMode, Mouse, Screen

gui:
Gui, +AlwaysOnTop +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 200
Gui, Font, s10 cBlack, Source Code Pro,
Gui, Add, Tab2,, Application|Finished

Gui, Tab, Application,, Exact
Gui, Color, 2f343f, 000000

Gui, Add, Button, Default, OK
GuiControl, Hide, OK

Gui, Show,, ToDo
return

GuiClose: 
ButtonOK: 
Gui, Submit 
ExitApp
return