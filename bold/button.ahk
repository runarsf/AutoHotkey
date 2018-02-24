; Toggle.ahk - Readymade code for a Graphical Checkbox

Gui, +Sysmenu +ToolWindow
Gui, Margin,12,12
Gui, Add , Picture, x13 y13 w32 h32 E0x200 vState1 icon1 gSubRoutine1, %A_AhkPath%
Gui, Add , Picture, x13 y13 w34 h34 Border vState0 icon1 gSubRoutine1, %A_AhkPath%
GoSub, Toggle_Switch

Gui, Show, x50 y50 AutoSize, Toggle
Return

Toggle_Switch:
If Toggle=0
  {
   GuiControl, Hide, State0
   GuiControl, Show, State1
   Toggle=1
  }
Else {
   GuiControl, Hide, State1
   GuiControl, Show, State0
   Toggle=0
}
Return

SubRoutine1:
GoSub,Toggle_Switch
;                     < - - - - - - - - P U T  Y O U R  C O D E  H E R E
Return

GuiEscape:
GuiClose:
ExitApp
Return