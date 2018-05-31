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

; -------------------------------------
; Text replacements and other binds
; -------------------------------------
+Esc::reload
^!a::edit, %A_ScriptName%
::;lenny::( ͡° ͜ʖ ͡°)
+NumpadMult::×
+NumpadDiv::÷
^Numpad5::sendRaw, (
^Numpad6::sendRaw, )
^Numpad8::SendRaw, {
^Numpad9::SendRaw, }
^Numpad2::SendRaw, [
^Numpad3::SendRaw, ]
#l::DllCall("LockWorkStation")
#+l::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
#r::run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\run.lnk
#q::!F4

Class Active {
	
	browser(prog, loc, key) {
		hk := %key%
		hotkey, % hk, super
		
		IfWinActive %prog%
			send, ^{tab}
		IfWinNotExist %prog%
			run, %loc%
		WinWait %prog%
		WinActivate %prog%
		IfWinExist %prog%
			WinActivate %prog%
		return
	}
	
}
Active.browser("ahk_exe firefox.exe", "firefox.exe", "#1")

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

~LWin Up::return
#Enter::run, %A_ScriptDir%\prompt.ahk

; -------------------------------------
; Empty recycle bin
; -------------------------------------
#Del::
FileRecycleEmpty
MsgBox, Recycle bin emptied
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