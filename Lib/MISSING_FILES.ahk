#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



MISSING_FILES()

{
FileDelete, C:\Users\tony\Documents\esp_compare.txt
FileDelete, C:\Users\tony\Documents\abutment_esp.txt
FileDelete, C:\Users\tony\Documents\prg_compare.txt
FileDelete, C:\Users\tony\Documents\abutment_nc.txt
FileDelete, C:\Users\Tony\Desktop\unique_numbers.txt

;; FOR 작업저장 FOLDER=====================================================

Loop, C:\Users\Tony\Desktop\작업\작업저장\*.esp
	{
		FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\esp_compare.txt
		Loop, %A_LoopFileName%\*.*
			{
				FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\esp_compare.txt
			}
	}

FileRead, esplist, C:\Users\tony\Documents\esp_compare.txt

Loop, parse, esplist, `n, ;; `n parse by line or you can `, <- meaning parse by comma..
{
	prgloop = %A_LoopField%
	prgloop2 := SubStr(prgloop, StrLen(prgloop)-9,4)

;; replace all 'esp' with 'stl'.. simple
	;StringTrimRight, editstring, testloop, 5
FileAppend, %prgloop2%`n, C:\Users\tony\Documents\abutment_esp.txt
}

;;; for NC FOLDER =====================================================

Loop, C:\Users\Tony\Documents\DP Technology\ESPRIT\Data\NC_Files\*.prg
	{
		FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\prg_compare.txt
		Loop, %A_LoopFileName%\*.*
			{
				FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\prg_compare.txt
			}
	}

FileRead, prglist, C:\Users\tony\Documents\prg_compare.txt

Loop, parse, prglist, `n, ;; `n parse by line or you can `, <- meaning parse by comma..
{
	prgloop = %A_LoopField%
	prgloop2 := SubStr(prgloop, 1, StrLen(prgloop) - 5)

;; replace all 'esp' with 'stl'.. simple
	;StringTrimRight, editstring, testloop, 5
FileAppend, %prgloop2%`n, C:\Users\tony\Documents\abutment_nc.txt
}

sleep, 1000
;; =========================== comare the two files

; Read the contents of the first text file
FileRead, file1, C:\Users\tony\Documents\abutment_esp.txt

; Read the contents of the second text file
FileRead, file2, C:\Users\tony\Documents\abutment_nc.txt


; Split the contents of each file by line
Loop, Parse, file1, `n
{
    ; Remove any leading or trailing spaces
    file1_line := Trim(A_LoopField)

    ; Check if the line is contained in file2
    if !InStr(file2, file1_line)
    {
        ; If the line is not contained in file2, append it to the output string
        unique_numbers .= file1_line . "`n"
    }
}

; Split the contents of file2 by line
Loop, Parse, file2, `n
{
    ; Remove any leading or trailing spaces
    file2_line := Trim(A_LoopField)

    ; Check if the line is contained in file1
    if !InStr(file1, file2_line)
    {
        ; If the line is not contained in file1, append it to the output string
        unique_numbers .= file2_line . "`n"
    }
}

; Write the output string to a file

FileAppend, `n`n%unique_numbers%, C:\Users\Tony\Desktop\unique_numbers.txt

reload



}