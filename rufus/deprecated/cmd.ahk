#SingleInstance, Force
:*:cmd-::
	SendInput, Run in cmd:
	Input, var,, {enter}
	run cmd.exe /k %var%
return