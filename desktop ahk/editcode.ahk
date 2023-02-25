; Accessible Info Viewer
; http://www.autohotkey.com/board/topic/77888-accessible-info-viewer-alpha-release-2012-09-20/
; https://dl.dropbox.com/u/47573473/Accessible%20Info%20Viewer/AccViewer%20Source.ahk

#SingleInstance force
#include C:\Users\tony\Documents\AutoHotkey\class\class.ahk



f12::Pause
return


F1::

send, Call ClickBtn1_2
return
F2::

Send,
(
Public Sub ClickBtn1_2()

Load frmSTLRotate
frmSTLRotate.Hide
Unload frmSTLRotate


If MsgBox("[2] Generate toolpaths for [FRONT TURNING]. Please make sure the STL properly located.", vbYesNo, "CAM Automation") = vbYes Then
Call Step1_2
Call Step2_4
Call Step2_6

Dim ly As Esprit.Layer
For Each ly In Document.Layers
If (ly.Name = "STL" Or ly.Name = "±âº»°ª") Then
ly.Visible = True
End If
Next

Else
Exit Sub
End If

)
return
;; got rid of END Sub at the end because visual basic automatically puts it in, for F2 macro code







f3::
WinActivate, Microsoft Visual Basic
mouseclick, left, 18, 189
sleep, 500
mouseclick, left, 38, 205
sleep, 500
mouseclick, left, 38, 301
sleep, 500
mouseclick, left, 119, 283, 2
sleep, 500
mouseclick, left, 281, 237, 2
sleep, 500
MouseClickDrag, left, 327, 1159, 243, 1077
sleep, 500
send, Call ClickBtn1_2

sleep, 1500
mouseclick, left, 105, 349, 2 ;; click macro
sleep, 500
mouseclick, left, 1075, 94
sleep, 1000
mouseclick, left, 1031, 169
sleep, 1000
MouseClickDrag, left, 341, 716, 225, 144
sleep, 500

Send,
(
Public Sub ClickBtn1_2()

Load frmSTLRotate
frmSTLRotate.Hide
Unload frmSTLRotate


If MsgBox("[2] Generate toolpaths for [FRONT TURNING]. Please make sure the STL properly located.", vbYesNo, "CAM Automation") = vbYes Then
Call Step1_2
Call Step2_4
Call Step2_6

Dim ly As Esprit.Layer
For Each ly In Document.Layers
If (ly.Name = "STL" Or ly.Name = "±âº»°ª") Then
ly.Visible = True
End If
Next

Else
Exit Sub
End If

)

sleep, 1500
mouseclick, left, 86, 67
;MouseClickDrag, left, 329, 1157, 237, 1079