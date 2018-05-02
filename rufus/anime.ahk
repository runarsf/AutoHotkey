#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, ToolTip, Screen

run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\run.lnk
sleep, 150
SendInput, chrome --app=https://kissanime.ru/BookmarkList
Sleep, 150
Send, {Enter}
sleep, 2000
WinGetActiveTitle, ActTitl
WinSet, Style, -0xC00000, %ActTitl%
ExitApp