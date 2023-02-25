; Accessible Info Viewer
; http://www.autohotkey.com/board/topic/77888-accessible-info-viewer-alpha-release-2012-09-20/
; https://dl.dropbox.com/u/47573473/Accessible%20Info%20Viewer/AccViewer%20Source.ahk

#SingleInstance, force
#include C:\Users\tony\Documents\AutoHotkey\class\class.ahk



^i::
	SendMessage, 0x0147, 0, 0, ComboBox1, ESPRIT ; Uses CB_GETCURSEL command to retrieve the current selected value in ComboBox1. This outputs to the ErrorLevel.
		current_angle := ErrorLevel<<32>>32 ; Convert UInt to Int to have -1 if there is no item selected.
		current_angle += 1
		msgbox % current_angle
/*
   Colors := "red,green,blue"
Loop, parse, Colors, `,
{
    MsgBox, Color number %A_Index% is %A_LoopField%.
}

/*
FileRead, stll, C:\Users\tony\Documents\AutoHotkey\test2.txt
stll := Trim(stll, "`r`n")
Loop, Parse, stll, `n,
{
;filecopy, C:\Users\tony\Desktop\STL PRE-LOADED\1-1 all esp\%A_LoopField%, C:\Users\tony\Desktop\STL PRE-LOADED\1-1 final
MsgBox, C:\Users\tony\Desktop\STL PRE-LOADED\1-1 all esp\%A_LoopField%
}
*/


/*

;FileAppend, Another line.`n, C:\Users\tony\Documents\AutoHotkey\test.txt

Loop, C:\Users\tony\Desktop\STL PRE-LOADED\1-1 done (20)\*.esp
	{
		FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\AutoHotkey\test.txt
		Loop, %A_LoopFileName%\*.*
			{
				FileAppend, %A_LoopFileName%`n,  C:\Users\tony\Documents\AutoHotkey\test.txt
			}
	}
Exit


/*
Msgbox % list_files(A_WinDir)

list_files(Directory)
{
	files =
	Loop C:\Users\tony\Desktop\STL PRE-LOADED\1-1 done (20)\*.esp
	{
		files = %files%`n%A_LoopFileExt%

	}
	return files
}

/*
MouseClickDrag, left, 329, 1157, 237, 1079


/*

is.vsearch("blue_background.png", 490, 200, 1250, 900, 10)
mouseclick, left, is.x+2, is.y+2, 2, 0 ;; two last variables is click count / speed
sendINPUT, {click}



/*======================== THIS WILL HIGHLIGHT ON LAYER MENU, CAN CHOOSE MULTIPLE LAYERS AS WELL ==============

	CONTROL, CHOOSE, 10, ListBox1, 레이어
			CONTROL, CHOOSE, 11, ListBox1, 레이어
			CONTROL, CHOOSE, 12, ListBox1, 레이어

			*/





/*======================== SAMPLE IMAGE SEARCH =========================================================

is.vsearch("yellow_line2.png", 800, 250, 1660, 1370, 10)
mouseclick, left, is.x+10, is.y+8, 1, 0 ;; two last variables is click count / speed





/*======================== Real time SAMPLE IMAGE SEARCH with transparent black=========================================================

ImageSearch, x1, y1, 480, 196, 1700, 1390, *transblack C:\Users\tony\Documents\AutoHotkey\images\LINE_UP1.png  ;; green line image / or orange box image
		while(ErrorLevel=1)
		{
			ImageSearch, x1, y1, %xl1%, %yl1%, %xl2%, %yl2%, *%v% C:\Users\tony\Documents\AutoHotkey\images\%file% ;; real time searching for green line
			sleep, 100
		}


/* =============================  SELECT / HIGHLIGHT ON MENU LISTBOX THROUGH POSTMESSAGE =================================

PostMessage, 0x0185, 0, -1, ListBox1, 레이어  ;; LB_SETSEL message == SELECTING ITEMS IN MENU, FIRST 0 IS TRUE OR FALSE, HIGHLIGHT OR DE HIGHLIGHT, SECOND -1 IS FOR WHICH ITEM IN MENU STARTING FROM 0.  -1 MEANS SELECT ALL

/*  =========================== ANOTHER FORM OF MOUSECLICK TO REGISTER ON BLUEBACKGROUND ==========================
send, {click}
		*** MOUSECLICK DOES NOT REGISTER ~~~~ mouseclick, left, is.x+2, is.y+2, 2, 0 ;; two last variables is click count / speed


/*===================== hightlight all from combox layer ================

list_search.layer("도형", "combobox4", "ESPRIT")


