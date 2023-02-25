#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force




gui, +alwaysontop
gui, show, w150 h58 x1000 y90,      =]

x::Pause
return



\::

foldernumber := 1

loop
	{
;; create folder 1-%% done
FileCreateDir, C:\Users\tony\Documents\STL PRE-LOADED\1-%foldernumber% done (20)


;; delete all temp txt files
FileDelete, C:\Users\tony\Documents\AutoHotkey\stllist.txt
FileDelete, C:\Users\tony\Documents\AutoHotkey\ESPLIST.txt
FileDelete, C:\Users\tony\Documents\AutoHotkey\prg.txt

;; get active window folder path saved as stlsource var
winactivate, ahk_class CabinetWClass
sendinput, ^l
sleep, 200
ControlGetText, stlsource, Edit1, ahk_class CabinetWClass


;;; get list of stl files for 1-%% folder output to stlilist.txt
Loop, %stlsource%\*.stl
	{
		FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\AutoHotkey\stllist.txt
		Loop, %A_LoopFileName%\*.*
			{
				FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\AutoHotkey\stllist.txt
			}
	}

;; read STLLIST TXT FILE
FileRead, ahha, C:\Users\tony\Documents\AutoHotkey\stllist.txt


;; LOOP PARSE STLLIST FILE AND CHANGE .STL TO .ESP  ** NOT REALLY NECESSARY FOR NEXT STEP JUST HERE TO KNOW
;; OUTPUT TO ESPLIST.TXT
Loop, parse, ahha, `n, ;; `n parse by line or you can `, <- meaning parse by comma..
{
    testloop = %A_LoopField%
	StringReplace, editstring, testloop, stl, esp, 1 ;; replace all 'esp' with 'stl'.. simple
	;StringTrimRight, editstring, testloop, 5
FileAppend, %editstring%`n, C:\Users\tony\Documents\AutoHotkey\ESPLIST.txt
}


;; LOOP PARSE STLLIST FILE AND JUST GET 4 DIGIT
Loop, parse, ahha, `n, ;; `n parse by line or you can `, <- meaning parse by comma..
{
	prgloop = %A_LoopField%
	prgloop2 := SubStr(prgloop, StrLen(prgloop)-9,4)

;; replace all 'esp' with 'stl'.. simple
	;StringTrimRight, editstring, testloop, 5
FileAppend, %prgloop2%`n, C:\Users\tony\Documents\AutoHotkey\prg.txt
}



;; FILE COPY TO 1-%% FROM LIST OF ESP
Loop, Read, C:\Users\tony\Documents\AutoHotkey\ESPLIST.txt
     FileCopy, C:\Users\tony\Documents\OUTPUT FILES\%A_LoopReadline%.*, C:\Users\tony\Documents\STL PRE-LOADED\1-%foldernumber% done (20) ; You can replace * with a file extension e.g. jpg , otherwise it will just copy the matched file regardless of the extension


;; FILE COPY TO 1-%% FROM LIST OF PRG
Loop, Read, C:\Users\tony\Documents\AutoHotkey\PRG.txt
     FileCopy, C:\Users\tony\Documents\OUTPUT FILES\%A_LoopReadline%.*, C:\Users\tony\Documents\STL PRE-LOADED\1-%foldernumber% done (20) ; You can replace * with a file extension e.g. jpg , otherwise it will just copy the matched file regardless of the extension



foldernumber++
pause

}




;===========================================================================

guiclose:
ExitApp
return
