#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
DetectHiddenWindows, On																					; Enables the detection of hidden windows
#EscapeChar ¤
CoordMode, Mouse, Screen

gui:
Gui, +AlwaysOnTop +LastFound +Caption -dpiscale
Gui, Font, s10 cBlack, Source Code Pro,

If (%A_ScreenHeight% = 1080) {
		Gui, Add, Edit, x720 y540 w256 r1 vSearch
	} else {
		Gui, Add, Edit, x555 y383 w256 r1 vSearch
	}
Gui, Show, h%A_ScreenHeight% w%A_ScreenWidth%, startpage
return


Launch:
Gui, Submit, NoHide
Gui, Destroy
return

GuiClose:
ExitApp
return