; ---------------------------------
; Script behaviour
; ---------------------------------

#SingleInstance Force								; Skip replace dialog.
SetTitleMatchMode 2									; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%							; Ensures a persistent working directory.
SendMode Input										; Recommended for new scripts due to its superior speed and reliability.

; ---------------------------------
; App launch with delays
; ---------------------------------
sleep, 15000
run, lenny.ahk
sleep, 5000
run, intercept.ahk
sleep, 5000
SetWorkingDir, D:\Documents\locker
run, locker.exe
sleep, 5000
sleep, 150
exit