#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force
#include %A_ScriptDir%\class\class.ahk

x::Pause
return


f::

;CLICK ON 4 PLUSES
loop, 4{
is.vsearch("vb_plus.png", 0, 0, 200, 550, 1)
if (Errorlevel = 0){
mouseclick, left, is.x+1, is.y+1, 1, 0 ;; two last variables is click count / speed
}
sleep, 200
}

;CLICK ON ASTEP1 TAG
sleep, 100
is.rvsearch("vb_aStep1.png", 0, 0, 200, 700, 10)
mouseclick, left, is.x+15, is.y+7, 2, 0 ;; two last variables is click count / speed
sleep, 100
ControlFocus, combobox2, ahk_class wndclass_desked_gsk  ;;; CONTROL CHOOSE FROM SELECT MENU TO STEP1_2
control, chooseSTRING, Step1_2, ComboBox2, ahk_class wndclass_desked_gsk

pause
;; ============ change strtolerance === IF THE IMAGE IS FOUND
is.vsearch("vb_str.png", 0, 0, 1100, 500, 10)
if (Errorlevel = 0){
mouseclick, left, is.x+17, is.y+25, 1, 0 ;; two last variables is click count / speed
sendinput, {del}
sendinput, {down}'
mouseclick, left, 1000, 500
Pause
}


;; CONTROL CHOOSE EDITBBOUNDARY
ControlFocus, combobox2, ahk_class wndclass_desked_gsk
control, chooseSTRING, GetTurningProfile_EditBoundary, ComboBox2, ahk_class wndclass_desked_gsk
sleep, 100

loop, 56{
sendinput, {down}
}

loop, 34{
sendinput, {right}
}
sleep, 100
sendinput, .25  ;;; INPUT .25 SO YOU GET 1.25

sendinput, ^s
return