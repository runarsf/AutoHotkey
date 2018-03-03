#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
DetectHiddenWindows, On																					; Enables the detection of hidden windows
#EscapeChar ¤
CoordMode, Mouse, Screen
menu, tray, Icon, %A_ScriptDir%\todo.ico

gui:
Gui, +AlwaysOnTop +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 240
Gui, Font, s10 cWhite, Source code pro,
Gui, Add, Tab2, w390 h600, Tasks|Finished


; Tasks tab
Gui, Tab, Tasks,, Exact
Gui, Color, 2f343f, 2f343f


IniRead, Tasnii, config.ini, Tasks, Flapcunt
Gui, Add, Edit, w360 vTask r1,
Gui, Add, Checkbox, vKey, %Tasnii%


IniRead, AmCheck, config.ini, Tasks, AmCheck,
Gui, Add, Text,, %AmCheck%
Gui, Add, Button, Default, OK
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
Gui, Submit, NoHide
GoSub, GuiClose
return

GuiClose: 
WinGetPos, WinPosX, WinPosY,,, ahk_exe AutoHotkey.exe
IniWrite, %WinPosX%, config.ini, Settings, WinPosX
IniWrite, %WinPosY%, config.ini, Settings, WinPosY
Gui, Submit
IniWrite, %Key%, config.ini, Tasks, AmCheck
IniWrite, %Task%, config.ini, Tasks, Flapcunt
reload
ExitApp
return

/*
	*********************************************
	* Hold Escape for {} seconds to exit script *
	* - Activates at 500ms                      *
	*********************************************
*/

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