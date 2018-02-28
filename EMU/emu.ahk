#SingleInstance Force
#Persistent
#InstallKeybdHook
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

Gui, Add, Tab3, h682, GIF|Settings
D := A_ScriptDir
iw := 108
ih := 108
r1 := 29+5
r2 := r1+ih+5
r3 := r2+ih+5
i1 := 22
i2 := i1+iw+5
i3 := i2+iw+5
cw := i3+iw-(5*5)

Gui, Tab, 1
;	Images
Gui, Add, Picture, w%iw% h-1 y%r1% x%i1% gC11, %D%\files\thumbs\EhThumb.png
Gui, Add, Picture, w%iw% h-1 y%r1% x%i2% gC12, %D%\files\thumbs\hahahaThumb.png
Gui, Add, Picture, w%iw% h-1 y%r1% x%i3% gC13, %D%\files\thumbs\NgahThumb.png
Gui, Add, Picture, w%iw% h-1 y%r2% x%i1% gC21, %D%\files\thumbs\NoNameThumb.png
Gui, Add, Picture, w%iw% h-1 y%r2% x%i2% gC22, %D%\files\thumbs\PhoneSlideThumb.png
Gui, Add, Picture, w%iw% h-1 y%r2% x%i3% gC23, %D%\files\thumbs\TechniqueThumb.png
Gui, Add, Picture, w%iw% h-1 y%r3% x%i1% gC31, %D%\files\thumbs\WhaThumb.png
Gui, Add, Picture, w%iw% h-1 y%r3% x%i2% gC32, %D%\files\thumbs\WhatThumb.png
Gui, Add, Picture, w%iw% h-1 y%r3% x%i3% gC33, %D%\files\thumbs\ueghThumb.png

Gui, Tab, 2
Gui, Add, Checkbox, vckShow, Show on startup 
IniRead, Messenger, config.ini, Settings, Messenger,
Gui, Add, Edit, r1 w%cw% vMsngr, %Messenger% ; UPDATE WIDTH
Gui, Add, Button, gBSave, save
Gui, Add, Button, gBReload, reload
Gui, Add, Button, gBExit, exit

gui_show:
IniRead, WinPossX, config.ini, Settings, WinPosX,
IniRead, WinPossY, config.ini, Settings, WinPosY,
IniRead, IsChecked, config.ini, Settings, IsChecked,
if IsChecked = 1
	Control, Check,, Button1
else
	Control, UnCheck,, Button1
Gui, Show,, EMU ; ALL GUI ELEMENTS BEFORE THIS

Class Tool{
	Tip(key)
	{	
		IniRead, Messenger, config.ini, Settings, Messenger,
		WinActivate, %Messenger%
		WinWait, %Messenger%
		Tooltip, %key%
		;Clipboard = %key%
		sleep, 350
		Tooltip
	}
}
Tipsy := New Tool
return

C11:
Tipsy.Tip("if a this text is a paste it work")
return
C12:
Tipsy.Tip("")
return
C13:
Tipsy.Tip("")
return
C21:
Tipsy.Tip("")
return
C22:
Tipsy.Tip("")
return
C23:
Tipsy.Tip("")
return
C31:
Tipsy.Tip("")
return
C32:
Tipsy.Tip("")
return
C33:
Tipsy.Tip("")
return

GuiClose:
WinGetPos, WinPosX, WinPosY,,, ahk_exe AutoHotkey.exe
IniWrite, %WinPosX%, config.ini, Settings, WinPosX
IniWrite, %WinPosY%, config.ini, Settings, WinPosY
Gui, Submit, Nohide
IniWrite, %ckShow%, config.ini, Settings, IsChecked
IniWrite, %Msngr%, config.ini, Settings, Messenger
ExitApp
return

BReload:
Gui, Submit, Nohide
Gui, Destroy
reload

BExit:
Gosub, GuiClose
return

BSave:
WinGetPos, WinPosX, WinPosY,,, ahk_exe AutoHotkey.exe
IniWrite, %WinPosX%, config.ini, Settings, WinPosX
IniWrite, %WinPosY%, config.ini, Settings, WinPosY
Gui, Submit, Nohide
IniWrite, %ckShow%, config.ini, Settings, IsChecked
IniWrite, %Msngr%, config.ini, Settings, Messenger
return






/*
	*********************************************
	* Hold Escape for {} seconds to exit script *
	* - Activates at 500ms                      *
	*********************************************
	
	
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
*/