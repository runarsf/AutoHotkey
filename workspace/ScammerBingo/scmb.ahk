#SingleInstance Force
#Persistent
#InstallKeybdHook
;#Warn
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
#EscapeChar ¤
#MaxHotkeysPerInterval 2000
Menu, Tray, Icon, %A_ScriptDir%\icon.jpg

gui_main:
Gui, +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 250

w := 130 ; initial width
h := 75 ; initial height
x1 := 5 ; initial x position (columns, first button position (horizontal))
x2 := x1+w+x1
x3 := x2+w+x1
x4 := x3+w+x1
r1 := 5 ; initial y position (rows, first button position (vertical))
r2 := r1+h+r1
r3 := r2+h+r1
r4 := r3+h+r1
r5 := r4+h+r1
r6 := r5+h+r1

ww := x4+w+x1 ; add padding to right
hh := r6+h+r1 ; add padding to bottom
eb := hh+30+r1 ; add bottom info bar
bw := ww-r1-r1

; row 1
Gui, Add, Button, x%x1% y%r1% w%w% h%h% vb1, eventvwr
Gui, Add, Button, x%x2% y%r1% w%w% h%h% vb2, Network Protection Service
Gui, Add, Button, x%x3% y%r1% w%w% h%h% vb3, Each and Everything
Gui, Add, Button, x%x4% y%r1% w%w% h%h% vb4, Warranty Expired
; row 2
Gui, Add, Button, x%x1% y%r2% w%w% h%h% vb5, Virus
Gui, Add, Button, x%x2% y%r2% w%w% h%h% vb6, Errors and Warnings
Gui, Add, Button, x%x3% y%r2% w%w% h%h% vb7, Kevin
Gui, Add, Button, x%x4% y%r2% w%w% h%h% vb8, netstat
; row 3
Gui, Add, Button, x%x1% y%r3% w%w% h%h% vb9, Stopped Services
Gui, Add, Button, x%x2% y%r3% w%w% h%h% vb10, Bob
Gui, Add, Button, x%x3% y%r3% w%w% h%h% vb11, Lifetime
Gui, Add, Button, x%x4% y%r3% w%w% h%h% vb12, Not in India
; row 4
Gui, Add, Button, x%x1% y%r4% w%w% h%h% vb13, One time charge
Gui, Add, Button, x%x2% y%r4% w%w% h%h% vb14, Infection
Gui, Add, Button, x%x3% y%r4% w%w% h%h% vb15, Payment
Gui, Add, Button, x%x4% y%r4% w%w% h%h% vb16, Firewall
; row 5
Gui, Add, Button, x%x1% y%r5% w%w% h%h% vb17, Scan
Gui, Add, Button, x%x2% y%r5% w%w% h%h% vb18, Fastsupport
Gui, Add, Button, x%x3% y%r5% w%w% h%h% vb19, Logmein
Gui, Add, Button, x%x4% y%r5% w%w% h%h% vb20, Windows Key
; row 6
Gui, Add, Button, x%x1% y%r6% w%w% h%h% vb21, Windows Key (4 flags) + R
Gui, Add, Button, x%x2% y%r6% w%w% h%h% vb22, Secure Server
Gui, Add, Button, x%x3% y%r6% w%w% h%h% vb23, cmd.exe
Gui, Add, Button, x%x4% y%r6% w%w% h%h% vb24, Tree

Gui, Add, Button, x%x1% y%hh% w%bw% h%x1% gBarSplit

Gui, Show, w%ww% h%eb%, Tech Support Scammer Bingo
return

GuiClose:
ExitApp
return

BarSplit:
MsgBox, please don't click me owo
return