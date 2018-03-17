#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
#EscapeChar ¤
CoordMode, ToolTip, Screen
menu, tray, Icon, %A_ScriptDir%\icon.ico

if WinExist("ahk_exe fman.exe")
{
	Gosub, scan
}
else 
{
	run, C:\Users\rufus\AppData\Local\fman\fman.exe
	Gosub, scan
}

scan:
WinWait, ahk_exe fman.exe
WinActivate, ahk_exe fman.exe
WinActivate, ahk_exe fman.exe

ImageSearch, aX, aY, 0, 0, A_ScreenWidth, A_ScreenHeight, A.png
ImageSearch, bX, bY, 0, 0, A_ScreenWidth, A_ScreenHeight, B.png
ImageSearch, cX, cY, 0, 0, A_ScreenWidth, A_ScreenHeight, C.png

ImageSearch, ButtonAX, ButtonAY, 0, 0, A_ScreenWidth, A_ScreenHeight, buttonA.png
ImageSearch, ButtonBX, ButtonBY, 0, 0, A_ScreenWidth, A_ScreenHeight, buttonB.png
ImageSearch, ButtonCX, ButtonCY, 0, 0, A_ScreenWidth, A_ScreenHeight, buttonC.png

if aX >= 1 
{
	MouseClick, Left, ButtonAX+15, ButtonAY+10
}
else if bX >= 1 
{
	MouseClick, Left, ButtonBX+15, ButtonBY+10
} 
else if cX >= 1 
{
	MouseClick, Left, ButtonCX+15, ButtonCY+10
}
Sleep, 500
ExitApp
return

#F::Gosub, scan