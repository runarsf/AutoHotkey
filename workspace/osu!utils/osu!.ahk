#SingleInstance Force
#Persistent
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
#MaxHotkeysPerInterval 3
Menu, Tray, Icon, %A_ScriptDir%\osu!.ico

Pause::
ImageSearch, aX, aY, 0, 0, A_ScreenWidth, A_ScreenHeight, img\big.png
ImageSearch, bX, bY, 0, 0, A_ScreenWidth, A_ScreenHeight, img\bigL.png

if(aX >= 1 or bX >= 1)
{
	Tippy("Found")
	return
}
else
	return


Tippy(tipsHere, wait:=333)
{
	ToolTip, %tipsHere%,,,8
	SetTimer, noTip, %wait%
}
noTip:
ToolTip,,,,8
return