Imports System
Imports Microsoft
Imports System.Web
Imports System.IO
Partial Class verificar
    Inherits System.Web.UI.Page
    Dim Funciones As New Funciones
    Dim Ds As New Data.DataSet
    Dim Filas As Data.DataRow
    Dim cuenta As String
    Dim carpeta As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cuenta = Request.QueryString("cuenta")
        If Page.IsPostBack = False Then
            listarArchivos("./Archivos/" & cuenta & "/Obras Particulares/" & carpeta & "")
            validar(cuenta)
        End If
    End Sub

    Protected Sub validar(ByVal cuenta As String)
        Try
            Funciones.agregar_tabla_dataset("SELECT 1 AS EstadoCarpeta, UltimoEstadoCuentas.estado AS Estado FROM Carpetas INNER JOIN UltimoEstadoCuentas ON Carpetas.idCarpeta = UltimoEstadoCuentas.idCarpeta WHERE (Carpetas.idCarpeta  ='" & cuenta & "') AND (Carpetas.Estado = 'Registrado' OR Carpetas.Estado = '1316' OR  Carpetas.Estado = '0003' OR Carpetas.Estado = '0002')", "cuentas", Ds)
            If Ds.Tables(0).Rows(0)(0) = 1 Then
                If Ds.Tables(0).Rows(0)(1).ToString() = "0002" Then
                    carpeta = "Plano Inscripto"

                    lblTexto.Text = "La siguiente obra contiene un PLANO INSCRIPTO por el MUNICIPIO DE TIGRE"
                ElseIf Ds.Tables(0).Rows(0)(1).ToString() = "0003" Then
                    carpeta = "Permiso de Obra"
                    lblTexto.Text = "A la siguiente obra se le otorgó PERMISO DE OBRA por el MUNICIPIO DE TIGRE"
                Else
                    carpeta = "Plano Registrado"
                    lblTexto.Text = "La siguiente obra SE ENCUENTRA APROBADA por el MUNICIPIO DE TIGRE"
                End If
                Session("carpeta") = carpeta

                Dim directorio As String = Server.MapPath("./Archivos/" & cuenta & "/Obras Particulares/" & carpeta & "/")

                Dim folder As New DirectoryInfo(directorio)

                For Each file As FileInfo In folder.GetFiles()
                    ListaArchivos.Items.Add(file.Name)
                Next

            End If
            If (cuenta = "017050") Then
                lblTexto.Text = lblTexto.Text & " - El PLANO VALIDO es el otorgado con sello de PERMISO DE OBRA con fecha 04/12/2015 SUJETO A VALIDEZ SEGÚN NOTA  A fs 80 NO APTO PARA SER SOMETIDO A SUBDIVISIÓN POR PH LEY 13512. -"
            End If
        Catch ex As Exception
        End Try
    End Sub
    Protected Sub Iniciar_Sesion()
        Session("usuario") = Filas(0).ToString().ToLower()
        Session("Permiso") = Filas(4).ToString
        Session("NroDocumentoMunicipio") = Filas(2).ToString
        Session.Timeout = 10
        cargarcookie()
        Response.Redirect("./ResponsableOP.aspx")
    End Sub

    Protected Sub cargarcookie()
        Dim Cookieleo As New HttpCookie("TestCookieLeo")
        Cookieleo.Value = Filas(2).ToString
        Response.Cookies.Add(Cookieleo)
    End Sub

    Protected Sub listarArchivos(ByVal rut As String)
        Try
            Dim directorio As New IO.DirectoryInfo(rut)
            hplQR.Text = ""
            For Each file As IO.FileInfo In directorio.GetFiles()
                ListaArchivos.Items.Add(file.Name)
            Next
        Catch ex As Exception
        End Try
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        carpeta = Session("carpeta")
        Response.Redirect("./Archivos/" & cuenta & "/Obras Particulares/" & carpeta & "/" + ListaArchivos.SelectedItem.Text)
    End Sub
    Protected Sub btnAceptar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAceptar.Click
        If txtClave.Text = "xxx" Then
            txtClave.Visible = False
            btnAceptar.Visible = False
            Button1.Visible = True
        End If
    End Sub
End Class
