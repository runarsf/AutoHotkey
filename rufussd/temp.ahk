; -------------------------------------
; Script behaviour
; -------------------------------------
#SingleInstance Force															; Skip replace dialog.
;#NoEnv																			; Prevents empty variables from being looked up as potential environment variables. .lnk files will NOT run if this is enabled.
SetTitleMatchMode 2																; A window's title can contain WinTitle anywhere inside it to be a match.
#Persistent																		; Keeps a script permanently running.
;#Warn																			; Enable warnings to assist with detecting common errors. May show unwanted error messages.
SetWorkingDir %A_ScriptDir%														; Ensures a persistent working directory.
SetNumlockState AlwaysOn														; Locks NumLock in an on state
SetCapslockState AlwaysOff														; Locks CapsLock in an off state
;SendMode Input																	; Recommended for new scripts due to its superior speed and reliability.
;menu, tray, icon, shell32.dll, 257												; Changes the tray icon

I_Icon = %A_ScriptDir%\icons\cmd.ico											; Defines I_Icon
IfExist, %I_Icon%																; Tests if I_Icon exists
menu, tray, Icon, %I_Icon%														; Sets the tray icon to the value of I_Icon

ToolTip, lenny.ahk launched, 1910, 1070											; Display tooltip
SetTimer, RemoveToolTip, 5000													; Set the length of the tooltip
return

RemoveToolTip:																	; Define RemoveToolTip
SetTimer, RemoveToolTip, Off
ToolTip																			; Removes the tooltip
return

+Esc::reload																	; Reloads script with hotkey

super := #

; -------------------------------------
; Script access
; -------------------------------------
^!a::edit, %A_ScriptName%														; Open current script in editor
^!+a::run, explorer.exe %A_ScriptDir%											; Open the current script's path

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
:*:;gmail::runar.fredagsvik@gmail.com
:*:@@::runar.fredagsvik@gmail.com
:*:;proton::runarsf@protonmail.com
:*:;jmail::JustRunez@gmail.com
:*:;mmail::runar.miner@gmail.com
::;xd::lmao xd lol rofl ialmaorn roflmao XD lawl Cx
::;pi::π
+NumpadMult::×
+NumpadDiv::÷

; -------------------------------------
; Default windows actions for 
; disabled windows hotkeys
; -------------------------------------
~LWin Up::return																; Disables the Windows key
#l::shutdown, 0																	; Shortcut for locking pc
#q::!F4																			; Win+Q to Alt+F4 (xKill with SuperF4)
#r::run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\run.lnk 	; Enables run dialog shortcut
#Del::FileRecycleEmpty															; Empty recycle bin

; -------------------------------------
; Always on top
; -------------------------------------
$#space:: 
	Winset, Alwaysontop, , A 													; Set current window always on top														; Display tooltip
	toggle := !toggle															; Defines toggle
	SetTimer, RemoveToolTip, 1500												; Set the length of the tooltip
	tooltip %hopl% = %toggle%   												; For debugging

	if toggle
	{
		sleep 100
	}
	else
	return

; -------------------------------------
; Media keys
; -------------------------------------
NumpadDot::return
NumpadDot & NumpadSub::															; Next media
	send, {Media_Next}
return
NumpadDot & NumpadDiv::															; Previous media
	send, {Media_Prev}
return
NumpadDot & NumpadMult::														; Pause media
	send, {Media_Play_Pause}
return
NumpadDot & NumpadAdd::															; Stop media
	send, {Media_Stop}
return

; -------------------------------------
; Restart VoiceMeeter Banana
; -------------------------------------
^+!r::
	process, close, voicemeeterpro.exe											; Ends the process for VoiceMeeter Banana
	sleep, 500																	; Wait for 500ms
	run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe				; Launch VoiceMeeter Banana
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
; Search google for highlighted text
; -------------------------------------
^+c::
	send, ^c
	sleep, 50
	run, http://www.google.com/search?q=%clipboard%								; Search google for clipboard
return

; -------------------------------------
; Remap osu! keys
; -------------------------------------
/*#IfWinActive, ahk_exe osu!.exe
	AppsKey::
		SendRaw, !recommend
		sleep, 5000
	return
#IfWinActive 
*/
; -------------------------------------
; Fix console paste
; -------------------------------------
#IfWinActive, ahk_class ConsoleWindowClass
^v::
	SendInput, {Raw}%clipboard%
return
#IfWinActive

; -------------------------------------
; Double click space for fullscreen 
; -------------------------------------
#IfWinActive, - YouTube
~Space::
	if (A_PriorHotkey <> "~Space" or A_TimeSincePriorHotkey > 200)
	{
		KeyWait, space
		return
	}
	;MouseClick, left, 960, 540, 2
	sendInput, f
return
#IfWinActive

; -------------------------------------
; Chrome hotkeys 
; -------------------------------------
#IfWinActive, ahk_class Chrome_WidgetWin_1
^n::^j
return
#IfWinActive 