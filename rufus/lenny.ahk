; -------------------------------------
; Script behaviour
; -------------------------------------
#SingleInstance Force
#Persistent
#InstallKeybdHook
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
SetNumlockState AlwaysOn
SetCapslockState AlwaysOff
DetectHiddenWindows, On
#EscapeChar ¤
CoordMode, Mouse, Screen
menu, tray, Icon, %A_ScriptDir%\icons\cmd.ico
SetDefaultMouseSpeed, 0 
Gosub, continuestart 


movecontrols: ;3

run, C:\Program Files (x86)\VB\Voicemeeter\VoicemeeterMacroButtons.exe
sleep, 150
WinWait, ahk_exe VoicemeeterMacroButtons.exe 
WinActivate, ahk_exe VoicemeeterMacroButtons.exe 
;WinActivate, ahk_exe LuaMacros.exe
WinMove, ahk_exe VoicemeeterMacroButtons.exe,, -1925, 915, 316, 170
WinSet, AlwaysOnTop, On, ahk_exe VoicemeeterMacroButtons.exe 

Gosub, donestart

continuestart: ;1
ToolTip, lenny.ahk launched, 1910, 1070
SetTimer, RemoveToolTip, 5000
return

RemoveToolTip:	;2
SetTimer, RemoveToolTip, Off
ToolTip
return

+Esc::reload

sleep, 1000
Gosub, movecontrols

donestart: ;4
; -------------------------------------
; Script access
; -------------------------------------
^!a::edit, %A_ScriptName%
^!+a::run, explorer.exe %A_ScriptDir%

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

^Numpad5::sendRaw, (
^Numpad6::sendRaw, )
^Numpad8::SendRaw, {
^Numpad9::SendRaw, }
	
	
#1::
prog := "ahk_exe firefox.exe"
loc := "firefox.exe"
IfWinActive %prog%
	send, ^{tab}
IfWinNotExist %prog%
	run, %loc%
WinWait %prog%
WinActivate %prog%
IfWinExist %prog%
	WinActivate %prog%
return
#2::
prog := "ahk_exe chrome.exe"
loc := "chrome.exe"
IfWinActive %prog%
	send, ^{tab}
IfWinNotExist %prog%
	run, %loc%
WinWait %prog%
WinActivate %prog%
IfWinExist %prog%
	WinActivate %prog%
return
	
; #####################################
; Scripts
; #####################################
	hk := "~LWin"
	hotkey, % hk, super
	
; -------------------------------------
; Media keys
; -------------------------------------
	NumpadDot & NumpadSub::
	send, {Media_Next}
	return
	NumpadDot & NumpadDiv::
	send, {Media_Prev}
	return,
	NumpadDot & NumpadMult::
	send, {Media_Play_Pause}
	return
	NumpadDot & NumLock::
	send, {Media_Stop}
	return
	NumpadDot & Numpad9::
	send, {Volume_Up}
	return
	NumpadDot & Numpad6::
	send, {Volume_Down}
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
;NumpadDot::return
	
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
process, close, voicemeeterpro.exe
sleep, 500
run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe
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

; -------------------------------------
; CapsLock Mouse Control
; -------------------------------------
CapsLock & r::MouseClick,WheelUp,,,10,0,D,R
CapsLock & f::MouseClick,WheelDown,,,10,0,D,R
CapsLock & t::PgUp
CapsLock & g::PgDn
CapsLock & q::MouseClick, left ; when you press q, mouse will left click
CapsLock & e::MouseClick, right ; when you press e, mouse will right click
CapsLock & w::MouseMove, 0, -55, 5, R ; when you press w, mouse will move up 25 pixels
CapsLock & s::MouseMove, 0, 55, 5, R ; when you press s, mouse will move down 25 pixels
CapsLock & a::MouseMove, -55, 0, 5, R ; when you press a, mouse will move left 25 pixels
CapsLock & d::MouseMove, 55, 0, 5, R ; when you press d, mouse will move right 25 pixels

; ####################################
; Super/Win hotkeys
; ####################################

; -------------------------------------
; Double click Win
; -------------------------------------
~LWin Up::return
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
#+l::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
#q::!F4
#r::run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\run.lnk

; -------------------------------------
; Empty recycle bin
; -------------------------------------
#Del::
FileRecycleEmpty
MsgBox, Recycle bin emptied
return

; -------------------------------------
; Search google for highlighted text
; -------------------------------------
#c::
send, ^c
sleep, 50
run, http://www.google.com/search?q=%clipboard%
return

; -------------------------------------
; Search reddit for highlighted text
; -------------------------------------
#+c::
send, ^c
sleep, 50
run, https://www.reddit.com/r/Piracy/search?q=%clipboard%&restrict_sr=on&include_over_18=on&sort=relevance&t=all
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