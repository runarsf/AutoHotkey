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
		
	
	
	
	^w::
	if train <= 0
	{
		SendInput, {w Down}
		train := 1
		return
	}
	else if train = 1
	{
		SendInput, {w Up}
		train := 0
		return
	}