#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force




select_back_four_reset()

{
LAYER_REDBOX()

winactivate, ESPRIT
is.vsearch("blue_background.png", 440, 200, 1630, 1000, 10)
mouseclick, left, is.x, is.y
DEG.REAR()
;sendinput, {ctrl UP}
IS.rVSEARCH("0_DEG_1_CROSS.PNG", 28, 550, 350, 1000, 0)
mousemove, IS.X+10 , IS.Y + 5
sendinput, ^{lbutton}
sleep, 50

mousemove, IS.X+10 , IS.Y + 60
sendinput, ^{lbutton}
sleep, 50

mousemove, IS.X+10 , IS.Y + 115
sendinput, ^{lbutton}
sleep, 50

mousemove, IS.X+10 , IS.Y + 170
sendinput, ^{lbutton}
sleep, 50


click, right
IS.rVSEARCH("REBUILD_ICON_1.png", 0, 160, 800, 1440, 50)
mousemove, IS.X+10 , IS.Y + 5
SLEEP,1000
IS.VSEARCH("unlock.png", 0, 160, 800, 1440, 50)
mouseclick, left, IS.X+10 , IS.Y + 5

return
}