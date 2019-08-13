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
Menu, Tray, Add, Is it lunch?, lunch

global case
global domain
global lunchtime
global newlunch
global clock
lunchtime := 1515 + 0
clock := A_Hour . A_Min + 0
newlunch := % lunchtime + 30
MsgBox %clock% %lunchtime% %newlunch%

lunch() {
	global texter
	Gui 2: +AlwaysOnTop +ToolWindow +LastFound -Resize 
	Gui 2: Color, 975250, 303030
	Gui 2: Font, s12 cWhite, Consolas
	Gui 2: Add, Text, x36 y18 vtexter, '  '
	Gui 2: Show, w110 h60, Is it lunch yet?
	
	SetTimer, CheckTime, 1000
	Return
	
	CheckTime:
	if (A_Hour . A_Min > %lunchtime%) and (A_Hour . A_Min < %newlunch%)
	{
		Gui 2: Color, 479168, 303030
		GuiControl 2: Text, texter, Yup!
	}
	else
	{
		Gui 2: Color, 975250, 303030
		GuiControl 2: Text, texter, Nope
	}
	return
}

gui() {
	read()
	if(WinExist("JIRAgui")) {
		reload
	}
	if(!domain) {
		domain := ""
	}
	string := "asdfasdfasdfasdf - something is written here"
	Gui 1: +AlwaysOnTop +ToolWindow +LastFound +Resize
	Gui 1: Color, 252525, 303030
	Gui 1: Font, s12 cWhite, Consolas
	Gui 1: Add, Text, x10 y8, Domain
	Gui 1: Add, Text, x10 y38, Case (PROJ-1234)
	Gui 1: Add, Edit, x175 y35 r1 w200 vcase, % SubStr(case, 1, InStr(case, "-"))
	Gui 1: Add, Edit, x175 y5 r1 w200 vdomain, %domain%
	Gui 1: Show,, JIRAgui
	WinWait, JIRAgui
	WinActivate, JIRAgui
	SendInput, {Right}
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
2GuiClose() {
	reload
}