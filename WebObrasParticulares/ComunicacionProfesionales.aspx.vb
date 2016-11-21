Imports System
Imports Microsoft
Imports System.IO
Imports System.Windows
Imports System.Windows.Forms
Imports System.Data.SqlClient
Imports System.data


Partial Class ComunicacionProfesionales
    Inherits System.Web.UI.Page
    Dim Funciones As New Funciones
    Dim Ds_Usuarios As New Data.DataSet
    Dim Filas As Data.DataRow
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'lblOrigen.Text = Session("NroDocumentoProfesional")
        lblOrigen.Text = "obrasparticularesdigital@tigre.gov.ar"

    End Sub

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim destino As String = ""
        Dim ds_mail As New DataSet
        Funciones.agregar_tabla_dataset("SELECT mail, tipo FROM Personas WHERE tipo=0", "mail", ds_mail)
        For Each drow As DataRow In ds_mail.Tables(0).Rows
            Try
                enviarCorreo(drow.Item(0).ToString())
                lblCartel.Text = "El mensaje fue enviado con exito"
            Catch ex As Exception
                lblCartel.Text = "El mensaje no fue enviado a todos los destinatarios."
            End Try
        Next
        lblCartel.Visible = True
    End Sub
    Protected Sub GuardarBD(ByVal destino As String)
        Dim objeto As Funciones = New Funciones
        Dim comando As SqlCommand = New SqlCommand
    End Sub
    Protected Sub enviarCorreo(ByVal destino As String)
        Dim ValorRetorno As Integer
        Dim Origen As String
        Dim Asunto As String
        Dim mensaje As String
        Dim mensajeInicio As String
        Dim mensajeFin As String
        Dim Objeto As Funciones = New Funciones
        Origen = lblOrigen.Text
        Asunto = txtAsunto.Text
        mensajeInicio = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br> <p> Enviado desde <b> " & Origen & " </b>. </p><p>"
        mensajeFin = "</p><p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>"
        mensaje = mensajeInicio & txtMensaje.Text & mensajeFin
        ValorRetorno = Objeto.EnviarMail(Origen, destino, mensaje, Asunto)
    End Sub

    Protected Sub imbVolver_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbVolver.Click
        Dim origen As String = Request.QueryString("origen")
        Select Case origen
            Case "1"
                Response.Redirect("./Principal.aspx")
            Case "2"
                Response.Redirect("./ResponsableOP.aspx")
            Case "3"
                Response.Redirect("./DirectorOP.aspx")
            Case "4"
                Response.Redirect("./ResponsableMunicipio.aspx")
        End Select
    End Sub
End Class
