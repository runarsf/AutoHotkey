+!Esc::reload
return

#if (getKeyState("F23", "P"))
F12::return

a::
b::
c::run, %UserProfile%\Desktop\Counter-Strike Global Offensive.url
d::
e::
f::
g::
h::
i::
j::
k::
l::
m::
n::run, C:\Program Files\Notepad++\notepad++.exe
o::run, %UserProfile%\AppData\Local\osu!\osu!.exe
p::
q::
r::sendInput, Rawr xd {Enter}
s::run, shell:startup
t::
u::
v::
w::
x::sendInput, lmao xd lol rofl ialmaorn roflmao XD lawl Cx {Enter}
y::
z::
0::
1::
2::
3::
4::
5::run, %appdata%
6::
7::
8::
9::
; F1::
F2::
F3::
F4::
F5::
F6::
F7::
F8::
F9::
F10::
F11::run, C:\Program Files\AutoHotkey\AU3_Spy.exe
; F12::
; Numpad0::
Numpad1::
Numpad2::
Numpad3::
Numpad4::
Numpad5::
Numpad6::
Numpad7::
Numpad8::
Numpad9::
Enter::run, C:\Windows\System32\cmd.exe
Delete::


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