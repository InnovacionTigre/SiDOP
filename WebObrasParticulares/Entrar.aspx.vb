Imports System
Imports Microsoft
Imports System.IO
Imports System.Windows
Imports System.Windows.Forms
Imports System.Data.SqlClient
Imports System.data
Partial Class Entrar
    Inherits System.Web.UI.Page
    Dim Funciones As New Funciones
    Dim Ds_Usuarios As New Data.DataSet
    Dim Filas As Data.DataRow
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub
    Protected Sub Iniciar_Sesion()
        Session.Timeout = 10
        Try
            Dim persona As String = Session("NroCuenta")
            RegistrarCarpeta(persona)
        Catch ex As Exception
        End Try
        crearFichero(Convert.ToString(Session("NroCuenta")))
        Response.Redirect("./DatosPropietario.aspx")
    End Sub
    Protected Sub RegistrarCarpeta(ByVal persona As String)
        Try
            Dim objeto As Funciones = New Funciones
            Dim carpeta As String = Session("NroCuenta").ToString()
            Dim sql As String = "Select idCarpeta From Carpetas where idCarpeta='" & carpeta & "'"
            Dim dscarpeta As New Data.DataSet
            objeto.agregar_tabla_dataset(sql, "Carpetas", dscarpeta)
            If dscarpeta.Tables(0).Rows.Count() < 1 Then
                Dim estado As String = "0006"
                Dim observacion As String = persona
                Dim fecha As DateTime = DateTime.Now
                Dim ip As String = Request.UserHostAddress
                objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')")
                If (objeto.validar_barrio(Session("barrio").ToString())) Then
                    enviarCorreo("arboladopublicodeobra@tigre.gov.ar")
                End If
            End If
        Catch ex As Exception
        End Try
    End Sub
    Protected Sub GrabarElementoaVisar()
        Try
            Dim Objeto As New Funciones
            Dim i As Integer
            Dim j As Integer = 0
            For i = 1 To 144
                j += 1
                Dim comando As New SqlCommand
                comando.Dispose()
                comando = Objeto.ArmarParametrosElementosaVisar(comando, txtNroCuenta.Text, j, False)
                Objeto.EjecutarSp("SPagregarDJ", comando)
            Next
        Catch ex As Exception
        End Try
    End Sub
    Protected Sub crearFichero(ByVal archivo As String)
        Dim ruta As String = Server.MapPath("Archivos\" & archivo)
        Dim ruta2 As String = Server.MapPath("Archivos\" & archivo & "\Tasas")
        Dim ruta3 As String = Server.MapPath("Archivos\" & archivo & "\Catastro")
        Dim ruta4 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares")
        Dim ruta5 As String = Server.MapPath("Archivos\" & archivo & "\Inspeccion")
        Dim ruta6 As String = Server.MapPath("Archivos\" & archivo & "\Comision")
        Dim ruta7 As String = Server.MapPath("Archivos\" & archivo & "\Espacios Publicos")
        Dim ruta2_1 As String = Server.MapPath("Archivos\" & archivo & "\Tasas\Liquidación de Derechos")
        Dim ruta2_2 As String = Server.MapPath("Archivos\" & archivo & "\Tasas\Libre Deuda")
        Dim ruta2_3 As String = Server.MapPath("Archivos\" & archivo & "\Tasas\Informes")
        Dim ruta3_1 As String = Server.MapPath("Archivos\" & archivo & "\Catastro\Plancheta Catastral")
        Dim ruta3_2 As String = Server.MapPath("Archivos\" & archivo & "\Catastro\Informes")
        Dim ruta3_3 As String = Server.MapPath("Archivos\" & archivo & "\Catastro\Planos de Mensura")
        Dim ruta4_1 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Planos")
        Dim ruta4_2 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Estadisticas")
        Dim ruta4_3 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Contratos Profesionales")
        Dim ruta4_4 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Derechos de Construccion")
        Dim ruta4_5 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Escritura de Dominios")
        Dim ruta4_6 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Estatutos Societarios")
        Dim ruta4_7 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Declaracion Jurada")
        Dim ruta4_8 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Plano Registrado")
        Dim ruta4_9 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Informes")
        Dim ruta4_10 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Barrios Cerrados")
        Dim ruta4_11 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Autorizacion y Decretos")
        Dim ruta4_12 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Planos Antecedentes")
        Dim ruta4_13 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Observaciones")
        Dim ruta4_14 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Desvinculación Profesional")
        Dim ruta4_15 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Plano Verificado")
        Dim ruta4_16 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Plano a Obra")
        Dim ruta4_17 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Plano a Estructura")
        Dim ruta4_18 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Plano a Escurrimiento")
        Dim ruta4_19 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Plano a Instalaciones")
        Dim ruta4_20 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Permiso de Obra")
        Dim ruta4_21 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Plano Aprobado")
        Dim ruta4_22 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Plano Inscripto")
        Dim ruta4_23 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Aviso de Inicio de Obra")
        Dim ruta4_24 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Solicitud de Inspección")
        Dim ruta4_25 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Permiso automático de Obra")
        Dim ruta4_26 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Permiso de Demolición")
        Dim ruta4_27 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Solicitud de Inspección Pileta")
        Dim ruta4_28 As String = Server.MapPath("Archivos\" & archivo & "\Obras Particulares\Permiso automático de Pileta")
        Dim ruta5_1 As String = Server.MapPath("Archivos\" & archivo & "\Inspeccion\Informes")
        Dim ruta5_2 As String = Server.MapPath("Archivos\" & archivo & "\Inspeccion\Denuncias")
        Dim ruta5_3 As String = Server.MapPath("Archivos\" & archivo & "\Inspeccion\Final de Obra")
        Dim ruta5_4 As String = Server.MapPath("Archivos\" & archivo & "\Inspeccion\Actas de Contravención")
        Dim ruta5_5 As String = Server.MapPath("Archivos\" & archivo & "\Inspeccion\Fotos")
        Dim ruta6_1 As String = Server.MapPath("Archivos\" & archivo & "\Comision\Disposiciones")
        Dim ruta6_2 As String = Server.MapPath("Archivos\" & archivo & "\Comision\Informes")
        Dim ruta6_3 As String = Server.MapPath("Archivos\" & archivo & "\Comision\Planos")
        Dim ruta7_1 As String = Server.MapPath("Archivos\" & archivo & "\Espacios Publicos\Arbolado Urbano")
        If (Directory.Exists(ruta)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta)
        End If
        If (Directory.Exists(ruta2)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta2)
        End If
        If (Directory.Exists(ruta3)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta3)
        End If
        If (Directory.Exists(ruta4)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4)
        End If
        If (Directory.Exists(ruta5)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta5)
        End If
        If (Directory.Exists(ruta6)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta6)
        End If
        If (Directory.Exists(ruta7)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta7)
        End If
        If (Directory.Exists(ruta2_1)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta2_1)
        End If
        If (Directory.Exists(ruta2_2)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta2_2)
        End If
        If (Directory.Exists(ruta2_3)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta2_3)
        End If
        If (Directory.Exists(ruta3_1)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta3_1)
        End If
        If (Directory.Exists(ruta3_2)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta3_2)
        End If
        If (Directory.Exists(ruta3_3)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta3_3)
        End If
        If (Directory.Exists(ruta4_1)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_1)
        End If
        If (Directory.Exists(ruta4_2)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_2)
        End If
        If (Directory.Exists(ruta4_3)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_3)
        End If
        If (Directory.Exists(ruta4_4)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_4)
        End If
        If (Directory.Exists(ruta4_5)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_5)
        End If
        If (Directory.Exists(ruta4_6)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_6)
        End If
        If (Directory.Exists(ruta4_7)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_7)
        End If
        If (Directory.Exists(ruta4_8)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_8)
        End If
        If (Directory.Exists(ruta4_9)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_9)
        End If
        If (Directory.Exists(ruta4_10)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_10)
        End If
        If (Directory.Exists(ruta4_11)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_11)
        End If
        If (Directory.Exists(ruta4_12)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_12)
        End If
        If (Directory.Exists(ruta4_13)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_13)
        End If
        If (Directory.Exists(ruta4_14)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_14)
        End If
        If (Directory.Exists(ruta4_15)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_15)
        End If
        If (Directory.Exists(ruta4_16)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_16)
        End If
        If (Directory.Exists(ruta4_17)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_17)
        End If
        If (Directory.Exists(ruta4_18)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_18)
        End If
        If (Directory.Exists(ruta4_19)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_19)
        End If
        If (Directory.Exists(ruta4_20)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_20)
        End If
        If (Directory.Exists(ruta4_21)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_21)
        End If
        If (Directory.Exists(ruta4_22)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_22)
        End If
        If (Directory.Exists(ruta4_23)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_23)
        End If
        If (Directory.Exists(ruta4_24)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_24)
        End If
        If (Directory.Exists(ruta4_25)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_25)
        End If
        If (Directory.Exists(ruta4_26)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_26)
        End If
        If (Directory.Exists(ruta4_27)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_27)
        End If
        If (Directory.Exists(ruta4_28)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta4_28)
        End If
        If (Directory.Exists(ruta5_1)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta5_1)
        End If
        If (Directory.Exists(ruta5_2)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta5_2)
        End If
        If (Directory.Exists(ruta5_3)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta5_3)
        End If
        If (Directory.Exists(ruta5_4)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta5_4)
        End If
        If (Directory.Exists(ruta5_5)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta5_5)
        End If
        If (Directory.Exists(ruta6_1)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta6_1)
        End If
        If (Directory.Exists(ruta6_2)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta6_2)
        End If
        If (Directory.Exists(ruta6_3)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta6_3)
        End If
        If (Directory.Exists(ruta7_1)) Then
        Else
            System.IO.Directory.CreateDirectory(ruta7_1)
        End If
    End Sub
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Ds_Usuarios.Clear()
        Funciones.agregar_tabla_datasetTigre("Select cuenta,Inmueble_ClaveWeb, Deuda_Importe, Inmueble_Barrio from WEBOP_V_AUT_Inmuebles where Cuenta='" & txtNroCuenta.Text & "'", "WEBOP_V_AUT_Inmuebles", Ds_Usuarios)
        For Each Filas In Ds_Usuarios.Tables("WEBOP_V_AUT_Inmuebles").Rows
            Session("barrio") = Filas(3).ToString()
            If txtNroCuenta.Text.ToLower() = Filas(0).ToString().ToLower() And txtClaveWeb.Text = Filas(1) Then
                Session("deuda") = Filas(2).ToString()
                Session("NroCuenta") = Filas(0).ToString()
                Iniciar_Sesion()
            Else
                lblMensaje.Text = "Los datos de ingreso son incorrectos"
                lblMensaje.Visible = True
            End If
            If txtNroCuenta.Text.ToLower() = Filas(0).ToString().ToLower() And txtClaveWeb.Text = Filas(1) And Filas(2) <> 0 Then
                Response.Redirect("./Deuda.aspx")
            End If
        Next
    End Sub
    Protected Sub enviarCorreo(ByVal destino As String)
        Dim ValorRetorno As Integer
        Dim Origen As String
        Dim Asunto As String
        Dim mensaje As String
        Dim mensajeInicio As String
        Dim mensajeFin As String
        Dim Objeto As Funciones = New Funciones
        Origen = "ObrasParticularesDigital@tigre.gov.ar"
        Asunto = "Nueva Carpeta creada"
        mensajeInicio = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br> <p> Se creo la Carpeta de Obra <b> " & txtNroCuenta.Text & "</b>. </p><p>"
        mensajeFin = "</p><p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>"
        mensaje = mensajeInicio & mensajeFin
        ValorRetorno = Objeto.EnviarMail(Origen, destino, mensaje, Asunto)
    End Sub
End Class
