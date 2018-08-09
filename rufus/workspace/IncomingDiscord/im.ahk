#SingleInstance Force
#Persistent
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%\frames
CoordMode, ToolTip, Screen

scan:
loop
{
	ImageSearch, frameX, frameY, -1920, 0, A_ScreenWidth, A_ScreenHeight, frame.png
	
	if (frame >= 1) 
	{
		ToolTip, typing
	}
	else 
	{
		tooltip, 何
		sleep, 0
	}
}

#F::Gosub, scan