﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force



front_setting_SHORT()
{
;;;==========   HIGHLIGHT / MARGIN RED LINE / SWITCH ARRROW / SENDINPUT FRONT TURNING ============
;~ select_wire()

sendinput, {esc}
DEG.DEG0()
is.vsearch("blue_line.png", 550, 400, 1600, 1300, 10)
mousemove, is.x+15, is.y+8
send, +{click 2}


;MouseGetPos, FX, FY
ICON.TOOL("ICON_MARGIN_RED.PNG")
SLEEP, 200

;; ================  SELECT BLUEBACKGROUND TO DESELECT WIRE HIGHLIGHTS =======================

is.vsearch("blue_background.png", 490, 200, 1250, 900, 10)
mouseclick, left, is.x+2, is.y+2, 2, 0 ;; two last variables is click count / speed
sendINPUT, {click}



;; =================== SELECT BLUE WIRE ================================

list_search.layer("피처", "combobox4", "ESPRIT")
SENDINPUT, ^a
sleep, 100
list_search.layer("모두", "combobox4", "ESPRIT")
SLEEP, 50



;; ====================== SWITCH ARROW =================================
ICON.TOOL("ICON_SWITCH_ARROW.PNG")
SENDINPUT, ^1 ;; FRONT TURNING
SLEEP, 50



;================  REAL TIME SEARCH FOR HELP BUTTON =====================

ImageSearch, x, y, 0, 0, 800, 600, C:\Users\tony\Documents\AutoHotkey\images\help_button.png
while(ErrorLevel=1)
{
ImageSearch, x, y, 0, 0, 800, 600, C:\Users\tony\Documents\AutoHotkey\images\help_button.png
sleep, 100
}
;; === SEARCHING FOR FFRONT TURNING SETTING ICON ===================
ImageSearch, frontx3, fronty3,  0, 0, 600, 400, *10 C:\Users\tony\Documents\AutoHotkey\images\FRONT_TURNING_SETTING.png
if (errorlevel = 0)
{
is.vsearch("text_box_ok2.png", 0, 0, 250, 300, 10)
MOUSECLICK, LEFT, IS.X+3, IS.Y+3
}

SENDINPUT, !a
sleep, 300


;;===========================  RESET TO DEG 0 ======================

DEG.DEG0()









}