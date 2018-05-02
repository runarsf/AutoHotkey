#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

gameExe := AchievementClicker.exe
gameCls := UnityWndClass
gameShortcut := game.url

loop:
loop {
	if (BreakLoop = 1)
		break 
	run, %gameShortcut%
	WinWait, ahk_exe %gameExe%
	sleep, 100
	WinActivate, ahk_exe %gameExe%
	Sleep, 100
	Send, {Enter}
	WinWait, ahk_class %gameCls%
	sleep, 4100
	Process, Close, %gameExe%
}