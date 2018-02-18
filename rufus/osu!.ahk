; -------------------------------------
; osu! changes
; -------------------------------------
#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
#EscapeChar ¤
CoordMode, Mouse, Screen

menu, tray, Icon, %A_ScriptDir%\icons\osu!.ico

+AppsKey::
gui:
Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 200
Gui, Font, s10 cWhite, Source Code Pro,
Gui, add, Edit, r1 w150 vFileEdit,
Gui, Show,, osu!mods
Gui, Add, Button, Default, OK
GuiControl, Hide, OK
return

GuiClose:
ButtonOK:
Gui, Submit, Nohide
IniWrite, %FileEdit%, osumods.ini, txtmods, osumods
Gui, Destroy
return

#IfWinActive, ahk_exe osu!.exe
;#a::WinMove, ahk_exe osu!.exe,, 73, 44,, #For a set osu! resolution

AppsKey::
IniRead, mods, osumods.ini, txtmods, osumods
sleep, 100
SendInput, {!}recommend %mods%
sleep, 100
sendInput, {Enter Down}
sleep, 25
sendInput, {Enter Up}
sleep, 5000
return


Control & LButton Up::
Button := LButton
Gosub, continue

continue:
CoordMode, ToolTip, Screen
tooltip, %gmode%, 79, 46
Gosub, buklau
sleep, 1200
tooltip
return
buklau:
CoordMode, Mouse, Screen
MouseGetPos, mposX, mposY,,
	
if (mposX > 365) and (mposX < 478) and (mposY > 947) and (mposY < 1056)
{
	if (gmode = "")
		gmode := "osu!"
	else if (gmode = "mania")
		gmode := "taiko"
	else if (gmode = "taiko")
		gmode := "ctb"
	else if (gmode = "ctb")
		gmode := "osu!"
	else if (gmode = "osu!")
		gmode := "mania"
	sleep, 30
	sendInput, {LButton}
	sleep, 16
	sendInput, {Control Down}
	sleep, 16
	sendInput, {Backspace}
	sleep, 16
	sendInput, {Control Up}
	sleep, 16
	sendInput, mode=%gmode%
} else {
	sendInput, {LButton Up}
}
return

Insert::return
z::Numpad2
x::Numpad1
Numpad9::Escape
NumpadDot::LButton
#IfWinActive