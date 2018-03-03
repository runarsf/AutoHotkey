#Include  binary.ahk
#SingleInstance Force
#Persistent
;#Warn
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
#EscapeChar ¤
#MaxHotkeysPerInterval 2000
Menu, Tray, Icon, %A_ScriptDir%\icon.ico

gui_main:
Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 250


Gui, Add, Text, y15, BAB

gui_show:
IniRead, WinPossX, config.ini, Settings, WinPosX,
IniRead, WinPossY, config.ini, Settings, WinPosY,
Gui, Show, w300 h50 x%WinPossX% y%WinPossY%, Lyrics ; ALL GUI ELEMENTS BEFORE THIS
return

GBMain:
Gui, Submit, Nohide
return

GuiClose:
WinGetPos, WinPosX, WinPosY,,, ahk_exe AutoHotkey.exe
IniWrite, %WinPosX%, config.ini, Settings, WinPosX
IniWrite, %WinPosY%, config.ini, Settings, WinPosY
Gui, Submit
ExitApp
return