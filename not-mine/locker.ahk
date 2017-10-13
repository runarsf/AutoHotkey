#SingleInstance Force
#Persistent
#NoTrayIcon
;#NoEnv
 
IfNotExist, %appdata%\MyFolder\Pwd.txt
{
FileCreateDir, %appdata%\MyFolder
FileAppend, Add, %appdata%\MyFolder\Pwd.txt
}
 
FileDelete, %appdata%\MyFolder\FolderLink.txt
FileAppend, %A_ScriptDir%, %appdata%\MyFolder\FolderLink.txt
 
SetBatchLines, -1
DetectHiddenText, On
FileReadLine, MyDocs, %appdata%\MyFolder\FolderLink.txt,1
FileReadLine, Pwd, %appdata%\MyFolder\Pwd.txt,1
 
;MsgBox, 32,©jmr@speeduae.com, Shortcut Keys`n`nCtrl+Shift+X = End Script`nCtrl+Shift+P = Change Password  `n`n Note: Put this program inside a folder and run. 
if Pwd = Add
{
actionlist = %appdata%\MyFolder\Pwd.txt
 
InputBox, myinputbox,Enter Password,Password:,,200,130,500,400
if ErrorLevel
    return
else
FileDelete, %actionlist%
FileAppend, %myinputbox%,%actionlist%
reload
return
 
}
 
SetTimer, Timer1, 100
 
 
Return
 
 
Gui:
Gui, +AlwaysOnTop -SysMenu +OwnDialogs 
Gui, Font, s12 cRed, Arial Bold 
Gui, Add, GroupBox, x10 y10 w305 h70, Enter Password 
Gui, Font, s12 cBlack, Arial Bold 
Gui, Add, Edit, vPassword x21 y40 w281 h25 Password 
Gui, Add, Button, Default x10 y90 w305 h30, Enter 
Gui, Show, Center w325, Folder is password protected
Return
 
 
 
ButtonEnter:
StringCaseSense, On
Gui, Submit
If Password = %Pwd% ;Change the word "Password" to the right of the equal(=) sign to your password.
{ 
SetTimer, Timer1, off
Run, %MyDocs%
SetTimer, Timer2, 2000
}
else
{
MsgBox, 16,Wrong Password, Invalid Password! `nTry Again!
}
 
Gui, Destroy
StringCaseSense, Off
Return 
 
 
 
 
 
 
Timer1: 
 
WinGetClass, Class, A
If Class contains CabinetWClass,ExploreWClass
{
WinGetText, Text, A
IfInString, Text, %MyDocs%
{
WinClose, A
WinActivate, This folder is password protected
Loop, Parse, Text, `n, `r
{
Path = %A_LoopField%
Break
}
If Path = My Documents
Path = %A_MyDocuments%
IfWinNotExist, This folder is password protected
Goto, Gui
}
}
Return
 
 
 
Timer2:
WinGet, Number_of_Windows, List,,, Program Manager
Loop, %Number_of_Windows%
{
ID := Number_of_Windows%A_Index%
WinGetClass, Class, ahk_id %ID%
If Class contains CabinetWClass,ExploreWClass
{
WinGetText, Text, ahk_id %ID%
IfInString, Text, %MyDocs%
Cnt++
}
}
If Cnt = 0
{
SetTimer, Timer2, Off
SetTimer, Timer1, On
}
Cnt = 0
Return
 
 
^+x::
actionlist = %appdata%\MyFolder\Pwd.txt
FileReadLine, Pwd2, %appdata%\MyFolder\Pwd.txt,1
InputBox, myoldpwd1, Enter Password,Password:,,200,130,500,400
if myoldpwd1 = %Pwd2%
{ 
ExitApp
}
else
{
MsgBox, 16,Wrong Password, Invalid Password! `nTry Again!
return
}
 
 
 
^+p::
actionlist = %appdata%\MyFolder\Pwd.txt
FileReadLine, Pwd1, %appdata%\MyFolder\Pwd.txt,1
InputBox, myoldpwd,Old Password,Old Password:,,200,130,500,400
if myoldpwd = %Pwd1%
{ 
InputBox, myinputbox,Change Password,New Password:,,200,130,500,400
if ErrorLevel
    return
else
FileDelete, %actionlist%
FileAppend, %myinputbox%,%actionlist%
reload
return
}
else
{
 
MsgBox, 16,Wrong Password, Invalid Password! `nTry Again!
return
}