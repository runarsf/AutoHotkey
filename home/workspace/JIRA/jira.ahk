#SingleInstance, Force
#Persistent
SetWorkingDir, %A_ScriptDir%
Menu, Tray, NoStandard
Menu, Tray, Icon, icon.png
Menu, Tray, Add, Exit, exit
Menu, Tray, Add, Explore, explore
Menu, Tray, Add, Edit, editScript
Menu, Tray, Add
Menu, Tray, Add, gui, gui

global case
global domain

gui() {
	read()
	if(WinExist("JIRAgui")) {
		reload
	}
	if(!domain) {
		domain := ""
	}
	Gui 1: +AlwaysOnTop +ToolWindow +LastFound +Resize
	Gui 1: Color, 252525, 303030
	Gui 1: Font, s12 cWhite, Consolas
	Gui 1: Add, Text, x10 y8, Domain
	Gui 1: Add, Text, x10 y38, Case (PROJ-1234)
	Gui 1: Add, Edit, x175 y5 r1 w200 vdomain, %domain%
	Gui 1: Add, Edit, x175 y35 r1 w200 vcase
	Gui 1: Font, s12, Consolas
	Gui 1: Show,, JIRAgui
	WinWait, JIRAgui
	WinActivate, JIRAgui
	SendInput, {Tab}
}
write() {
	Gui, Submit, NoHide
	IniWrite, %domain%, jui.ini, Settings, domain
	IniWrite, %case%, jui.ini, Settings, case
}
read() {
	Gui, Submit, NoHide
	IniRead, domain, jui.ini, Settings, Domain
	IniRead, case, jui.ini, Settings, case
}
editScript() {
	Edit, %A_ScriptFullPath%
}
exit() {
	ExitApp
}
explore() {
	run, %A_ScriptDir%
}

#IfWinActive, JIRAgui
^s::
NumpadEnter::
Enter::
write()
read()
run, "https://jira.%domain%/browse/%case%"
reload
return
up::
GuiControl, text, case, %case%
return
down::
GuiControl, text, case, 
#IfWinActive
^!j::
gui()
return

GuiClose() {
	reload
}
GuiEscape() {
	reload
}