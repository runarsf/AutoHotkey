CapsLock & b::
lang = brainfuck
Gosub, clip2
return

CapsLock & v::
lang = autohotkey
Gosub, clip2
return

clip1:
sendInput, ```{space}%lang%
sleep, 16
SendInput, {Enter}
sleep, 16
sendInput, {Control Down} v {Control Up}
sleep, 16
sendInput, ```{Enter}
sleep, 16
sendInput, {Enter}
Clipboard := oclip
return

clip2:
String=%clipboard%
oclip=%clipboard%
Clipboard := String
StringReplace, Clipboard, Clipboard, ¤`, ¤¤`, All
sleep, 100
Gosub, clip1
return