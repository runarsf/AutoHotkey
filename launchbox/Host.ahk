; Created by Asger Juul Brunshøj

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance
menu, tray, icon, shell32.dll, 246 					; Changes the tray icon
SetCapsLockState, AlwaysOff

ToolTip, host.ahk launched, 980, 1070											; Display tooltip
SetTimer, RemoveToolTip, 5000													; Set the length of the tooltip
return

RemoveToolTip:																	; Define RemoveToolTip
SetTimer, RemoveToolTip, Off
ToolTip																			; Removes the tooltip
return

; #InstallKeybdHook

;-------------------------------------------------------
; AUTO EXECUTE SECTION FOR INCLUDED SCRIPTS
; Scripts being included need to have their auto execute
; section in a function or subroutine which is then
; executed below.
;-------------------------------------------------------
Gosub, gui_autoexecute
;-------------------------------------------------------
; END AUTO EXECUTE SECTION
return
;-------------------------------------------------------

; Load the GUI code
#Include %A_ScriptDir%\GUI\GUI.ahk

; General settings
#Include %A_ScriptDir%\Miscellaneous\miscellaneous.ahk
