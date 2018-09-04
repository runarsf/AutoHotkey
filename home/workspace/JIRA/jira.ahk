#SingleInstance, Force
#Persistent
SetWorkingDir, %A_ScriptDir%
Menu, Tray, NoStandard
Menu, Tray, Icon, icon.png
Menu, Tray, Add, gui, gui
Menu, Tray, Add
Menu, Tray, Add, Exit, GuiClose

global case
global domain

gui()
gui() {
	read()
	if(WinExist("JIRAgui")) {
		reload
	}
	else {
		Gui 1: +AlwaysOnTop +ToolWindow +LastFound +Resize
		Gui 1: Color, 252525, 303030
		Gui 1: Font, s12 cWhite, Consolas
		Gui 1: Add, Text, x10 y8, Domain
		Gui 1: Add, Text, x10 y38, Case (DRIF-1234)
		Gui 1: Add, Edit, x175 y5 r1 w200 vdomain, %domain%
		Gui 1: Add, Edit, x175 y35 r1 w200 vcase
		Gui 1: Font, s12, Consolas
		Gui 1: Show,, JIRAgui
	}
}
write() {
	Gui, Submit, NoHide
	IniWrite, %domain%, config.ini, Settings, domain
	IniWrite, %case%, config.ini, Settings, case
}
read() {
	Gui, Submit, NoHide
	IniRead, domain, config.ini, Settings, Domain
	IniRead, case, config.ini, Settings, case
}

#IfWinActive, JIRAgui
^s::
Enter::
write()
read()
MsgBox "https://jira.%domain%/browse/%case%"
return
#IfWinActive

GuiClose() {
	ExitApp
}
GuiEscape() {
	ExitApp
}