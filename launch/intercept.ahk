+!Esc::reload
return

#if (getKeyState("F23", "P"))
F12::return

a::
return
b::
return
c::run, %UserProfile%\Desktop\Counter-Strike Global Offensive.url
return
d::
return
e::
return
f::
return
g::
return
h::
return
i::
return
j::
return
k::
return
l::
return
m::
return
n::run, C:\Program Files\Notepad++\notepad++.exe
return
o::run, %UserProfile%\AppData\Local\osu!\osu!.exe
return
p::
return
q::
return
r::sendInput, Rawr xd {Enter}
return
s::run, shell:startup
return
t::
return
u::
return
v::
return
w::
return
x::sendInput, lmao xd lol rofl ialmaorn roflmao XD lawl Cx {Enter}
return
y::
return
z::
return
0::
return
1::
return
2::
return
3::
return
4::
return
5::run, %appdata%
return
6::
return
7::
return
8::
return
9::
return
; F1::
return
F2::
return
F3::
return
F4::
return
F5::TaskbarMove("Top")
F6::TaskbarMove("Bottom")
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
return
F8::run, D:\Documents\Tools\Coding\Autohotkey\TaskbarBGone.ahk
return
F9::
return
F10::
return
F11::run, C:\Program Files\AutoHotkey\AU3_Spy.exe
return
; F12::
return
; Numpad0::
return
Numpad1::
return
Numpad2::
return
Numpad3::
return
Numpad4::
return
Numpad5::
return
Numpad6::
return
Numpad7::
return
Numpad8::
return
Numpad9::
return
Enter::run, C:\Windows\System32\cmd.exe
return
Delete::
return
Space::run, explorer.exe
return

Numpad0::
Random, A, 0, 20
If (A = 0)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh0.mp3
If (A = 1)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh1.mp3
If (A = 2)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh2.mp3
If (A = 3)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh3.mp3
If (A = 4)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh4.mp3
If (A = 5)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh5.mp3
If (A = 6)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh6.mp3
If (A = 7)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh7.mp3
If (A = 8)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh8.mp3
If (A = 9)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh9.mp3
If (A = 10)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh10.mp3
If (A = 11)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh11.mp3
If (A = 12)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh12.mp3
If (A = 13)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh13.mp3
If (A = 14)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh14.mp3
If (A = 15)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh15.mp3
If (A = 16)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh16.mp3
If (A = 17)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh17.mp3
If (A = 18)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh18.mp3
If (A = 19)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh19.mp3
If (A = 20)
    SoundPlay, D:\Documents\Audio\SoundEffects\Seal\Blargh20.mp3
return
	
;#IfWinActive
	
F1::
IfWinNotExist, ahk_class YandexBrowser_WidgetWin_1
	run, %UserProfile%\AppData\Local\Yandex\YandexBrowser\Application\browser.exe
if WinActive("ahk_class YandexBrowser_WidgetWin_1")
	send, ^{tab}
else
	WinActivate ahk_class YandexBrowser_WidgetWin_1
return