#SingleInstance, force
SetWorkingDir %A_ScriptDir%

#IfWinActive, ahk_exe DiscordCanary.exe
|::
#IfWinActive
^|::
gui_main:
Gui, +LastFound +Caption -DPIScale
Gui, Color, #303030, #303030
Gui, Font, cWhite s11, Ubuntu Mono

Gui, Add, Edit, w1011 h519 -E0x200,
Gui, Add, Text,

Gui, Show,, dirc
return

GuiClose:
Gui, Submit, Nohide
Gui, Destroy
return

GuiEscape:
Gui, Submit, Nohide
Gui, Destroy
return

If !WinActive("ahk_class AutoHotkeyGUI") and !WinActive("ahk_exe explorer.exe")
	~LButton::
~LButton Up::
Gui, Submit, Nohide
Gui, Destroy
return