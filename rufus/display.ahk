#EscapeChar ¤
IniRead, IniOut, display.ini, Options, Res
if IniOut = 1
{
	IniWrite, 0, display.ini, Options, Res
	run, cmd.exe /k cd /d D:\ & D:\display.exe -device 1 -rotate 180 & exit
}
else
{
	IniWrite, 1, display.ini, Options, Res
	run, cmd.exe /k cd /d D:\ & D:\display.exe -device 1 -rotate 180 -toggle & exit
}