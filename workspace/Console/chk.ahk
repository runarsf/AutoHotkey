#SingleInstance, Force
#Persistent
SetWorkingDir, %A_ScriptDir%
CoordMode, ToolTip, Screen
Menu, Tray, Icon, %A_ScriptDir%\cmd.png

FileRead, startupText, strtxt.txt
WinGetPos, ConX, ConY, ConW, ConH,

gui_main:
Gui, +LastFound +Caption -DPIScale
Gui, Color, 000000, 000000
WinSet, Transparent, 255  
Gui, Font, cGREEN s10 , Consolas 

Gui, Add, Edit, x-1 y-1 w993 h519, %startupText%$ %A_WorkingDir%\%A_UserName%>
Gui, Show, w993 h519, AHK Con
return

GuiClose:
ExitApp:
Gui, Submit, NoHide
Gui, Destroy
ExitApp
return