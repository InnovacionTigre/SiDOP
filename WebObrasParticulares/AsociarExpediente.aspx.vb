Imports System
Imports Microsoft
Imports System.IO
Imports System.Windows
Imports System.Windows.Forms
Imports System.Data.SqlClient
Imports System.data


Partial Class AsociarExpediente
    Inherits System.Web.UI.Page
    Dim Funciones As New Funciones
    Dim Ds_Usuarios As New Data.DataSet
    Dim Filas As Data.DataRow
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cargar()
    End Sub

    Protected Sub cargar()
        lblNroCuenta.Text = Session("cuenta")
    End Sub
    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim control As Integer
        control = verificarValores()
        If control = 1 Then
            Try
                GuardarBD()
                Dim estado As String = "1280" 'Activo// Estado inicializado
                Dim observacion As String = Session("usuario")
                Dim fecha As DateTime = DateTime.Now
                Dim objeto As Funciones = New Funciones
                Dim carpeta As String = Session("NroCuenta")
                Dim ip As String = Request.UserHostAddress
                objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')")
                Response.Redirect(Request.RawUrl)
            Catch ex As Exception
                lblError.Text = "El expediente que intento relacionar, estaba previamente relacionado a la cuenta"
                lblError.Visible = True
            End Try

        Else
            lblError.Text = "Debe completar todos los campo obligatorios para poder relacionar un expediente"
            lblError.Visible = True
            txtMatricula.BackColor = Drawing.Color.NavajoWhite
            txtEjercicio.BackColor = Drawing.Color.NavajoWhite
            txtNro.BackColor = Drawing.Color.NavajoWhite
        End If


    End Sub
    Protected Sub GuardarBD()
        Dim objeto As Funciones = New Funciones
        Dim comando As SqlCommand = New SqlCommand
        objeto.ArmarParametrosExpedientesxCuenta(comando, lblNroCuenta.Text, Convert.ToInt32(txtMatricula.Text), Convert.ToInt32(txtEjercicio.Text), Convert.ToInt32(txtNro.Text), txtLetra.Text, Convert.ToInt32(ddlProvincia.SelectedValue), Convert.ToInt32(ddpTipo.SelectedValue), Convert.ToInt32(txtSubNro.Text))
        objeto.EjecutarSp("SPagregarExpedienteACuenta", comando)

    End Sub


    Protected Sub imbVolver_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbVolver.Click
        Dim origen As String = Request.QueryString("origen")
        Select Case origen
            Case "1"
                Response.Redirect("./Principal.aspx")
            Case "2"
                Response.Redirect("./ResponsableOP.aspx")
            Case "3"
                Response.Redirect("./DirectorGeneral.aspx")
            Case "4"
                Response.Redirect("./ResponsableMunicipio.aspx")
        End Select

    End Sub
    Public Function verificarValores() As Integer
        Dim valor As Integer
        If txtMatricula.Text = "" Then
            Return 0
        Else
            valor = 1
        End If
        If txtEjercicio.Text = "" Then
            Return 0
        Else
            valor = 1
        End If
        If txtNro.Text = "" Then
            Return 0
        Else
            valor = 1
        End If
        If txtLetra.Text = "" Then
            txtLetra.Text = "-"
            valor = 1
        Else
            valor = 1
        End If
        If txtSubNro.Text = "" Then
            txtSubNro.Text = 0
            valor = 1
        Else
            valor = 1
        End If
        Return valor
    End Function

End Class
