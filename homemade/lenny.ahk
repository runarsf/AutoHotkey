+Esc::reload
return

~LWin Up::return

::;gmail::runar.fredagsvik@gmail.com
::;proton::runarsf@protonmail.com
::;jmail::JustRunez@gmail.com
::;mmail::runar.miner@gmail.com
::;xd::lmao xd lol rofl ialmaorn roflmao XD lawl Cx
return

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
return

^!r::
	send, {!}recommend
	sleep, 16
	send, {Enter}
return

#q::!F4
return

#r::
Run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\Run.lnk
return

#l::
Shutdown, 0
return

NumpadDot & NumpadSub::
send {Media_Next}
return
NumpadDot & NumpadDiv::
send {Media_Prev}
return
NumpadDot & NumpadMult::
send {Media_Play_Pause}
return
NumpadDot & NumpadAdd::
send {Media_Stop}
return
NumpadDot::
return

^+!r::
	Process, Close, voicemeeterpro.exe
	Sleep, 500
	run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe
return

If ( WinExist("ahk_class SunAwtFrame") )
	LWin::^r
return

#If GetKeyState("CapsLock", "T")
	x::Numpad1
	z::Numpad2
	return
return