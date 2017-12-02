#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
DetectHiddenWindows, On																					; Enables the detection of hidden windows
#EscapeChar ¤
CoordMode, Mouse, Screen


gui:
Gui, +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 200
Gui, Font, s10 cBlack, Source code pro,
Gui, Add, Tab2, w390 h600, Tasks|Finished


; Tasks tab
Gui, Tab, Tasks,, Exact
Gui, Color, 2f343f, 2f343f
Gui, Add, Checkbox, vKey, Task
Gui, Add, Button, Default, OK
IniRead, MyVar, config.ini, Tasks, Task,
Gui, Add, Text,, %MyVar%
GuiControl, Hide, OK

; Finished tab
Gui, Tab, Finished,, Exact
Gui, Color, 2f343f, 2f343f


Gui, Show,, ToDo
IniRead, WinPossX, config.ini, Settings, WinPosX,
IniRead, WinPossY, config.ini, Settings, WinPosY,
WinMove, ahk_exe AutoHotkey.exe,, %WinPossX%, %WinPossY%
return
 
 
 
 
 
ButtonOK: 
WinGetPos, WinPosX, WinPosY,,, ahk_exe AutoHotkey.exe
IniWrite, %WinPosX%, config.ini, Settings, WinPosX
IniWrite, %WinPosY%, config.ini, Settings, WinPosY
Gui, Submit
IniWrite, %Key%, config.ini, Tasks, Task
Gui, Destroy
Gosub, gui
return


GuiClose: 
WinGetPos, WinPosX, WinPosY,,, ahk_exe AutoHotkey.exe
IniWrite, %WinPosX%, config.ini, Settings, WinPosX
IniWrite, %WinPosY%, config.ini, Settings, WinPosY
Gui, Submit
ExitApp
return