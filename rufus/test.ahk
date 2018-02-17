SysGet, MonitorWorkArea, MonitorWorkArea, 1
yPos := MonitorWorkAreaBottom-cmToInches(3)*A_ScreenDPI
Gui, Add, Text,, The top of this window should be about 3cm up from the taskbar
Gui, Show, y%yPos% xCenter w350 h100

ESC::ExitApp

cmToInches(cm)
{
	return cm*0.3937
}