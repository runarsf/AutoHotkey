#SingleInstance, force
SetWorkingDir %A_ScriptDir%

gui:
Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
Gui, Font, s10 cWhite, Source Code Pro,
Gui, Add, Tab3,, Application|Appearance|Settings

Gui, Tab, Application,, Exact
Gui, Color, 2f343f, 000000
Gui, Add, Button, x200 y150 gLaunch, Launch

Gui, Tab, Appearance,, Exact
Gui, Color, 2f343f, 000000

Gui, Tab, Settings,, Exact
Gui, Add, GroupBox, w400 h300, osu!kps
Gui, Color, 2f343f, 000000

Gui, Show,, osu!kps
return

app:
Gui, +AlwaysOnTop +ToolWindow +LastFound +Caption
Gui, Font, s12 cWhite, Source Code Pro,
Gui, Color, 000000, 000000
Gui, Add, Text,, %k1%

k1 = 0
k1 = k1 + 1
sleep, 1000
k1 = 0

Gui, Show, h64 w164, osu!kps
return

Launch:
Gui, Submit, NoHide
Gui, Destroy
Gosub, app
return

GuiClose:
ExitApp
return