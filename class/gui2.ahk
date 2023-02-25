#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force

;;#IfWinActive 열기 ;;; command only works for hotkeys and hotstrings

line_number := 0


;gui, 1:color, 34b4eb
gui, 1:color, FFA500
gui, 1:+alwaysontop
gui, 1:show, w300 h80 x2550 y70,      =]
gui, 1:add, button, x30 y10 w200 h60 GMYBUTTON, LOAD FILE!

gui, 1:add, edit, X250 y20 w30 vline_edit, %line_number%
gui, 1:add, button, x250 y45 gSubmitButton, Submit
Gui Show

return



;;===============================================================================
; Define function to be triggered by hotkey
MyButton:

WINACTIVATE, 열기
WinWaitActive, 열기
;; ========== WINACTIVATE, THEN SELECT THE FILE FROM THE OPENBOX
IF (LINE_NUMBER = 0){
	WINACTIVATE, 열기
wingetclass, deg_class, A
sendinput, {tab}
sleep, 100
controlfocus, SysListView321, ahk_class %deg_class%
sleep, 100
SENDINPUT, {DOWN}{UP}{ENTER}
sleep, 100
line_number++
guicontrol,, line_edit, %line_number%
sleep, 300
IfWinActive, ahk_class #32770
{
sendinput, {enter}
}
RETURN
}

ELSE
{
	WINACTIVATE, 열기
wingetclass, deg_class, A
sendinput, {tab}
sleep, 100
controlfocus, SysListView321, ahk_class %deg_class%
sleep, 100
sendinput, {down %line_number%}
sendinput, {enter}
line_number++
guicontrol,, line_edit, %line_number%
sleep, 300
IfWinActive, ahk_class #32770
{
sendinput, {enter}
}

}
return

;;===============================================================================



/*
line_edit:
GuiControlGet, line_number, , line_edit
Return
*/

SubmitButton:
GuiControlGet, line_number, , line_edit
line_number--
Gui, Submit, NoHide
Return




/*
; Bind hotkey to the 'g' key
$f3::
    GuiControl, Focus, MyButton
    ControlSend, Button1, {Space}, ahk_class AutoHotkeyGUI
return

*/



;; ======================		SUBMIT VALUES AND CLOSE EXIT APP		====================
submit_variable:
gui, submit, nohide
return

guiclose:
ExitApp
return