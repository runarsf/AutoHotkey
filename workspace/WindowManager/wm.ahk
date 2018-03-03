#SingleInstance Force
#Persistent
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
#EscapeChar ¤
;Menu, Tray, Icon, %A_ScriptDir%\icon.ico

gui_main:
Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
Gui, Color, 2f343f, 434852
WinSet, Transparent, 250

Gui

gui_show:
Gui, Show,, Window Manager Settings
return

GuiClose:
Gui, Submit
ExitApp
return

; -------------------------------------
; Always on top
; -------------------------------------
#space::																								; Super+Space to make window stay on top.
Winset, AlwaysOnTop, Toggle, A																			; Toggles the attribute AlwaysOnTop.
mousegetpos, x, y, possum
WinGet, ExStyle, ExStyle, ahk_id %possum%
if (ExStyle & 0x8)																						; 0x8 Checks if the window is AlwaysOnTop or not
	ExStyle = AlwaysOnTop
else
	ExStyle = Not AlwaysOnTop
ToolTip, %exstyle%																						; Shows a ToolTip that displays AlwaysOnTop or Not AlwaysOnTop depending on what state AlwaysOnTop is in.
sleep, 1000																							; Sleeps for 1.5 Seconds.
ToolTip																								; Removes the ToolTip.
return

; -------------------------------------
; Restore/Maximize with hotkey
; -------------------------------------
#x::																									; Maximize/Restore active window with Super+X.
WinGet, active_id, ID, A
WinGet, checkmax, MinMax, A
If(checkmax == 1) {
	WinGet, active_id, ID, A
	WinRestore, ahk_id %active_id%
} else {
	WinGetClass, class, ahk_id %active_id%
	if class not in ahk_class WorkerW,Shell_TrayWnd, Button, SysListView32,Progman,#32768 
		WinMaximize, ahk_id %active_id%
}
return

; -------------------------------------
; Super key to resize windows
; -------------------------------------
#RButton::
MButton & RButton::

WinGetPos,,, W, H, A
MouseMove, W, H
loop {
	if (!GetKeyState("RButton","P")) {
		MouseGetPos, xpos, ypos 
		while (!GetKeyState("RButton","P")) {
			WinMove, A,,,, %xpos%, %ypos%
			break
		}
		break
	}
}
WinGetPos,,, W, H, A
MouseMove, W/2, H/2
return

#RButton::																							; Hotkey to resize windows.
WinGetPos, , , W, H, A																					; Gets width and height from active window and stores them into the variables W and H.
H -= 5																								; Sets the variable H to H-5.
W -= 5																								; Sets the variable W to W-5.
MouseMove, W, H																						; Moves mouse to coordinates of W and H.
MouseClick,Left,,,,,D																					; Clicks left mouse button and holds it down.
Loop {																								; Starts a loop.
	if (!GetKeyState("RButton","P")) {																		; Checks if RButton is pressed or not.
		MouseClick,Left,,,,,U																			; Releases left mouse button when RButton is released.
		Break																						; Stops the loop.
	}
}
WinGetPos, , ,W,H,A																						; Gets width and height from active window after window is resized.
MouseMove, W/2, H/2																						; Moves mouse to the middle of the window.
return

; -------------------------------------
; Super key to move windows
; -------------------------------------
#LButton::
MButton & LButton::

CoordMode, Mouse, Relative
MouseGetPos, cur_win_x, cur_win_y, window_id
WinGet, window_minmax, MinMax, ahk_id %window_id%

if window_minmax <> 0
{
	return
}

CoordMode, Mouse, Screen
SetWinDelay, 0

loop
{
	if !GetKeyState("LButton", "P")
	{
		break
	}
	MouseGetPos, cur_x, cur_y
	WinMove, ahk_id %window_id%,, (cur_x - cur_win_x), (cur_y - cur_win_y)
}
return