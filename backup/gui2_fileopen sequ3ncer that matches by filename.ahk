#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force


line_number := 0


;gui, 1:color, 34b4eb
gui, 1:color, FFA500
gui, 1:+alwaysontop
gui, 1:show, w300 h80 x2550 y40,      =]
gui, 1:add, button, x50 y2 w200 h60 GMYBUTTON, TEST!
Gui Show

return




; Define function to be triggered by hotkey
MyButton:
    line_number := file_open_sequence2(LINE_NUMBER)  ;;NEW LINE NUMBER

FileDelete, C:\Users\tony\Documents\autohotkey\esp_list_open.txt
FileDelete, C:\Users\tony\Documents\autohotkey\esp_list_open_PARSED.txt

;; CREATE ESP_LIST_OPEN.TXT
Loop, C:\Users\Tony\Desktop\작업\작업저장\*.esp
	{
		FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\autohotkey\esp_list_open.txt
		Loop, %A_LoopFileName%\*.*
			{
				FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\autohotkey\esp_list_open.txt
			}
	}

;; ========== THIS SECTION PARSES THE CREATED LIST ESPLIST OPEN AND TAKES OUT .ESP OUT OF FILENAME

FileRead, prglist, C:\Users\tony\Documents\autohotkey\esp_list_open.txt ;;  READ CONTENTS OF THIS FILE

Loop, parse, prglist, `n, ;; `n parse by line or you can `, <- meaning parse by comma..
{
	prgloop = %A_LoopField%
	prgloop2 := SubStr(prgloop, 1, StrLen(prgloop) - 5)

;; replace all 'esp' with 'stl'.. simple
	;StringTrimRight, editstring, testloop, 5
FileAppend, %prgloop2%`n, C:\Users\tony\Documents\autohotkey\esp_list_open_PARSED.txt
}

;; ================ THIS TAKES THE NTH LINE NUMBER AND STORES IT TO VRIABLE FILENAME_LIST
FileReadLine, FILENAME_LIST, C:\Users\tony\Documents\autohotkey\esp_list_open_PARSED.txt, %line_number% ; Read the first line of myfile.txt










WINACTIVATE, 열기
;; ========== WINACTIVATE, THEN SELECT THE FILE FROM THE OPENBOX
IF (LINE_NUMBER = 1){
	WINACTIVATE, 열기
wingetclass, deg_class, A
sendinput, {tab}
sleep, 100
controlfocus, SysListView321, ahk_class %deg_class%
sleep, 100
SENDINPUT, {DOWN}{UP}{ENTER}
sleep, 100
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

		LOOP{

		ControlGetText, filename_BOX, Edit1, ahk_class %deg_class% ;;get filename

		   if (FILENAME_BOX = FILENAME_LIST)
		   {
			 SENDINPUT, {ENTER}
			  break
		   }
		   ELSE{
		   SENDINPUT, {DOWN}
		   SLEEP, 50
		   }
		}

}





return












/*
; Bind hotkey to the 'g' key
$G::::
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