#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force
#include C:\Users\tony\Documents\AutoHotkey\class\class.ahk



gui, +alwaysontop
gui, show, w150 h58 x1000 y90,      =]
;gui, add, text, x100 y10, yes


;================== WIRE FRAME VIEW ===============
XButton2::

sendinput, !a
return

XButton1::
sendinput, !s
return
;=========================================================
x::Pause
return


;==========================================================================
\::
run, C:\Users\tony\Desktop\SelectSTLFile_R3\SelectSTLFile.exe
winwaitactive, ahk_class #32770
sendinput, {enter}
WinWaitActive, Open
controlfocus, DirectUIHWND2, ahk_class #32770

sendinput, {down}
sendinput, {up}
sleep, 250
sendinput, {enter}


is.rvsearch("abutment2.png", 440, 200, 1630, 1000, 15)
;is.rvsearch("FACE_INSPECT_ICON_1.png", 0, 100, 400, 350, 30)

mousemove, is.x, is.y
;is.rvsearch("close.png", 1774, 17, 1932, 73, 0)
is.rvsearch("close.png", 820, 0, 3440, 150, 0)
mouseclick, left, is.x+20, is.y+20
errorlevel = 1
WinWaitActive, ahk_class #32770
sendinput, {enter}
sleep, 2000


;;;;;;;;============ AFTER FIRST FILE ================


var11 := 1


loop
{
run, C:\Users\tony\Desktop\SelectSTLFile_R3\SelectSTLFile.exe
winwaitactive, ahk_class #32770
sendinput, {enter}
WinWaitActive, Open
controlfocus, DirectUIHWND2, ahk_class #32770



sendinput, {down %var11%}
sendinput, {enter}
SLEEP, 2200


WinActivate, ESPRIT
is.rvsearchseq("abutment2.png", 440, 200, 1630, 1000, 15)
;is.rvsearch("FACE_INSPECT_ICON_1.png", 0, 100, 400, 350, 30)
mousemove, is.x, is.y


is.rvsearch("abutment3.png", 17, 138, 300, 400, 15)
mousemove, is.x, is.y
;sleep, 1000

sendinput, ^s
sleep, 500

is.rvsearch("close.png", 820, 0, 3440, 150, 0)
mouseclick, left, is.x+20, is.y+20
errorlevel = 1
;WinWaitActive, ahk_class #32770
;sendinput, {enter}
sleep, 100



if var11 = 49
{
break
}

var11++
}
return


;===========================================================================

guiclose:
ExitApp
return
