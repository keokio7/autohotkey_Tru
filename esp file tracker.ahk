#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force


^c::
Reload
return


^i::


wingetclass, deg_class, A
loop, 3{
sendinput, {tab}
sleep, 100
controlfocus, SysListView321, ahk_class %deg_class%
sleep, 100
sendinput, {down}
sleep, 100


ControlGetText, filename, Edit1, ahk_class %deg_class% ;;get filename
filename := SubStr(filename, 1, StrLen(filename) - 1) ;; remove last DIGIT TO FILENAME VAR
filenumber := Last4Digits := SubStr(filename, StrLen(filename) - 3, 4) ;; GET THE LAST 4 DIGITS OF FILENAME, THEN STORE TO FILENUMBER
sleep, 200

}



return

;; === %FILENUMBER% VAR IS NOW THE CURRENT ABUTMENT NUMBER



/*
sendinput, {right}
	control, chooseSTRING, 작업, ComboBox1, ahk_class %deg_class%
	sleep, 100
	sendinput, {enter}
	sleep,100
	control, chooseSTRING, 작업저장, ComboBox1, ahk_class %deg_class%
		sleep, 100
	sendinput, {enter}

	return