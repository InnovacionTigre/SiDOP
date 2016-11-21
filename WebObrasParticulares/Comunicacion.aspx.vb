Imports System
Imports Microsoft
Imports System.IO
Imports System.Windows
Imports System.Windows.Forms
Imports System.Data.SqlClient
Imports System.data


Partial Class Comunicacion
    Inherits System.Web.UI.Page
    Dim Funciones As New Funciones
    Dim Ds_Usuarios As New Data.DataSet
    Dim Filas As Data.DataRow
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblNroCuenta.Text = Session("cuenta")
        If (Session("Permiso") = "profesional") Then
            lblOrigen.Text = obtener_correo(Session("NroDocumentoProfesional"))
        ElseIf (Session("Permiso") = "Municipio") Then
            lblOrigen.Text = obtener_correo_Municipio_designado(lblNroCuenta.Text)
            lblOrigen.Enabled = True
        Else
            lblOrigen.Enabled = True
        End If
    End Sub

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim destino As String = ""
        Select Case ddlDestino.Text
            Case "Obras Particulares"
                destino = "ObrasParticularesDigital@tigre.gov.ar"
            Case "Tasas"
                destino = "TasasDigital@tigre.gov.ar"
            Case "Catastro"
                destino = "CatastroDigital@tigre.gov.ar"
            Case "Director de Obras Particulares"
                destino = "pibaniez@tigre.gov.ar"
            Case "Inspeccion de Obras Particulares"
                destino = "InspeccionDigital@tigre.gov.ar"
            Case "Profesional"
                destino = lblDestino.Text
            Case "Propietario"
                destino = lblDestino.Text
            Case "Comision"
                destino = ""
            Case "Visador"
                destino = lblDestino.Text
            Case "Arbolado Urbano"
                destino = "arboladopublicodeobra@tigre.gov.ar"
        End Select
        Try
            enviarCorreo(destino)
            GuardarBD(destino)
            lblCartel.Text = "El mensaje fue enviado con exito"
        Catch ex As Exception
            lblCartel.Text = "No se logro enviar el mensaje"
        End Try
        lblCartel.Visible = True

    End Sub
    Protected Sub GuardarBD(ByVal destino As String)
        Dim objeto As Funciones = New Funciones
        Dim comando As SqlCommand = New SqlCommand
        objeto.Ejecutarconsulta2("INSERT INTO HistorialCorreo VALUES ('" & lblNroCuenta.Text & "','" & lblOrigen.Text & "','" & destino & "','" & txtAsunto.Text & "','" & txtMensaje.Text & "', getdate())")
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
        mensajeInicio = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br> <p> Enviado desde <b> " & Origen & " </b>correspondiente a la cuenta municipal nro <b>" & lblNroCuenta.Text & "</b>. </p><p>"
        mensajeFin = "</p><p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>"
        mensaje = mensajeInicio & txtMensaje.Text & mensajeFin
        ValorRetorno = Objeto.EnviarMail(Origen, destino, mensaje, Asunto)
    End Sub
    Public Function obtener_correo(ByVal origen As String) As String
        Dim objeto As New Funciones
        Dim ds As New DataSet
        objeto.agregar_tabla_dataset("Select mail from personas where nroDocumento='" & origen & "'", "Personas", ds)
        Return ds.Tables(0).Rows(0).Item(0).ToString
    End Function
    Public Function obtener_correo_cuenta(ByVal origen As String) As String
        Dim objeto As New Funciones
        Dim ds As New DataSet
        objeto.agregar_tabla_dataset("SELECT Personas.mail FROM Personas INNER JOIN ProfesionalXcuenta ON Personas.nroDocumento = ProfesionalXcuenta.nroDocumentoProfesional WHERE ProfesionalXcuenta.nroCuenta ='" & origen & "'", "Personas", ds)
        Return ds.Tables(0).Rows(0).Item(0).ToString
    End Function

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

    Protected Sub ddlDestino_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDestino.SelectedIndexChanged
        Select Case ddlDestino.Text
            Case "Obras Particulares"
                lblDestino.Text = "ObrasParticularesDigital@tigre.gov.ar"
            Case "Tasas"
                lblDestino.Text = "TasasDigital@tigre.gov.ar"
            Case "Catastro"
                lblDestino.Text = "CatastroDigital@tigre.gov.ar"
            Case "Director de Obras Particulares"
                lblDestino.Text = ""
            Case "Inspeccion de Obras Particulares"
                lblDestino.Text = "InspeccionDigital@tigre.gov.ar"
            Case "Profesional"
                lblDestino.Enabled = True
                lblDestino.Text = obtener_correo_cuenta(lblNroCuenta.Text)
            Case "Propietario"
                lblDestino.Text = obtener_correo_Propietario(lblNroCuenta.Text)
                lblDestino.Enabled = True
            Case "Comision"
                lblDestino.Text = "ComisionDigital@tigre.gov.ar"
            Case "Visador"
                lblDestino.Text = obtener_correo_Municipio_designado(lblNroCuenta.Text)
            Case "Arbolado Urbano"
                lblDestino.Text = "arboladopublicodeobra@tigre.gov.ar"
        End Select
    End Sub
    Public Function obtener_correo_Municipio_designado(ByVal cuenta As String) As String
        Dim objeto As New Funciones
        Dim ds As New DataSet
        Dim dt As New DataTable
        objeto.agregar_tabla_dataset("SELECT Personas.mail FROM Personas INNER JOIN MunicipalXcuenta ON Personas.nroDocumento = MunicipalXcuenta.nroDocumentoMunicipio WHERE MunicipalXcuenta.nroCuenta = '" + cuenta + "'", "Personas", ds)
        dt = ds.Tables(0)
        Return dt.Rows(0)("mail").ToString()
    End Function
    Public Function obtener_correo_Propietario(ByVal cuenta As String) As String
        Dim objeto As New Funciones
        Dim ds As New DataSet
        Dim dt As New DataTable
        objeto.agregar_tabla_dataset("SELECT PropietarioxCuenta.mail FROM PropietarioxCuenta WHERE PropietarioxCuenta.nroCuenta = '" + cuenta + "'", "PropietarioxCuenta", ds)
        dt = ds.Tables(0)
        Return dt.Rows(0)("mail").ToString()
    End Function

End Class
