#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force


rough_redo_SIMPLE()
{

Process, close, macro2.ahk
layer_redbox()
sleep, 20
;;================================================================
;; MSGBOX CHOOSE DEG
MsgBox, 34, ROUGH MENU, 0 - 120 - 240 ;;;

;;===========================0 DEG =====================================

IfMsgBox, Abort

{
	DEG.deg0()
    List_search.layer("[0DEG]ROUGH", "combobox2", "ESPRIT")
}
;;============================ 120 DEG ====================================


IfMsgBox, Retry

{
	DEG.deg120()
    List_search.layer("[120DEG]ROUGH", "combobox2", "ESPRIT")
}

;;=========================== 240 DEG =====================================

IfMsgBox, Ignore

{
	DEG.deg240()
    List_search.layer("[240DEG]ROUGH", "combobox2", "ESPRIT")
}


winactivate, Check Rough ML & Create Border Solid
mouseclick, left, 42, 60 ;; GET RID OF YELLOW SOLID


WINACTIVATE, ESPRIT ;; REACTVIATE FOR BARE WIRE FRAME
SENDINPUT, !s

;;;========== PAUSE TO HIGHLIGHT ===========
Pause
SENDINPUT, {ESC}
;; ================== SELECT RED MARGIN TOOL =====================
TOOL.RED_MARGIN()

;;============== PAUSE TO CONFIRM ONE ARROW =====================
Pause

;; ============== REVERSE ARROW ========================

TOOL.REVERSE_ARROW()
SLEEP, 20

;; ============ PAUSE TO HIGHLIGHT BLUE MARGIN ================



;; ================= SEND CTRL 2 ============================

;; ROUGH TAB OPEN TO CHANGE FILE NAME
sendinput, ^2

is.Rvsearch("ROUGH_TAB_1.png", 0, 0, 725, 644, 10)
mouseclick, left, is.x+5, is.y+3, 2, 0 ;; two last variables is click count / speed
SLEEP, 100
SENDINPUT, {TAB}

IfMsgBox, Abort

{
	SendInput, 3-1. ROUGH_ENDMILL_0DEG
}
;;============================ 120 DEG ====================================


IfMsgBox, Retry

{
	SendInput, 3-2. ROUGH_ENDMILL_120DEG
}

;;=========================== 240 DEG =====================================

IfMsgBox, Ignore

{
SendInput, 3-3. ROUGH_ENDMILL_240DEG
}
SENDINPUT, {ENTER}
sendinput, !a
SLEEP, 20




;; =======================  REORDER MACRO AND MACRO 3 ===========================
WinActivate, ESPRIT
is.Rvsearch("ICON_REORDER.png", 0, 0, 330, 300, 10)
mouseclick, left, is.x+10, is.y+8, 1, 0 ;; two last variables is click count / speed
WinWaitActive, CAM Automation
sendinput, {enter}

WinWaitActive, Is it ready to NC Code?
sendinput, {TAB}{enter}

is.Rvsearch("MACRO3.png", 0, 0, 330, 300, 10)
mouseclick, left, is.x+10, is.y+8, 1, 0 ;; two last variables is click count / speed


}

