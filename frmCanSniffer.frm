'Developed by Martin Viljoen
'Visualbasic 6

Dim ComSettings As String
Dim DataIn As String
Dim NewString As String
Dim StrFileData As String

Dim IncommingData As String
Dim StartFound As Boolean
Dim EndFound As Boolean
Dim CharCount As Long
Dim StartMid As Long
Dim LenMid As Long
Dim MidLenCount As Long
Dim CanMessage As String

Dim FileLoaded As Boolean
Dim StringFound As Double

Private Sub cmdClear_Click()
txtMon = ""
End Sub

Private Sub cmdCompare_Click()
Call ReadMessages
End Sub

Private Sub cmdSetPath_Click()

Open txtPath For Input As #1
StrFileData = Input$(LOF(1), 1)
Close #1

FileLoaded = True


Exit Sub
errHandler:
MsgBox Error
End Sub

Private Sub Command1_Click()
If FileLoaded = True Then

'MSComm1.PortOpen = False
MSComm1.CommPort = 5
ComSettings = Text3 & ",N,8,1"
MSComm1.Settings = ComSettings

If MSComm1.PortOpen = False Then
    MSComm1.PortOpen = True
Else
    MsgBox "Port already Popen", vbCritical, "Port Open"
End If


Timer1.Enabled = True

Else
MsgBox "No File was Loaded, Please load file before sniffing"
End If
End Sub


Private Sub Command2_Click()
Open txtComparePath For Input As #1
IncommingData = Input$(LOF(1), 1)
Close #1
End Sub

Private Sub Command3_Click()
If Command3.Caption = "Stop" Then
    Timer1.Enabled = False
    Command3.Caption = "Continue"
Else
    Command3.Caption = "Stop"
    Timer1.Enabled = True
End If

End Sub



Private Sub Form_Load()
txtPath = App.Path & "\ignoredatabase.can"
txtComparePath = App.Path & "\incomming.can"
End Sub

Private Sub Form_Resize()
On Error Resume Next
txtMon.Height = Me.Height - txtMon.Top - 800
txtMon.Width = Me.Width - 500
End Sub



Sub ReadMessages()

MidLenCount = 0
'MsgBox IncommingData
For CharCount = 1 To Len(IncommingData)
DoEvents
    If Mid(IncommingData, CharCount, 1) = "<" Then
        StartFound = True
        StartMid = CharCount + 1
        MidLenCount = 0
    End If
    
    If StartFound = True Then
        MidLenCount = MidLenCount + 1
        If Mid(IncommingData, CharCount, 1) = ">" Then
        StartFound = False
        CanMessage = Mid(IncommingData, StartMid, MidLenCount - 2)
        
        'Check If Message is in the Ignore Dastabase
        If InStr(1, StrFileData, CanMessage) <> "0" Then
            'MsgBox "Match Found @:" & InStr(1, StrFileData, CanMessage)
        Else
            If InStr(1, txtMon, CanMessage) = "0" Then
                txtMon = txtMon & CanMessage & vbCrLf
            End If
        End If

        MidLenCount = 0
        End If
    End If
    
    
Next CharCount
End Sub

Private Sub Timer1_Timer()
On Error Resume Next
IncommingData = MSComm1.Input

    
    If IncommingData <> "" Then
        'MsgBox DataIn
        'Text1 = Text1 & IncommingData
        
        'NewString = Replace(IncommingData, ",", "")
        'MsgBox IncommingData
        Call ReadMessages

    End If
    
    
    '131,123,94,124,22,143,21,162,66,
End Sub
