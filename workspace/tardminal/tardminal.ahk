#SingleInstance, Force
#Persistent
SetWorkingDir, %A_ScriptDir%
CoordMode, ToolTip, Screen
Menu, Tray, Icon, %A_ScriptDir%\cmd.ico

bgcolor := "002B36"
fgcolor := "14625B"
WinGetPos, ConX, ConY, ConW, ConH,
FileRead, startupText, strtxt.txt

gui_main:
Gui, +LastFound +Caption -DPIScale
WinSet, Transparent, 255  
Gui, Color, %bgcolor%, %bgcolor%
Gui, Font, c%fgcolor% s11, Ubuntu Mono

Gui, Add, Edit, x-1 y-1 w1011 h519 -E0x200, %startupText%$ %A_UserName%>
Gui, Add, Text,

Gui, Show, w993 h519, tardminal ; Add option to change screen
return




#IfWinActive, tardminal
^c::MsgBox, REEEEEEEEEEEEEE 
return

GuiClose:
ExitApp
return