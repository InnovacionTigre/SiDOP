Imports System
Imports Microsoft
Imports System.Web

Partial Class EntrarProfesional
    Inherits System.Web.UI.Page
    Dim Funciones As New Funciones
    Dim Ds_Usuarios As New Data.DataSet
    Dim Filas As Data.DataRow
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub
    Protected Sub Iniciar_Sesion()
        Session("usuario") = Filas(0).ToString().ToLower()
        Session("Permiso") = Filas(4).ToString
        Session("NroDocumentoProfesional") = Filas(2).ToString
        Session("tipo") = "0"
        Session.Timeout = 10
        cargarcookie()
        Response.Redirect("./Principal.aspx")
    End Sub

    Protected Sub cargarcookie()
        Dim Cookieleo As New HttpCookie("TestCookieLeo")
        Cookieleo.Value = Filas(2).ToString
        Response.Cookies.Add(Cookieleo)
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Funciones.agregar_tabla_dataset("Select * from Usuarios", "Usuarios", Ds_Usuarios)
        For Each Filas In Ds_Usuarios.Tables("Usuarios").Rows
            If txtUsuario.Text.ToLower() = Filas(0).ToString().ToLower() And txtPassword.Text = Filas(3) And Filas(5) = True Then
                Iniciar_Sesion()
            Else
                lblMensaje.Text = "Los datos de ingreso son incorrectos"
                lblMensaje.Visible = True
            End If
        Next
    End Sub
    Protected Sub imgBAyuda_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBAyuda.Click
        Response.Redirect("./olvidoPassword.aspx")
    End Sub
End Class
