; ---------------------------------
; Script behaviour
; ---------------------------------

#SingleInstance Force								; Skip replace dialog.
;#NoEnv												; Prevents empty variables from being looked up as potential environment variables. .lnk files will NOT run if this is enabled.
SetTitleMatchMode 2									; A window's title can contain WinTitle anywhere inside it to be a match.
#Persistent											; Keeps a script permanently running.
;#Warn												; Enable warnings to assist with detecting common errors. May show unwanted error messages.
SetWorkingDir %A_ScriptDir%							; Ensures a persistent working directory.
SetNumlockState AlwaysOn							; Locks NumLock in an on state

+Esc::reload										; Reloads script with hotkey

super := #

; ---------------------------------
; Script access
; ---------------------------------
^!a::edit, %A_ScriptName%							; Open current script in editor
^!+a::run, explorer.exe %A_ScriptDir%				; Open the current script's path

; ---------------------------------
; Text replacements
; ---------------------------------
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
::;gmail::runar.fredagsvik@gmail.com
::;proton::runarsf@protonmail.com
::;jmail::JustRunez@gmail.com
::;mmail::runar.miner@gmail.com
::;xd::lmao xd lol rofl ialmaorn roflmao XD lawl Cx
::;pi::π

; ---------------------------------
; Default windows actions for 
; disabled windows hotkeys
; ---------------------------------
~LWin Up::return
~PgUp Up::return
~PgDn Up::return
~End Up::return
~Home Up::return
#l::shutdown, 0
#q::!F4
+NumpadMult::×
+NumpadDiv::÷
#r::run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\run.lnk

; ---------------------------------
; Media keys
; ---------------------------------
NumpadDot::return
NumpadDot & NumpadSub::
	send, {Media_Next}
return
NumpadDot & NumpadDiv::
	send, {Media_Prev}
return
NumpadDot & NumpadMult::
	send, {Media_Play_Pause}
return
NumpadDot & NumpadAdd::
	send, {Media_Stop}
return

; ---------------------------------
; Restart VoiceMeeter Banana
; ---------------------------------
^+!r::
	process, close, voicemeeterpro.exe
	sleep, 500
	run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe
return

; ---------------------------------
; CapsLock modifier
; ---------------------------------
SetCapslockState AlwaysOff

!CapsLock::
    GetKeyState, capsstate, CapsLock, T
    if capsstate = U
        SetCapsLockState AlwaysOn
    else
        SetCapsLockState AlwaysOff
    return

CapsLock & f:: 
    send fuqoff
return

; ---------------------------------
; Remap osu! keys
; ---------------------------------
#IfWinActive, ahk_exe, osu!.exe
	AppsKey::
		SendRaw, !recommend
		sleep, 5000
	return
	Numpad4::Numpad1
	Numpad5::Numpad2
	Numpad7::Numpad1
	Numpad8::Numpad2
return
#IfWinActive 