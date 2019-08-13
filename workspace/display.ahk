#EscapeChar ¤
IniRead, IniOut, display.ini, Options, Res
IniRead, device, display.ini, Options, device
if IniOut = 1
{
	IniWrite, 0, display.ini, Options, Res
	run, cmd.exe /k cd /d D:\ & D:\display.exe -device %device% -rotate 90 & exit
}
else
{
	IniWrite, 1, display.ini, Options, Res
	run, cmd.exe /k cd /d D:\ & D:\display.exe -device %device% -rotate 180 & exit
} 