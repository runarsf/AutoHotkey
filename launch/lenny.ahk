+Esc::reload
return

::;gmail::
	send, runar.fredagsvik@gmail.com
return
::;proton::
	send, runarsf@protonmail.com
return
::;jmail::
	send, JustRunez@gmail.com
return
::;mmail::
	send, runar.miner@gmail.com
return
::;xd::
	send, lmao xd lol rofl ialmaorn roflmao XD lawl Cx
return
::;lenny::
	send, ( ͡° ͜ʖ ͡°)
return
^!r::
	send, {!}recommend
return

; Lenny
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
return

; Gary
::;gary::ᕕ( ᐛ )ᕗ
::;regary::ᕕ( ᐕ )ᕗ
::;speedygary::三三ᕕ( ᐛ )ᕗ
::;spidgary::/╲/\(╭ ᐛ ╮)/\╱\
return

~LWin Up::return

#q::!F4
return

#r::
Run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\Run.lnk
return

#l::
Shutdown, 0
return

::md::
	Send, ``````{Space}
	InputBox, varMark, Enter text
	Send, %varMark%
	Send, ``````{Space}
	Send, {Enter}
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

#If GetKeyState("ScrollLock", "T")
	x::Numpad1
	z::Numpad2
	F1::F13
	F2::F14
	F3::F15
	F4::F16
	F5::F17
	F6::F18
	F7::F19
	F8::F20
	F9::F21
	F10::F22
	F11::F23
	F12::F24
return
return