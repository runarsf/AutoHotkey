#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
DetectHiddenWindows, On																					; Enables the detection of hidden windows
#EscapeChar ¤
CoordMode, Mouse, Screen
menu, tray, Icon, %A_ScriptDir%\icons\cmd.ico

