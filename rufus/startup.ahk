; ---------------------------------
; Script behaviour
; ---------------------------------
#SingleInstance Force													; Skip replace dialog.
SetTitleMatchMode 2														; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%												; Ensures a persistent working directory.
SendMode Input															; Recommended for new scripts due to its superior speed and reliability.

; ---------------------------------
; App launch with delays
; ---------------------------------
sleep, 10000		
	run, lenny.ahk															; Runs the lenny script
;sleep, 1000
;	run, intercept.ahk
sleep, 1000
	SetWorkingDir, C:\Users\runarsf\Documents\locker										; Changes the working directory
	run, locker.exe															; Runs the locker executable
;sleep, 5000
;	SetWorkingDir, C:\Users\runarsf\Documents\GitHub\AutoHotkey\launchbox	; Changes the working directory
;	run, host.ahk															; Runs the host sctipt
;sleep, 1000
;	SetWorkingDir, C:\Users\runarsf\Documents\GitHub\AutoHotkey\bold	; Changes the working directory
;	run, multidesk.ahk														; Runs the multidesk script
sleep, 150

ToolTip, Starting processes, 1910, 1070											; Display tooltip
SetTimer, RemoveToolTip, 5000													; Set the length of the tooltip
return

RemoveToolTip:																	; Define RemoveToolTip
SetTimer, RemoveToolTip, Off
ToolTip																			; Removes the tooltip

ExitApp																		; Ends this script