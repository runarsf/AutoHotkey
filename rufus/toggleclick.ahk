#SingleInstance,Force
toggle=0
return

^+rbutton::
toggle:=!toggle
if toggle=1
	click ,right ,down
else
	click, right, up
return