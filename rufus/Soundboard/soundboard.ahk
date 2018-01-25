/*
	*********************************************
	* Script behaviour                          *
	* - Script rules go under here              *
	*********************************************
*/
#SingleInstance Force
#Persistent
#InstallKeybdHook
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
#EscapeChar ¤
#MaxHotkeysPerInterval 2000
Menu, Tray, Icon, shell32.dll, 169


/*
	*********************************************
	* GUI                                       *
	* - All GUI elements go under here          *
	*********************************************
*/

gui_main:
/*
	# GUIDE TO ADDING SOUNDS:
	# 1. [Section 1] Add an IniRead line and increase its value by one.
	# 2. [Section 2] Add a gui button and set its values to correspond with the one you added in step 1.
	# 3. Add a section with the same sub name as you set in step 2.
	# 4. Open the config.ini file and add a key with the corresponding CButton value you set in step 1,
	     here you can also set what you want the button to display.
*/
	; *************
	; * SECTION 1 *
	; *************
	IniRead, 1Button, config.ini, Sounds, CButton1
	IniRead, 2Button, config.ini, Sounds, CButton2
	
	Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
	Gui, Color, 2f343f, 434852
	WinSet, Transparent, 250
	Gui, Font, s10, Source Code Pro

	; *************
	; * SECTION 2 *
	; *************
	Gui, Add, Button, gButton1 w100 h100, %1Button%
	Gui, Add, Button, gButton2 x125 y7 w100 h100, %2Button%
	
	Gui, Add, Button, gStop x10 y668 w75 h25, stop
	Gui, Show, w550 h700, Soundboard
	IniRead, WinPossX, config.ini, Settings, WinPosX,
	IniRead, WinPossY, config.ini, Settings, WinPosY,
	WinMove, ahk_exe AutoHotkey.exe,, %WinPossX%, %WinPossY%
return

; *************
; * SECTION 3 *
; *************
Button1:
	SoundPlay, soundfiles\OOF.mp3
	return
Button2:
	SoundPlay, soundfiles\senpai.mp3
	return

Stop:
	SoundPlay, soundfiles\cancel.mp3
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

GuiClose:
WinGetPos, WinPosX, WinPosY,,, ahk_exe AutoHotkey.exe
IniWrite, %WinPosX%, config.ini, Settings, WinPosX
IniWrite, %WinPosY%, config.ini, Settings, WinPosY
Gui, Submit, NoHide
reload
ExitApp
