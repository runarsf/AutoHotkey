#SingleInstance, force
#MaxHotkeysPerInterval,2000
SetWorkingDir, %A_ScriptDir%
start:
Gosub, gui
return


gui:
ComObjError(false)
IniRead, site, config.ini, Main, site,
Gui, Color, 252525, 303030
Gui Add, ActiveX, w980 h640 vWB, Mozilla.Browser  ; The final parameter is the name of the ActiveX component.
WB.Navigate("https://mail.protonmail.com/login")
Gui, Show,, browser-source
return


GuiClose:
ExitApp
return