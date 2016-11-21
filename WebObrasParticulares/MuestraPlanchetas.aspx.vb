Imports System.Windows.Forms
Imports System
Imports Microsoft
Imports System.IO
Imports System.Windows
Imports System.Net
Partial Class MuestraPlanchetas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim sDibujo As String, strDirectorio As String, sRuta As String
        Dim strLManza As String, iCirc As Integer, sSec As String, iCodi As Integer, IManzana As Long, sLetraManzana As String
        sRuta = "\\10.70.0.0\usuarios\GRAFICOS\CATASTRO\"
        iCirc = GridView1.Rows(0).Cells(2).Text
        sSec = GridView1.Rows(0).Cells(3).Text
        iCodi = GridView1.Rows(0).Cells(4).Text
        Select Case GridView1.Rows(0).Cells(4).Text
            Case 1
                IManzana = GridView1.Rows(0).Cells(5).Text
                sLetraManzana = GridView1.Rows(0).Cells(6).Text
            Case 2
                IManzana = GridView1.Rows(0).Cells(7).Text
                sLetraManzana = GridView1.Rows(0).Cells(8).Text
            Case 3, 5, 6
                IManzana = GridView1.Rows(0).Cells(11).Text
                sLetraManzana = GridView1.Rows(0).Cells(12).Text
            Case 4
                IManzana = GridView1.Rows(0).Cells(9).Text
                sLetraManzana = GridView1.Rows(0).Cells(10).Text
            Case 7
                IManzana = GridView1.Rows(0).Cells(5).Text
                sLetraManzana = GridView1.Rows(0).Cells(9).Text
            Case 8
                IManzana = GridView1.Rows(0).Cells(7).Text
                sLetraManzana = GridView1.Rows(0).Cells(9).Text
        End Select
        Select Case Format(iCirc, "0")
            Case 1
                strDirectorio = "PRIMERA\"
            Case 2
                strDirectorio = "SEGUNDA\"
            Case 3
                strDirectorio = "TERCERA\"
            Case 4
                strDirectorio = "CUARTA\"
        End Select
        strLManza = sLetraManzana
        If iCodi = 7 Or iCodi = 8 Then
            Select Case sLetraManzana
                Case 1
                    strLManza = "A"
                Case 2
                    strLManza = "B"
                Case 3
                    strLManza = "C"
                Case 4
                    strLManza = "E"
                Case 5
                    strLManza = "F"
            End Select

        End If
        strDirectorio = strDirectorio & Format(iCirc, "0") & Trim(sSec) & "\"
        sDibujo = Format(iCirc, "0") & Trim(UCase(sSec)) & Format(iCodi, "0") & Format(IManzana, "0000") ' & Trim(UCase(strLManza))
        Dim RutaFinal As String = sRuta & strDirectorio & sDibujo & ".dwg"
        Response.Redirect("file:" & RutaFinal)
        Label1.Text = RutaFinal
    End Sub
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("file:\\10.70.0.0\usuarios\GRAFICOS\CATASTRO\PRIMERA\1A\1A30001.DWG")
    End Sub
End Class
