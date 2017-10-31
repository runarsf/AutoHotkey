+!Esc::reload
return

#if (getKeyState("F23", "P"))
F12::return

a::return
b::return
c::return
d::return
e::return
;f::return
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
;F2::return
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
PrintScreen::return
ScrollLock::return
Space::run, explorer.exe

F::
	IfWinNotExist, ahk_class MozillaWindowClass
		run, firefox.exe
	if WinActive("ahk_class MozillaWindowClass")
		send, ^{tab}
	else
		WinActivate ahk_class MozillaWindowClass
	return
return 

F1::TaskbarMove("Top")
F2::TaskbarMove("Bottom")



TaskbarMove(p_pos) {
    label:="TaskbarMove_" p_pos

    WinExist("ahk_class Shell_TrayWnd")
    SysGet, s, Monitor

    if (IsLabel(label)) {
        Goto, %label%
    }
    return

    TaskbarMove_Top:
    TaskbarMove_Bottom:
    WinMove(sLeft, s%p_pos%, sRight, 0)
    return
}

WinMove(p_x, p_y, p_w="", p_h="", p_hwnd="") {
    WM_ENTERSIZEMOVE:=0x0231
    WM_EXITSIZEMOVE :=0x0232

    if (p_hwnd!="") {
        WinExist("ahk_id " p_hwnd)
    }

    SendMessage, WM_ENTERSIZEMOVE
    ;//Tooltip WinMove(%p_x%`, %p_y%`, %p_w%`, %p_h%)
    WinMove, , , p_x, p_y, p_w, p_h
    SendMessage, WM_EXITSIZEMOVE
}


/*
$NumpadMult::
while GetKeyState("NumpadMult","P")
	loop
	{
	count++
	tooltip, %count%
	sleep, 200
	
	}
return

$NumpadMult Up::
BreakLoop = 1
count = 0
return

if (count > 200)
	MsgBox, count over 200
	count := 0
	tooltip
tooltip
return
*/