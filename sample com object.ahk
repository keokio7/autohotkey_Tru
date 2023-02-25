#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force
#include C:\Users\tony\Documents\AutoHotkey\class\class.ahk

pause::pause


^i::
TRY XL := ComObjCreate("ESPRIT.APPLICATION")
XL.VISIBLE := TRUE
return

^k::
TRY TL := ComObjCreate("ESPRIT.LAYERS")
TL.ADD
return

^j::
XL.NEW
return
/*
TRY XL := ComObjCreate("ESPRIT.APPLICATION")
XL.VISIBLE := TRUE
;XL.NEW

Value := ComObjValue(XL)
MsgBox % Value

/*
TRY XL2 := ComObjCreate("ESPRIT.APPLICATION")
XL2.VISIBLE := TRUE


/*

controlget, hwnd, hwnd,,,ahk_class Afx:00400000:8:00010007:00000000:00540213
XL := Acc_objectfromwindow(hwnd)
msgbox % ISOBJECT(XL)
XL.APPLICATION.NEW
/*


TRY XL := ComObjCreate("ESPRIT.APPLICATION")
XL.VISIBLE := TRUE

pause
XL.NEW
;~ msgbox % isobject(XL)
/*
try XL := ComObjActive("ESPRIT.APPLICATION")
msgbox % isobject(XL)

/*
TRY XL := ComObjCreate("ESPRIT.APPLICATION")
XL.VISIBLE := TRUE
XL.NEW
msgbox % isobject(XL)


/*

try XL := ComObjActive("ESPRIT.APPLICATION")
msgbox % isobject(XL)
acc_objc

*/

