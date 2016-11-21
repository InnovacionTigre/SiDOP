Imports System
Imports Microsoft
Imports System.Web

Partial Class EntrarMunicipio
    Inherits System.Web.UI.Page
    Dim Funciones As New Funciones
    Dim Ds_Usuarios As New Data.DataSet
    Dim Filas As Data.DataRow
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub
    Protected Sub Iniciar_Sesion()
        Session("usuario") = Filas(0).ToString().ToLower()
        Session("Permiso") = Filas(4).ToString
        Session("NroDocumentoMunicipio") = Filas(2).ToString
        Session.Timeout = 1000
        cargarcookie()
        Session("tipo") = Filas(6).ToString().ToLower()
        If Filas(0).ToString().ToLower() = "11732" Or Filas(0).ToString().ToLower() = "13057" Or Filas(0).ToString().ToLower() = "118734" Or Filas(0).ToString().ToLower() = "7024" Or Filas(0).ToString().ToLower() = "11181" Then
            Response.Redirect("./DirectorGeneral.aspx")
        Else
            If Filas(6).ToString().ToLower() = "1" Then
                Response.Redirect("./ResponsableOP.aspx")
            Else
                If Filas(6).ToString().ToLower() = "2" Or Filas(6).ToString().ToLower() = "3" Then
                    Response.Redirect("./ResponsableMunicipio.aspx")
                End If
            End If
        End If
    End Sub
    Protected Sub cargarcookie()
        Dim Cookieleo As New HttpCookie("TestCookieLeo")
        Cookieleo.Value = Filas(2).ToString
        Response.Cookies.Add(Cookieleo)
    End Sub
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Funciones.agregar_tabla_dataset("SELECT Usuarios.usuario, Usuarios.tipoDocumento, Usuarios.nrodocumento, Usuarios.password, Usuarios.permisos, Usuarios.activo, Personas.tipo FROM Usuarios INNER JOIN Personas ON Usuarios.nrodocumento = Personas.nroDocumento WHERE (Usuarios.permisos = 'Municipio')", "Usuarios", Ds_Usuarios)
        For Each Filas In Ds_Usuarios.Tables("Usuarios").Rows
            If txtUsuario.Text.ToLower() = Filas(0).ToString().ToLower() And txtPassword.Text = Filas(3) And Filas(5) = True Then
                Iniciar_Sesion()
            Else
                lblMensaje.Text = "Los datos de ingreso son incorrectos"
                lblMensaje.Visible = True
            End If
        Next
    End Sub
End Class
