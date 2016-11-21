Imports System
Imports Microsoft
Imports System.Web


Imports System.Data
Imports System.Configuration
Imports System.Collections

Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Net
Imports System.Windows.Forms
Imports System.Data.SqlClient

Partial Class EntrarProfesional
    Inherits System.Web.UI.Page
    Dim Funciones As New Funciones
    Dim Ds_Usuarios As New Data.DataSet
    Dim Filas As Data.DataRow
    Dim pass As String = GenerarCadena(7)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Try
            Funciones.agregar_tabla_dataset("SELECT Personas.mail, Personas.nroDocumento FROM Usuarios INNER JOIN Personas ON Usuarios.nrodocumento = Personas.nroDocumento WHERE  (Usuarios.usuario = '" & txtUsuario.Text & "')", "Usuarios", Ds_Usuarios)
            If Ds_Usuarios.Tables("Usuarios").Rows(0).Item(0).ToString = txtMail.Text Then
                Funciones.Ejecutarconsulta2("UPDATE Usuarios set password = '" & pass & "'  where usuario='" & txtUsuario.Text & "'")
                EnviarCorreo()
                lblMensaje.Text = "SU NUEVA PASSWORD FUE ENVIADA A SU CORREO ELECTRONICO"
                lblMensaje.Visible = True
            Else
                lblMensaje.Text = "El E-mail Ingresado no es correcto relacionado con el usuario"
                lblMensaje.Visible = True
            End If
        Catch ex As Exception
            lblMensaje.Text = "Compruebe que este ingresando un usuario valido"
            lblMensaje.Visible = True
        End Try
    End Sub
    Protected Sub EnviarCorreo()
        Dim ValorRetorno As Int32
        Dim Origen As String
        Dim destino As String
        Dim Asunto As String
        Dim mensaje As String
        Dim Objeto As New Funciones()
        Origen = "SiDOP@tigre.gov.ar"
        destino = txtMail.Text
        Asunto = "Recuperación de Password - Sistema Plano Digital"
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>Se blanqueo su password de acceso como profesional al SiDOP, SU NUEVO PASSWORD ES: " & pass & ". <p> Una vez dentro del sistema debe cambiarla.</p> <div /> <p>Respuesta automática - No responda este E-Mail.</p> <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>"
        ValorRetorno = Objeto.EnviarMail(Origen, destino, mensaje, Asunto)
    End Sub
    Public Function Generar_Psw(ByVal Lenght As Integer, Optional ByVal Reset As Boolean = True) As String
        Dim rNum As New Random(100)
        Dim rLowerCase As New Random(500)
        Dim rUpperCase As New Random(50)
        Dim psw As String
        Dim RandomSelect As New Random(50)
        Dim i As Integer
        Dim CNT(2) As Integer
        Dim Char_Sel(2) As String
        Dim iSel As Integer
        If Reset = True Then
            psw = ""
        End If
        For i = 1 To Lenght
            CNT(0) = rNum.Next(48, 57)
            CNT(1) = rLowerCase.Next(65, 90)
            CNT(2) = rUpperCase.Next(97, 122)
            Char_Sel(0) = System.Convert.ToChar(CNT(0)).ToString
            Char_Sel(1) = System.Convert.ToChar(CNT(1)).ToString
            Char_Sel(2) = System.Convert.ToChar(CNT(2)).ToString
            iSel = RandomSelect.Next(0, 3)
            psw &= Char_Sel(iSel)
            If Reset = True Then
                psw.Replace(psw, Char_Sel(iSel))
            End If
        Next
        Return psw
    End Function
    Private Function GenerarCadena(ByVal numeroCaracteres As Integer) As String
        Dim letras(51) As String
        Dim n As Integer
        For item As Int32 = 65 To 90
            letras(n) = Chr(item)
            letras(n + 1) = letras(n).ToLower
            n += 2
        Next
        Dim cadenaAleatoria As String = String.Empty
        Dim rnd As New Random(DateTime.Now.Millisecond)
        For n = 0 To numeroCaracteres
            Dim numero As Integer = rnd.Next(0, 51)
            cadenaAleatoria &= letras(numero)
        Next
        Return cadenaAleatoria
    End Function
End Class
