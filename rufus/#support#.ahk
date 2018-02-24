#SingleInstance, Force ; Skips replace dialog
#Singleinstance force

html=
(
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
    html {overflow:hidden}
    body {background:#FF00FF;}
    button {background: #03445A; color: #FFFF26; border:0; margin: 5px; font-family:'Calibri'; min-width:100px; height: 60px;}
    button:hover {background: #068FBD};
</style>
</head>
<body>
    <button id='foo'>Button 1</button>
    <button id='bar'>Button 2</button>
</body>
</html>
)

; Gui, +ToolWindow -Caption 
Gui,Margin,0,0
Gui, Add, ActiveX, W400 H300 x0 y0 vdoc, HTMLFile
doc.write(html)
Gui, Show, Center, Test
; WinSet, Transcolor, FF00FF, Test
add_ButtonHandler()
return


foo_OnClick() {
    MsgBox Foo!
}

bar_OnClick(){
    MsgBox Bar!
}

add_ButtonHandler() {
	global
	Loop % doc.getElementsByTagName("Button").length
		ComObjConnect(b_%A_Index%:=doc.getElementsByTagName("Button")[A_Index-1], b_%A_Index%.GetAttribute("Id") "_")
}