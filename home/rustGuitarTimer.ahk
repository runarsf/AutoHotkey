#Persistent
#SingleInstance, Force

!+i::Gosub, setTime
^+esc::ExitApp

setTime:
;minute:=A_Min+1
InputBox, thatTime, Rust Guitar Timer, When do you want to be EPIC GUITAR GAMER? (HHMMSSMsMsMs),,,,,,,,%A_Hour%%A_Min%%A_Sec%%A_MSec%
if ErrorLevel
	return
else {
	Ran := 0
	thatTime:=thatTime-6900
	Gosub, setTimer
}

setTimer:
SetTimer, checkTime, 100
Return

checkTime:
theTime = %A_Hour%%A_Min%%A_Sec%%A_MSec%
If (theTime >= thatTime) && !(Ran)
{
	SendInput, {Insert Down}
	sleep, 100
	SendInput, {Insert Up}
	Ran := 1
}
