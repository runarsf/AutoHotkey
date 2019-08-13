#SingleInstance, Force
#Persistent
SetBatchLines -1
#UseHook
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative
SetKeyDelay, 50, 50

;#IfWinActive ahk_exe DarkSoulsIII.exe
F1::equip()
;#IfWinActive

findImage(file, clickit) {
	ImageSearch, posX, posY, 0, 0, A_ScreenWidth, A_ScreenHeight, *60 %file%
	;ImageSearch, posX, posY, 0, 0, 1920, 1080, *60 %file%
	
	if (ErrorLevel == 0)
	{
		if (clickit)
		{
			MouseMove, %posX%, %posY%
			Sleep, 50
			MouseClick, Left, %posX%, %posY%,, 10
		}
		return true
	}
	else
		return false
}

equip() {
	; Right Hand Weapon 1
	if (not findImage("img\equipment.png", false))
		Send, {Escape}
	Send, {Right Down}
	Sleep, 1500
	Send, {Right Up}{Right}ee
}