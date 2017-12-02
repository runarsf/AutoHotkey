; -------------------------------------
; Script behaviour
; -------------------------------------
#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
SetNumlockState AlwaysOn																					; Locks NumLock in an on state.
SetCapslockState AlwaysOff																				; Locks CapsLock in an off state.
DetectHiddenWindows, On																					; Enables the detection of hidden windows
#EscapeChar ¤
CoordMode, Mouse, Screen
menu, tray, Icon, %A_ScriptDir%\icons\cmd.ico
Gosub, continuestart 

movecontrols: ;3
/*run, C:\Program Files (x86)\VB\Voicemeeter\VoicemeeterMacroButtons.exe
sleep, 150
WinMove, ahk_exe VoicemeeterMacroButtons.exe,, -1925, 909
WinSet, AlwaysOnTop, On, ahk_exe VoicemeeterMacroButtons.exe 
*/
Gosub, donestart

continuestart: ;1
ToolTip, lenny.ahk launched, 1910, 1070																		; Display tooltip.
SetTimer, RemoveToolTip, 5000																				; Set the length of the tooltip.
return

RemoveToolTip:	;2																						; Define RemoveToolTip.
SetTimer, RemoveToolTip, Off
ToolTip																								; Removes the tooltip.
return

+Esc::reload

sleep, 1000
Gosub, movecontrols

donestart: ;4
; -------------------------------------
; Script access
; -------------------------------------
^!a::edit, %A_ScriptName%																				; Open current script in editor.
^!+a::run, explorer.exe %A_ScriptDir%																		; Open the current script's path.

; -------------------------------------
; Text replacements and other binds
; -------------------------------------
::;lenny::( ͡° ͜ʖ ͡°)
::;sadlenny::( ͡° ʖ̯ ͡°)
::;runny::ᕕ( ͡° ͜ʖ ͡° )ᕗ	
::;menny::( ͠° ͟ʖ ͡°)
::;wenny::( ͡~ ͜ʖ ͡°)
::;plenny::͡° ͜ʖ ͡°
::;stony::( ͡ຈ ͜ʖ ͡ຈ)	
::;ilny::( ͡° _ʖ ͡°)
::;wutty::( ͝סּ ͜ʖ͡סּ)
::;silenny::( ͡^ ͜ʖ ͡^ )
::;stary::( ͡o ͜ʖ ͡o)
::;gary::ᕕ( ᐛ )ᕗ
::;regary::ᕕ( ᐕ )ᕗ
::;speedygary::三三ᕕ( ᐛ )ᕗ
::;spidgary::/╲/\(╭ ᐛ ╮)/\╱\
:*:@gmail::runar.fredagsvik@gmail.com
:*:@@::runar.fredagsvik@gmail.com
:*:@proton::runarsf@protonmail.com
:*:@just::JustRunez@gmail.com
:*:@mine::runar.miner@gmail.com
::;xd::lmao xd lol rofl ialmaorn pwnd roflmao iamallama XD lawl Cx
:*:r/::reddit.com/r/
+NumpadMult::×
+NumpadDiv::÷
::;b::🅱
^Esc::return
^!s::run, C:\Users\runarsf\AppData\Local\osu!\Skins\
^+o::sendRaw, C:\Users\runarsf\AppData\Local\osu!\Skins\

PgUp::F22
PgDn::F21
End::F20

; #####################################
; Scripts
; #####################################
hk := "~LWin"
hotkey, % hk, super

; -------------------------------------
; Markdown codeblock formatting
; -------------------------------------
CapsLock & b::
lang = brainfuck
Gosub, clip2
return

CapsLock & v::
lang = autohotkey
Gosub, clip2
return

clip1:
	sendInput, ```{space}%lang%
	sleep, 16
	SendInput, {Enter}
	sleep, 16
	sendInput, {Control Down} v {Control Up}
	sleep, 16
	sendInput, ```{Enter}
	sleep, 16
	sendInput, {Enter}
	Clipboard := oclip
return

clip2:
	String=%clipboard%
	oclip=%clipboard%
	Clipboard := String
	StringReplace, Clipboard, Clipboard, ¤`, ¤¤`, All
	sleep, 100
Gosub, clip1
return

; -------------------------------------
; Mail signature
; -------------------------------------
::;sign::
sendRaw, Runar Fredagsvik
sendRaw, +47 948 67 816
sendRaw, VG2 Studieretning for IKT Servicefag
return

; -------------------------------------
; Firefox
; -------------------------------------
F1::
if window_minmax <> 0
{
	F1::F1
}
if !WinExist, ahk_class MozillaWindowClass
		run, firefox.exe
	if WinActive("ahk_class MozillaWindowClass")
		send, ^{tab}
	else
		WinActivate ahk_class MozillaWindowClass
	return
return 

; -------------------------------------
; Media keys
; -------------------------------------
NumpadDot::return																						; Disable NumpadDot
	NumpadDot & NumpadSub::																				; Next media.
send, {Media_Next}
return
	NumpadDot & NumpadDiv::																				; Previous media.
send, {Media_Prev}
return
	NumpadDot & NumpadMult::																				; Pause media.
send, {Media_Play_Pause}
return
	NumpadDot & NumpadAdd::																				; Stop media.
send, {Media_Stop}
return

; -------------------------------------
; Restart VoiceMeeter Banana
; -------------------------------------
^+!r::
process, close, voicemeeterpro.exe																			; Ends the process for VoiceMeeter Banana.
sleep, 500																							; Wait for 500ms.
run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe													; Launch VoiceMeeter Banana.
return

; -------------------------------------
; CapsLock modifier
; -------------------------------------
!CapsLock::
GetKeyState, capsstate, CapsLock, T
if capsstate = U
	SetCapsLockState AlwaysOn
else
	SetCapsLockState AlwaysOff
return

; ####################################
; Super/Win hotkeys
; ####################################

; -------------------------------------
; Double click Win
; ----------------------
~LWin Up::																							; Disables the Windows key.
if (A_PriorHotkey <> "~LWin Up" or A_TimeSincePriorHotkey > 200)
{
	KeyWait, #
	return
}
sendInput, {Alt Down}{Tab}
sleep, 16
sendInput, {Alt up}
return
#g::run %A_ScriptDir%\gui.ahk
#Enter::run, %A_ScriptDir%\prompt.ahk

; -------------------------------------
; Random shit
; -------------------------------------
#l::DllCall("LockWorkStation")																			; Shortcut for locking pc.
#+l::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)											; Shortcut for hibernating pc.
#q::!F4																								; Win+Q to Alt+F4 (xKill with SuperF4).
#r::run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\run.lnk										; Enables run dialog shortcut.

; -------------------------------------
; Empty recycle bin
; -------------------------------------
#Del::
FileRecycleEmpty																						; Empty recycle bin.
MsgBox, Recycle bin emptied
return

; -------------------------------------
; Search google for highlighted text
; -------------------------------------
#c::
send, ^c
sleep, 50
run, http://www.google.com/search?q=%clipboard%																; Search google for clipboard.
return

; -------------------------------------
; Always on top
; -------------------------------------
#space::																								; Super+Space to make window stay on top.
Winset, AlwaysOnTop, Toggle, A																			; Toggles the attribute AlwaysOnTop.
mousegetpos, x, y, possum
WinGet, ExStyle, ExStyle, ahk_id %possum%
if (ExStyle & 0x8)																						; 0x8 Checks if the window is AlwaysOnTop or not
	ExStyle = AlwaysOnTop
else
	ExStyle = Not AlwaysOnTop
ToolTip, %exstyle%																						; Shows a ToolTip that displays AlwaysOnTop or Not AlwaysOnTop depending on what state AlwaysOnTop is in.
sleep, 1000																							; Sleeps for 1.5 Seconds.
ToolTip																								; Removes the ToolTip.
return

; -------------------------------------
; Restore/Maximize with hotkey
; -------------------------------------
#MButton::
#x::																									; Maximize/Restore active window with Super+X.
WinGet, active_id, ID, A
WinGet, checkmax, MinMax, A
If(checkmax == 1) {
	WinGet, active_id, ID, A
	WinRestore, ahk_id %active_id%
} else {
	WinGetClass, class, ahk_id %active_id%
	if class not in ahk_class WorkerW,Shell_TrayWnd, Button, SysListView32,Progman,#32768 
		WinMaximize, ahk_id %active_id%
}
return

; -------------------------------------
; Super key to resize windows
; -------------------------------------
#RButton::
MButton & RButton::

WinGetPos,,, W, H, A
MouseMove, W, H
loop {
	if (!GetKeyState("RButton","P")) {
		MouseGetPos, xpos, ypos 
		while (!GetKeyState("RButton","P")) {
			WinMove, A,,,, %xpos%, %ypos%
			break
		}
		break
	}
}
WinGetPos,,, W, H, A
MouseMove, W/2, H/2
return

; -------------------------------------
; Super key to move windows
; -------------------------------------
#LButton::
MButton & LButton::

CoordMode, Mouse, Relative
MouseGetPos, cur_win_x, cur_win_y, window_id
WinGet, window_minmax, MinMax, ahk_id %window_id%

if window_minmax <> 0
{
	return
}

CoordMode, Mouse, Screen
SetWinDelay, 0

loop
{
	if !GetKeyState("LButton", "P")
	{
		break
	}
	MouseGetPos, cur_x, cur_y
	WinMove, ahk_id %window_id%,, (cur_x - cur_win_x), (cur_y - cur_win_y)
}
return

; -------------------------------------
; Mouse position
; -------------------------------------
#MaxThreadsPerHotkey 2
^F8::
heck := !heck
loop 
{
if !heck
	break
MouseGetPos, mouseX, mouseY
tooltip, %mouseX% %mouseY%,,
tooltip
}
tooltip
return

; #####################################
; General IfWinActive scripts
; #####################################

; -------------------------------------
; osu! changes
; -------------------------------------
#IfWinActive, ahk_exe osu!.exe

+AppsKey::
SendInput, {!}recommend
sleep, 100
sendInput, {Enter Down}
sleep, 25
sendInput, {Enter Up}
sleep, 5000
return

AppsKey::
SendInput, {!}recommend hddt
sleep, 100
sendInput, {Enter Down}
sleep, 25
sendInput, {Enter Up}
sleep, 5000
return

;#a::WinMove, ahk_exe osu!.exe,, 73, 44,,

/*
~LButton Up::
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
*/
Insert::return
Numpad6::Escape
#IfWinActive

; -------------------------------------
; Fix console paste
; -------------------------------------
#If WinActive("ahk_class VirtualConsoleClass") and WinActive("ahk_exe ConEmu64.exe") || WinActive("ahk_class ConsoleWindowClass") and WinActive("ahk_exe cmd.exe") 
^v::
	SendInput, {Raw}%clipboard%
return
#IfWinActive
	
; -------------------------------------
; Double click space for fullscreen 
; -------------------------------------
#IfWinActive, - YouTube or Netflix
~Space::
if (A_PriorHotkey <> "~Space" or A_TimeSincePriorHotkey > 200)
{
	KeyWait, space
	return
}
sendInput, f
return
#IfWinActive

; -------------------------------------
; Task Manager taskbar
; -------------------------------------
#If WinActive("ahk_class Shell_TrayWnd") and WinActive("ahk_exe explorer.exe")
	~MButton Up::
		run, taskmgr.exe
		WinWait, ahk_class TaskManagerWindow
		WinActivate, ahk_class TaskManagerWindow
	return
#IfWinNotActive, ahk_class Shell_TrayWnd
	MButton::Mbutton
	return
#IfWinActive