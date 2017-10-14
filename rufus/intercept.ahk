+!Esc::reload
return

#if (getKeyState("F23", "P"))
F12::return

a::return
b::return
c::return
d::return
e::return
f::return
g::return
h::return
i::return
j::return
k::return
l::return
m::return
n::run, C:\Program Files\Notepad++\notepad++.exe
return
o::run, %UserProfile%\AppData\Local\osu!\osu!.exe
return
p::return
q::return
r::sendInput, Rawr xd {Enter}
return
s::run, shell:startup
return
t::return
u::return
v::return
w::return
x::sendInput, lmao xd lol rofl ialmaorn roflmao XD lawl Cx {Enter}
return
y::return
z::return
0::return
1::return
2::return
3::return
4::return
5::run, %appdata%
6::return
7::return
8::return
9::return
;F1::return
F2::return
F3::return
F4::return
F5::return
F6::return
F7::return
F8::return
F9::return
F10::return
F11::run, C:\Program Files\AutoHotkey\AU3_Spy.exe
; F12::return
Numpad0::return
Numpad1::return
Numpad2::return
Numpad3::return
Numpad4::return
Numpad5::return
Numpad6::return
Numpad7::return
Numpad8::return
Numpad9::return
Enter::run, C:\Program Files (x86)\cmder\Cmder.exe
Delete::return
Space::run, explorer.exe

F1::
	IfWinNotExist, ahk_class MozillaWindowClass
		run, firefox.exe
	if WinActive("ahk_class MozillaWindowClass")
		send, ^{tab}
	else
		WinActivate ahk_class MozillaWindowClass
	return
return 