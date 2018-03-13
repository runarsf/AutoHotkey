; -------------------------------------
; Script behaviour
; -------------------------------------
#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
#InstallKeybdHook
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
SetNumlockState AlwaysOn																					; Locks NumLock in an on state.
SetCapslockState AlwaysOff																				; Locks CapsLock in an off state.
DetectHiddenWindows, On																					; Enables the detection of hidden windows
#EscapeChar ¤
CoordMode, Mouse, Screen
menu, tray, Icon, %A_ScriptDir%\icons\cmd.ico

/*Menu, Tray, NoStandard
Menu, Tray, Add, Edit, EditScript
Menu, Tray, Add, Reload, ReloadApp
Menu, Tray, Add, Exit, CloseApp
Menu, Tray, Add
*/
Gosub, continuestart 


movecontrols: ;3
/*
;run, C:\Program Files (x86)\VB\Voicemeeter\VoicemeeterMacroButtons.exe
sleep, 150
WinWait, ahk_exe VoicemeeterMacroButtons.exe 
WinActivate, ahk_exe VoicemeeterMacroButtons.exe 
WinActivate, ahk_exe LuaMacros.exe
WinMove, ahk_exe VoicemeeterMacroButtons.exe,, -1925, 915, 170, 170
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

GoSub, noedit
EditScript:
edit, %A_ScriptName%
return
noedit:

CloseApp:
ExitApp
return

ReloadApp:
reload
return

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
::;xd::lmao xd lol rofl ialmaorn pwnd roflmao iamallama XD lawl Cx
+NumpadMult::×
+NumpadDiv::÷
::;b::🅱
^Esc::return
^!s::run, C:\Users\runarsf\AppData\Local\osu!\Skins\
^+o::sendRaw, C:\Users\runarsf\AppData\Local\osu!\Skins\
!a::WinActivate, ahk_exe Adobe Audition CC.exe
!f::WinActivate, ahk_exe firefox.exe
^!m::SendMessage 0x112, 0xF170, 2, , Program Manager
:*:taken-::
Input, var,, {enter}
sendInput, [~~%var%.me~~](http://%var%.me)\
return

; #####################################
; Scripts
; #####################################
hk := "~LWin"
hotkey, % hk, super

; -------------------------------------
; Media keys
; -------------------------------------
NumpadDot & NumpadSub::																				; Next media.
send, {Media_Next}
return
NumpadDot & NumpadDiv::																				; Previous media.
send, {Media_Prev}
return,
NumpadDot & NumpadMult::																				; Pause media.
send, {Media_Play_Pause}
return
NumpadDot & NumLock::																				; Stop media.
send, {Media_Stop}
return
NumpadDot & Numpad9::                                                                                    ; Spotify Volume Up
DetectHiddenWindows, On
ControlSend, ahk_parent, ^{Up}, ahk_class SpotifyMainWindow
return
NumpadDot & Numpad6::                                                                                    ; Spotify Volume Down
DetectHiddenWindows, On
ControlSend, ahk_parent, ^{Down}, ahk_class SpotifyMainWindow
return
NumpadDot & NumpadAdd::
prog := "ahk_exe Spotify.exe"
loc := "C:\Users\rufus\AppData\Roaming\Spotify\Spotify.exe"
IfWinNotExist %prog%
	run, %loc%
WinWait %prog%
WinActivate %prog%
IfWinExist %prog%
	WinActivate %prog%
WinActivate %prog%
return
NumpadDot::return

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
sendInput, {SC029} %lang%
sleep, 16
sendInput, Clipboard
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
; -------------------------------------
LWin Up::return
return
if (A_PriorHotkey <> "LWin" or A_TimeSincePriorHotkey > 200)
{
	KeyWait, LWin
	return
}
WinWait, Program Manager, 
Send, {ALTDOWN}{SHIFTDOWN}{SHIFTUP}{ALTUP}
return

#g::run %A_ScriptDir%\gui.ahk
#Enter::run, %A_ScriptDir%\prompt.ahk

; -------------------------------------
; Random shit
; -------------------------------------
#l::DllCall("LockWorkStation")
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

; -------------------------------------
; SNOW shits
; -------------------------------------
#IfWinActive, SNOW
$w::
if ( GetKeyState("CapsLock", "T") )
{
	send, w
	sleep, 10 ; 10 miliseconds
}
Else
	$w::w
return
#IfWinActive