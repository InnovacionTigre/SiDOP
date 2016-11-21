using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Windows.Forms;
using System.Data.SqlClient;
using Telerik.Web.UI;
using System.Net;
using System.IO;

public partial class Subir_Archivo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void cargarnumero()
    {
        lblCuenta.Text = Session["cuenta"].ToString();
        Session["origen"] = Request.QueryString["origen"];
    }
    protected void ddlOficina_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (Session["tipo"].ToString() != "3")
        {
            switch (ddlOficina.Text)
            {
                case "Seleccione una oficina":
                    ddlSubCarpeta.Items.Clear();
                    break;
                case "Catastro":
                    ddlSubCarpeta.Items.Clear();
                    ddlSubCarpeta.Items.Add("Seleccione una Sub Carpeta");
                    ddlSubCarpeta.Items.Add("Informes");
                    ddlSubCarpeta.Items.Add("Plancheta Catastral");
                    ddlSubCarpeta.Items.Add("Plano de Mensura");
                    break;
                case "Comisión":
                    ddlSubCarpeta.Items.Clear();
                    ddlSubCarpeta.Items.Add("Disposiciones");
                    ddlSubCarpeta.Items.Add("Informes");
                    ddlSubCarpeta.Items.Add("Planos");
                    break;
                case "Inspección":
                    ddlSubCarpeta.Items.Clear();
                    ddlSubCarpeta.Items.Add("Seleccione una Sub Carpeta");
                    ddlSubCarpeta.Items.Add("Actas de Contravención");
                    ddlSubCarpeta.Items.Add("Denuncias");
                    ddlSubCarpeta.Items.Add("Final de Obra");
                    ddlSubCarpeta.Items.Add("Informes");
                    ddlSubCarpeta.Items.Add("Fotos");
                    break;
                case "Obras Particulares":
                    ddlSubCarpeta.Items.Clear();
                    ddlSubCarpeta.Items.Add("Seleccione una Sub Carpeta");
                    ddlSubCarpeta.Items.Add("Contratos Profesionales");
                    ddlSubCarpeta.Items.Add("Declaración Jurada");
                    ddlSubCarpeta.Items.Add("Derechos de Construcción");
                    ddlSubCarpeta.Items.Add("Escritura de Dominios");
                    ddlSubCarpeta.Items.Add("Estadisticas");
                    ddlSubCarpeta.Items.Add("Estatutos Societarios");      
                    ddlSubCarpeta.Items.Add("Planos Antecedentes");
                    ddlSubCarpeta.Items.Add("Plano de Obra");
                    ddlSubCarpeta.Items.Add("Plano de Estructura");
                    ddlSubCarpeta.Items.Add("Plano de Escurrimiento");
                    ddlSubCarpeta.Items.Add("Plano de Instalaciones");
                    ddlSubCarpeta.Items.Add("Informes");
                    ddlSubCarpeta.Items.Add("Barrios Cerrados");
                    ddlSubCarpeta.Items.Add("Autorizacion y Decretos");
                    ddlSubCarpeta.Items.Add("Aviso de Inicio de Obra");
                    ddlSubCarpeta.Items.Add("Solicitud de Inspección");
                    ddlSubCarpeta.Items.Add("Desvinculación Profesional");
                    if (Session["Permiso"].ToString() == "Municipio")
                    {
                        ddlSubCarpeta.Items.Add("Plano Verificado");                        
                        ddlSubCarpeta.Items.Add("Observaciones");
                        ddlSubCarpeta.Items.Add("Permiso Automático de Obra");
                    }
                    if ((Session["usuario"].ToString() == "11732") || (Session["usuario"].ToString() == "13057") || (Session["usuario"].ToString() == "11181"))
                    {
                        ddlSubCarpeta.Items.Add("Plano Registrado");
                        ddlSubCarpeta.Items.Add("Permiso de Obra");
                        ddlSubCarpeta.Items.Add("Plano Aprobado");
                        ddlSubCarpeta.Items.Add("Plano Inscripto");
                    }
                    break;
                case "Tasas":
                    ddlSubCarpeta.Items.Clear();
                    ddlSubCarpeta.Items.Add("Seleccione una Sub Carpeta");
                    ddlSubCarpeta.Items.Add("Informes");
                    ddlSubCarpeta.Items.Add("Libre Deuda");
                    ddlSubCarpeta.Items.Add("Liquidación de Derechos");
                    break;
            }
        }
        else
        {
            switch (ddlOficina.Text)
            {
                case "Seleccione una oficina":
                    ddlSubCarpeta.Items.Clear();
                    break;
                case "Espacios Publicos":
                    ddlSubCarpeta.Items.Clear();
                    ddlSubCarpeta.Items.Add("Seleccione una Sub Carpeta");
                    ddlSubCarpeta.Items.Add("Arbolado Urbano");
                    break;
            }
        }
    }
    protected void btbSubirArchivo_Click(object sender, EventArgs e)
    {
        string UlmEstado=obtener_ultimo_Estado(Convert.ToString(Session["cuenta"])) ;
        if ((UlmEstado != "0002" && UlmEstado != "0003" && UlmEstado != "0004" && UlmEstado != "0005" && UlmEstado != "0009" && UlmEstado != "1288" && UlmEstado != "1308" && UlmEstado != "1310" && UlmEstado != "1312" && UlmEstado != "1316" && UlmEstado != "Registrado") || ((Session["usuario"].ToString() == "11732")) || ((Session["usuario"].ToString() == "13057")) || (Session["usuario"].ToString() == "11181"))
        { 
       try
       {
        String FileName;
        String FilePath;
        String Folder;
        String ruta;
        String nombre;
        string fecha;
        string origen = "";
        string destino = "";
        fecha=obtenerfecha();
        ruta = CrearRuta();
        Folder = Server.MapPath("./" + ruta);
        FileName = oFile.FileName;
        string archivo = Server.HtmlEncode(oFile.FileName);
        string extension= System.IO.Path.GetExtension(archivo);
        if ((extension == ".pdf") || (extension == ".zip") || (extension == ".rar") || (extension == ".jpg") || (extension == ".xls") || (extension == ".xlsx") || (extension == ".doc") || (extension == ".docx"))
        {
            nombre = ddlSubCarpeta.Text + " " + fecha + extension;
            FilePath = Folder + nombre;
            if (File.Exists(FilePath))
            {
                lblResult.Text = "El Archivo " + FileName + " ya existe";
            }
            else
            {
                oFile.PostedFile.SaveAs(FilePath);
                lblResult.Text = "El Archivo " + FileName + " fue subido con exito";
                guargarRegistroArchivo(FilePath, nombre);

                if (Session["Permiso"].ToString() == "profesional")
                {
                    string nrodoc = Session["NroDocumentoProfesional"].ToString();
                    origen = obtener_correo(nrodoc);
                    switch (ddlOficina.SelectedValue.ToString())
                    {
                        case "Catastro":
                            destino = "CatastroDigital@tigre.gov.ar";
                            break;
                        case "Comisión":
                            destino = "ComisionDigital@tigre.gov.ar";
                            break;
                        case "Inspección":
                            destino = "InspeccionDigital@tigre.gov.ar";
                            break;
                        case "Obras Particulares":
                            try
                            {
                                destino = obtener_correo_Municipio_designado(Convert.ToString(Session["cuenta"]));
                            }
                            catch {                             
                            }
                            break;
                        case "Tasas":
                            destino = "TasasDigital@tigre.gov.ar";
                            break;
                    }                   
                }
                else
                {
                    string nrodoc = Session["NroDocumentoMunicipio"].ToString();
                    origen = obtener_correo(nrodoc);
                    if (Session["tipo"].ToString() != "3")
                    {
                        destino = obtener_correo_profesional(Convert.ToString(Session["cuenta"]));
                    }
                    else {
                        destino = "";
                    }
                    }
                try
                {
                    enviarCorreo(origen, destino);
                    if (Session["tipo"].ToString() != "3")
                    {
                        enviarCorreo(origen, obtener_correo_Propietario(Convert.ToString(Session["cuenta"])));
                    }           
                    if (ddlSubCarpeta.SelectedValue.ToString() == "Arbolado Urbano")
                    {
                        enviarCorreo(origen, "arboladopublicodeobra@tigre.gov.ar");
                    }                    
                }
                catch
                {
                    lblResult.Text = "El Archivo " + FileName + " fue subido con exito. - No se logro enviar el E-mail a todos los destinatarios";
                }
            }
        }
        else
        {
            lblResult.Text = "El archivo seleccionado no cuenta con el formato correcto, debe ser .PDF";
        }       
    }
      catch
      {
      lblResult.Text="No se logro subir el archivo por un error inesperado";
      }
      ddlOficina.SelectedIndex = 0;
      ddlSubCarpeta.SelectedIndex = 0;
      chbAlcance.Checked = false;
      chbAlcance.Visible = false;      
      lblResult.Visible = true;
  }
  else
  {
      lblResult.Text = "Debido al estado del expediente no se puede subir archivos.";
      lblResult.Visible = true;
  }
        
    }
    public string obtenerfecha()
    {
        DateTime fechaActual = DateTime.Now;
        string fecha;
        int i;
        int j;
        int k;
        fecha = Convert.ToString(fechaActual);
        if (fecha.Substring(12, 1) == ":")
        {
            i = 1;
            j = 13;
            k = 16;
        }
        else
        {
            i = 2;
            j=  14;
            k = 17;
        }
        fecha = fecha.Substring(0, 2) + "-" + fecha.Substring(3, 2) + "-" + fecha.Substring(6, 4) + " " + fecha.Substring(11, i) + "-" + fecha.Substring(j, 2) + "-" + fecha.Substring(k, 2);
        return fecha;
    }
    public string CrearRuta()
    {
        string rutaArchivo="";
        switch (ddlOficina.Text)
        {
            case "Seleccione una oficina":                
            case "Catastro":
                switch (ddlSubCarpeta.Text)
                {
                    case "Informes":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Catastro/Informes/";
                        break;
                    case "Plancheta Catastral":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Catastro/Plancheta Catastral/";
                        break;
                    case "Plano de Mensura":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Catastro/Planos de Mensura/";
                        break;
                }
                break;
            case "Comisión":
                switch (ddlSubCarpeta.Text)
                {
                    case "Disposiciones":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Comision/Disposiciones/";
                        break;
                    case "Informes":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Comision/Informes/";
                        break;
                    case "Planos":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Comision/Planos/";
                        break;                 
                }
                break;
            case "Inspección":
                switch (ddlSubCarpeta.Text)
                {
                    case "Actas de Contravención":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Inspeccion/Actas de Contravención/";
                        break;
                    case "Denuncias":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Inspeccion/Denuncias/";
                        break;
                    case "Final de Obra":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Inspeccion/Final de Obra/";
                        break;
                    case "Informes":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Inspeccion/Informes/";
                        break;
                    case "Fotos":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Inspeccion/Fotos/";
                        break;
                }
                break;
            case "Obras Particulares":
                switch (ddlSubCarpeta.Text)
                {
                    case "Contratos Profesionales":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Contratos Profesionales/";
                        break;
                    case "Declaración Jurada":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Declaracion Jurada/";
                        break;
                    case "Derechos de Construcción":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Derechos de Construccion/";
                        break;
                    case "Estadisticas":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Estadisticas/";
                        break;
                    case "Estatutos Societarios":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Estatutos Societarios/";
                        break;
                    case "Planos":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Planos/";
                        break;
                    case "Plano Registrado":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Plano Registrado/";
                        break;
                    case "Informes":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Informes/";
                        break;
                    case "Barrios Cerrados":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Barrios Cerrados/";
                        break;
                    case "Autorizacion y Decretos":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Autorizacion y Decretos/";
                        break;
                    case "Plano Verificado":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Plano Verificado/";
                        break;
                    case "Plano Inscripto":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Plano Inscripto/";
                        break;
                    case "Desvinculación Profesional":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Desvinculación Profesional/";
                        break;
                    case "Observaciones":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Observaciones/";
                        break;
                    case "Planos Antecedentes":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Planos Antecedentes/";
                        break;
                    case "Escritura de Dominios":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Escritura de Dominios/";
                        break;
                    case "Plano de Obra":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Plano a Obra/";
                        break;
                    case "Plano de Estructura":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Plano a Estructura/";
                        break;
                    case "Plano de Escurrimiento":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Plano a Escurrimiento/";
                        break;
                    case "Plano de Instalaciones":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Plano a Instalaciones/";
                        break;
                    case "Permiso de Obra":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Permiso de Obra/";
                        break;
                    case "Plano Aprobado":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Plano Aprobado/";
                        break;
                    case "Aviso de Inicio de Obra":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Aviso de Inicio de Obra/";
                        break;
                    case "Solicitud de Inspección":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Solicitud de Inspección/";
                        break;
                    case "Permiso Automático de Obra":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Obras Particulares/Permiso Automático de Obra/";
                        break;
                }
                break;
            case "Tasas":
                switch (ddlSubCarpeta.Text)
                {
                    case "Informes":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Tasas/Informes/";
                        break;
                    case "Libre Deuda":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Tasas/Libre Deuda/";
                        break;
                    case "Liquidación de Derechos":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Tasas/Liquidación de Derechos/";
                        break;                    
                }
                break;
            case "Espacios Publicos":
                switch (ddlSubCarpeta.Text)
                {
                    case "Arbolado Urbano":
                        rutaArchivo = "Archivos/" + Session["cuenta"] + "/Espacios Publicos/Arbolado Urbano/";
                        break;
                }
                break;
            }
            return rutaArchivo;
    }
    protected void guargarRegistroArchivo(String ruta, String nombre)
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        SqlCommand comandoGrabar = new SqlCommand();        
        DataSet ultimoArchivo = new DataSet();
        DataTable dtUltimoArchivo = new DataTable();
        string nroDocumentoProfesional;        
        if (Session["Permiso"].ToString() == "profesional")
        {
            nroDocumentoProfesional = Convert.ToString(Session["NroDocumentoProfesional"]);
        }
        else 
        {
            nroDocumentoProfesional = Convert.ToString(Session["NroDocumentoMunicipio"]);
        }        
        String nrocuenta = Convert.ToString(Session["cuenta"]);
        DateTime fecha = DateTime.Now;
        string subC = ddlSubCarpeta.Text;
        comando = objeto.ArmarParametrosSelectRegistroArchivos(comando, nroDocumentoProfesional, nrocuenta, fecha, ddlOficina.Text, ddlSubCarpeta.Text);
        objeto.agregar_tabla_dataset_SP("SPSeleccionarNumeroArchivo", comando, ultimoArchivo);
        dtUltimoArchivo = ultimoArchivo.Tables[0];
        Int32  nroArchivo = Convert.ToInt32(dtUltimoArchivo.Rows[0][0].ToString()) + 1;
        string ip = Request.UserHostAddress;
        comandoGrabar = objeto.ArmarParametrosRegistroArchivos(comandoGrabar, nroDocumentoProfesional, nrocuenta, fecha, ddlOficina.Text, ddlSubCarpeta.Text, nroArchivo, nombre , ruta, ip);
        objeto.EjecutarSp("SPagregarRegistroArchivo", comandoGrabar);
        if (subC == "Plano Registrado")
        {
            registrarPlano(nrocuenta);
        }
        if (subC == "Plano Aprobado")
        {
            registrarAprobado(nrocuenta);
        }
        if (subC == "Plano Inscripto")
        {
            registrarInscripto(nrocuenta);
        }
        if (subC == "Permiso de Obra")
        {
            registrarPermisodeObra(nrocuenta);
        }
        if (subC == "Plano Verificado")
        {
            registrarPlanoVerificado(nrocuenta);
        }
        if (ddlOficina.Text == "Inspección" && subC == "Informes")
        {
            registrarPlanoActivoInspeccionado(nrocuenta);
        }
        if (ddlOficina.Text == "Obras Particulares" && subC == "Permiso Automático de Obra")
        {
            registrarPermisoAutomaticodeObra(nrocuenta);
        }
        if (ddlOficina.Text == "Obras Particulares" && subC == "Solicitud de Inspección")
        {
            registrarSolicitudInspeccion(nrocuenta);
        }
        if (ddlOficina.Text == "Obras Particulares" && subC == "Aviso de Inicio de Obra")
        {
            registrarAvisoInicioObra(nrocuenta);
        }
        string origen = Request.QueryString["origen"];
        if (((ddlSubCarpeta.Text == "Plano de Obra")||(ddlSubCarpeta.Text == "Declaración Jurada")) && (origen == "1"))
        {
            string sqlespera = "SELECT estado FROM UltimoEstadoCuentas WHERE idCarpeta = '" + nrocuenta + "'";
            DataSet dsespera = new DataSet();
            int espera = 0;
            objeto.agregar_tabla_dataset(sqlespera, "Espera", dsespera);
            switch (dsespera.Tables[0].Rows[0][0].ToString())
            {
                case "1286":
                    espera = 1;
                    break;
                case "0010":
                    espera = 2;
                    break;
                default:
                    espera = 0;
                    break;
            }
            string persona = Session["NroDocumentoProfesional"].ToString();
            if (espera == 0){
                string estado = "0010";
                objeto.agregarEstadoCarpeta(nrocuenta, estado, persona, ip);
                lblResult.Text="Tenga en cuenta que para poder continuar el tramite, la corrección debe estar compuesta por la Declaración Jurada y el Plano de Obra";
                lblResult.Visible=true ;    
            }else if(espera==2)
            {
                string estado = "1280";
                objeto.agregarEstadoCarpeta(nrocuenta, estado, persona, ip);
            }

            if (ddlSubCarpeta.Text == "Declaración Jurada")
            {            
                SqlCommand comandoMulta = new SqlCommand();
                DataSet dsmulta = new DataSet();
                DataTable dtmulta = new DataTable();
                comandoMulta = objeto.ArmarParametrosGererarDeudaSellado(comandoMulta, Convert.ToInt32(nrocuenta), 110);
                objeto.Ejecutar_SP_C_Select_Tigre("WebSelladoCarpeta_CtaCte_Ins", comandoMulta, dsmulta);
                dtmulta = dsmulta.Tables[0];
                nuevaPagina(dtmulta.Rows[0][0].ToString());
                enviarCorreoXTasas();
            }            
        }
        else
        {
            if ((ddlSubCarpeta.Text == "Observaciones") && (origen != "1"))
            {
                string persona = Session["NroDocumentoMunicipio"].ToString();
                string estado = "";               
                switch (nroArchivo)
                {
                    case 1:
                        estado = "1302";
                        break;
                    case 2:
                        estado = "1302";
                        break;
                    case 3:
                        estado = "1304";
                        break;
                    case 4:
                        estado = "1304";
                        break;
                    case 5:
                        estado = "1306";
                        break;
                    case 6:
                        estado = "1306";
                        break;
                   default:
                        estado = "0013";
                        break;
                 }
                 if (chbAlcance.Checked == true)
                 {
                     estado = "1286";
                 }                
                objeto.agregarEstadoCarpeta(nrocuenta, estado, persona, ip);
            }
        }
    }
    protected void imbVolver_Click(object sender, ImageClickEventArgs e)
    {
        string origen = Session["origen"].ToString();
        switch (origen)
        {
            case "1":
                Response.Redirect("./Principal.aspx");
                break;
            case "2":
                Response.Redirect("./ResponsableOP.aspx");
                break;
            case "3":
                Response.Redirect("./DirectorOP.aspx");
                break;
            case "4":
                Response.Redirect("./ResponsableMunicipio.aspx");
                break;                
        }     
    }
    protected void enviarCorreo(string origen,string destino)
    {
        int ValorRetorno;
        string Asunto;
        string mensaje;
        Funciones Objeto= new Funciones ();
        string cuenta;
        cuenta = Session["cuenta"].ToString();       
        Asunto = "Archivo Subido - SiDOP - Municipio de Tigre";
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>Se subio un nuevo archivo a la cartepa " + ddlOficina.Text + " , subcarpeta " + ddlSubCarpeta.Text + " de la cuenta  " + cuenta + " <div /><p> No responda este e-mail, Es un envio automático</p> <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";
        ValorRetorno = Objeto.EnviarMail(origen, destino, mensaje, Asunto);
    }
    protected void enviarCorreoXTasas()
    {
        int ValorRetorno;
        string origen = "SiDOP@tigre.gov.ar";
        string destino = "tasasDigital@tigre.gov.ar";
        string Asunto;
        string mensaje;
        Funciones Objeto = new Funciones();
        string cuenta;
        cuenta = Session["cuenta"].ToString();
        Asunto = "Archivo Subido - SiDOP - Municipio de Tigre";
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>Se subio un nuevo archivo a la cartepa " + ddlOficina.Text + " , subcarpeta " + ddlSubCarpeta.Text + " de la cuenta  " + cuenta + " <div /><p> No responda este e-mail, Es un envio automático</p> <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";
        ValorRetorno = Objeto.EnviarMail(origen, destino, mensaje, Asunto);
    }
    protected void enviarCorreoRegistrado(string origen, string destino,string asignacion)
    {
        int ValorRetorno;
        string Asunto;
        string mensaje;
        Funciones Objeto = new Funciones();
        string cuenta;
        string expediente;
        cuenta = Session["cuenta"].ToString();
        expediente = Session["expediente"].ToString();
        Asunto = "Archivo Subido - SiDOP - Municipio de Tigre";
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br> SE " + asignacion + " EL PLANO CORRESPONDIENTE A LA CUENTA " + cuenta + ", EXPEDIENTE " + expediente + ". <div /><p> No responda este e-mail, Es un envio automático</p> <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";
        ValorRetorno = Objeto.EnviarMail(origen, destino, mensaje, Asunto);
    }
    protected string obtener_correo(string origen)  
    {        
            Funciones objeto = new Funciones();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            objeto.agregar_tabla_dataset("Select mail from personas where nroDocumento='" + origen + "'", "Personas", ds);
            dt = ds.Tables[0];
            return dt.Rows[0]["mail"].ToString();       
    }

    protected string obtener_correo_profesional(string cuenta)
    {       
            Funciones objeto = new Funciones();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            objeto.agregar_tabla_dataset("SELECT Personas.mail FROM Personas INNER JOIN ProfesionalXcuenta ON Personas.nroDocumento = ProfesionalXcuenta.nroDocumentoProfesional WHERE ProfesionalXcuenta.nroCuenta = '" + cuenta + "'", "Personas", ds);
            dt = ds.Tables[0];
            return dt.Rows[0]["mail"].ToString();        
    }
    protected string obtener_correo_Municipio_designado(string cuenta)
    {
        Funciones objeto = new Funciones();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        objeto.agregar_tabla_dataset("SELECT Personas.mail FROM Personas INNER JOIN MunicipalXcuenta ON Personas.nroDocumento = MunicipalXcuenta.nroDocumentoMunicipio WHERE MunicipalXcuenta.nroCuenta = '" + cuenta + "'", "Personas", ds);
        dt = ds.Tables[0];
        return dt.Rows[0]["mail"].ToString();
    }
    protected string obtener_correo_Propietario(string cuenta)
    {
        Funciones objeto = new Funciones();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        objeto.agregar_tabla_dataset("SELECT PropietarioxCuenta.mail FROM PropietarioxCuenta WHERE PropietarioxCuenta.nroCuenta = '" + cuenta + "'", "PropietarioxCuenta", ds);
        dt = ds.Tables[0];
        return dt.Rows[0]["mail"].ToString();
    }
    protected string obtener_ultimo_Estado(string cuenta)
    {
        Funciones objeto = new Funciones();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        objeto.agregar_tabla_dataset("Select estado from UltimoEstadoCuentas where idCarpeta='" + lblCuenta.Text + "'", "ultimoEstado", ds);
        dt = ds.Tables[0];
        return dt.Rows[0]["estado"].ToString();
    }
    protected void ddlSubCarpeta_SelectedIndexChanged(object sender, EventArgs e)
    {
         string origen = Request.QueryString["origen"];
         if ((ddlSubCarpeta.Text == "Declaración Jurada") && (origen == "1"))
         {
             Funciones objeto = new Funciones();
             DataSet dsEstado = new DataSet();
             string sql = "Select estado from UltimoEstadoCuentas where idCarpeta='" + lblCuenta.Text +"'";
             objeto.agregar_tabla_dataset(sql,"Estado",dsEstado);
             if (dsEstado.Tables[0].Rows[0][0].ToString() == "1312")
             {
                 lblResult.Text = "EL EXPEDIENTE DONDE ESTA TRABAJANDO SE ENCUENTRA SUPENDIDO PARA PRESENTAR UNA NUEVA DECLARACION JURADA";
                 lblResult.Visible = true;
                 oFile.Visible = false;
                 btbSubirArchivo.Visible = false;             
             }
             lblResult.Text = "PRESENTAR NUEVAMENTE LA DECLARACIÓN JURADA TIENE COSTO, PARA QUE SE CONTINUE CON EL TRAMITE TENDRA QUE CANCELAR LA DEUDA";
             lblResult.Visible = true;
             bntLiquidarMulta.Visible = true;
             oFile.Visible = false;
             btbSubirArchivo.Visible = false;
         }
         if ((ddlSubCarpeta.Text == "Observaciones") && (origen != "1"))
         {
             chbAlcance.Visible = true;
         }
         else
         {
             chbAlcance.Visible = false;
         }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lblResult.Visible = false;
        bntLiquidarMulta.Visible = false;
        btbSubirArchivo.Visible = true;
        oFile.Visible = true;
    }
    protected void nuevaPagina(string url)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "otroTag('" + url + "');", true);
    }
    protected void registrarPlano(string cuenta)
    {
        Int32 control = 0;
        try
        {
            string usuario = Session["usuario"].ToString();
            if ((usuario == "11732") || (usuario == "13057") || (usuario == "11181"))
            {
                string carpeta = cuenta;
                string estado = "1316";
                string persona = Session["NroDocumentoMunicipio"].ToString();
                string observacion = persona;
                DateTime fecha = DateTime.Now;
                string ip = Request.UserHostAddress;

                Funciones objeto = new Funciones();
                objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
                control = 1;
            }
            else { }
        }
        catch
        {
            lblResult.Text = "Se produjo un error al registrar el plano, vuelva a intentarlo";
            lblResult.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            lblResult.Text = "El plano fue REGISTRADO con exito.";
            lblResult.Visible = true;
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", "TasasDigital@tigre.gov.ar","REGISTRO");
            }
            catch
            {
                lblResult.Text = "El plano fue REGISTRADO. Se produjo un error al intentar enviar el correo a TasasDigital.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])),"REGISTRO");
            }
            catch
            {
                lblResult.Text = "El plano fue REGISTRADO. Se produjo un error al intentar enviar el correo al profesional.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])),"REGISTRO");
            }
            catch
            {
                lblResult.Text = "El plano fue REGISTRADO. Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
        }
        else {
            if(control == 0)
            {
                lblResult.Text = "El plano NO fue REGISTRADO.";
                lblResult.Visible = true;
            }
        }
    }
    protected void registrarAprobado(string cuenta)
    {
        Int32 control = 0;
        try
        {
            string usuario = Session["usuario"].ToString();
            if ((usuario == "11732") || (usuario == "13057") || (usuario == "11181"))
            {
                string carpeta = cuenta;
                string estado = "1308";
                string persona = Session["NroDocumentoMunicipio"].ToString();
                string observacion = persona;
                DateTime fecha = DateTime.Now;
                string ip = Request.UserHostAddress;
                Funciones objeto = new Funciones();
                objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
                control = 1;
            }
            else { }
        }
        catch
        {
            lblResult.Text = "Se produjo un error al aprobar el plano, vuelva a intentarlo";
            lblResult.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            lblResult.Text = "El plano fue APROBADO con exito.";
            lblResult.Visible = true;
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", "TasasDigital@tigre.gov.ar","APROBO");
            }
            catch
            {
                lblResult.Text = "El plano fue APROBADO. Se produjo un error al intentar enviar el correo a TasasDigital.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])),"APROBO");
            }
            catch
            {
                lblResult.Text = "El plano fue APROBADO. Se produjo un error al intentar enviar el correo al profesional.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])),"APROBO");
            }
            catch
            {
                lblResult.Text = "El plano fue APROBADO. Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
        }
        else
        {
            if (control == 0)
            {
                lblResult.Text = "El plano NO fue APROBADO.";
                lblResult.Visible = true;
            }
        }
    }
    protected void registrarInscripto(string cuenta)
    {
        Int32 control = 0;
        try
        {
            string usuario = Session["usuario"].ToString();
            if ((usuario == "11732") || (usuario == "13057") || (usuario == "11181"))
            {
                string carpeta = cuenta;
                string estado = "0002";
                string persona = Session["NroDocumentoMunicipio"].ToString();
                string observacion = persona;
                DateTime fecha = DateTime.Now;
                string ip = Request.UserHostAddress;

                Funciones objeto = new Funciones();
                objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
                control = 1;
            }
            else { }
        }
        catch
        {
            lblResult.Text = "Se produjo un error al Inscribir el plano, vuelva a intentarlo";
            lblResult.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            lblResult.Text = "El plano fue INSCRIPTO con exito.";
            lblResult.Visible = true;
            try
            {
            }
            catch
            {
                lblResult.Text = "El plano fue INSCRIPTO. Se produjo un error al intentar enviar el correo a TasasDigital.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])),"INSCRIBIO");
            }
            catch
            {
                lblResult.Text = "El plano fue INSCRIPTO. Se produjo un error al intentar enviar el correo al profesional.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])),"INSCRIBIO");
            }
            catch
            {
                lblResult.Text = "El plano fue INSCRIPTO. Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
        }
        else
        {
            if (control == 0)
            {
                lblResult.Text = "El plano NO fue INSCRIPTO.";
                lblResult.Visible = true;
            }
        }

    }
    protected void registrarPermisodeObra(string cuenta)
    {
        Int32 control = 0;
        try
        {
            string usuario = Session["usuario"].ToString();
            if ((usuario == "11732") || (usuario == "13057") || (usuario == "11181"))
            {
                string carpeta = cuenta;
                string estado = "0003";
                string persona = Session["NroDocumentoMunicipio"].ToString();
                string observacion = persona;
                DateTime fecha = DateTime.Now;
                string ip = Request.UserHostAddress;

                Funciones objeto = new Funciones();
                objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
                control = 1;
            }
            else { }
        }
        catch
        {
            lblResult.Text = "Se produjo un error al solicitar permiso de obra el plano, vuelva a intentarlo";
            lblResult.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            lblResult.Text = "Al plano se le otorgo PERMISO DE OBRA con exito.";
            lblResult.Visible = true;
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", "TasasDigital@tigre.gov.ar","le otorgo PERMISO DE OBRA");
            }
            catch
            {
                lblResult.Text = "El plano obtuvo PERMISO DE OBRA . Se produjo un error al intentar enviar el correo a TasasDigital.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "le otorgo PERMISO DE OBRA");
            }
            catch
            {
                lblResult.Text = "El plano obtuvo PERMISO DE OBRA. Se produjo un error al intentar enviar el correo al profesional.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "le otorgo PERMISO DE OBRA");
            }
            catch
            {
                lblResult.Text = "El plano obtuvo PERMISO DE OBRA. Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
        }
        else
        {
            if (control == 0)
            {
                lblResult.Text = "El plano NO obtuvo PERMISO DE OBRA.";
                lblResult.Visible = true;
            }
        }
    }
    protected void registrarPlanoVerificado(string cuenta)
    {
        Int32 control = 0;
        try
        {
                string usuario = Session["usuario"].ToString();           
                string carpeta = cuenta;
                string estado = "1287";
                string persona = Session["NroDocumentoMunicipio"].ToString();
                string observacion = persona;
                DateTime fecha = DateTime.Now;
                string ip = Request.UserHostAddress;
                Funciones objeto = new Funciones();
                objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
                control = 1;            
        }
        catch
        {
            lblResult.Text = "Se produjo un error al solicitar la verificación del plano, vuelva a intentarlo";
            lblResult.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            lblResult.Text = "Al plano se le otorgo el estado de VERIFICADO con exito.";
            lblResult.Visible = true;
            try
            {
            }
            catch
            {
                lblResult.Text = "El plano obtuvo el estado VERIFICADO . Se produjo un error al intentar enviar el correo a TasasDigital.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "le otorgo estado VERIFICADO");
            }
            catch
            {
                lblResult.Text = "El plano obtuvo el estado VERIFICADO. Se produjo un error al intentar enviar el correo al profesional.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "le otorgo estado VERIFICADO");
            }
            catch
            {
                lblResult.Text = "El plano obtuvo el estado VERIFICADO. Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
        }
        else
        {
            if (control == 0)
            {
                lblResult.Text = "El plano NO obtuvo el estado VERIFICADO.";
                lblResult.Visible = true;
            }
        }
    }
    protected void registrarPlanoActivoInspeccionado(string cuenta)
    {
        Int32 control = 0;
        try
        {
                string usuario = Session["usuario"].ToString();           
                string carpeta = cuenta;
                string estado = "0008";
                string persona = Session["NroDocumentoMunicipio"].ToString();
                string observacion = persona;
                DateTime fecha = DateTime.Now;
                string ip = Request.UserHostAddress;
                Funciones objeto = new Funciones();
                objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
                control = 1;            
        }
        catch
        {
            lblResult.Text = "Se produjo un error al solicitar el cambio de estado, vuelva a intentarlo";
            lblResult.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            lblResult.Text = "Al plano se le otorgo el estado de ACTIVO - INSPECCIONADO con exito.";
            lblResult.Visible = true;
        }
        else
        {
            if (control == 0)
            {
                lblResult.Text = "El plano NO obtuvo el estado  ACTIVO-INSPECCIONADO.";
                lblResult.Visible = true;
            }
        }
    }
    protected void registrarPermisoAutomaticodeObra(string cuenta)
    {
        Int32 control = 0;
        try
        {
            string usuario = Session["usuario"].ToString();
            string carpeta = cuenta;
            string estado = "0014";
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string observacion = persona;
            DateTime fecha = DateTime.Now;
            string ip = Request.UserHostAddress;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
            control = 1;
        }
        catch
        {
            lblResult.Text = "Se produjo un error al solicitar la verificación del plano, vuelva a intentarlo";
            lblResult.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            lblResult.Text = "Al plano se le otorgo el estado de PERMISO AUTOMÁTICO DE OBRA con exito.";
            lblResult.Visible = true;
            try
            {             
            }
            catch
            {
                lblResult.Text = "El plano obtuvo el estado PERMISO AUTOMÁTICO DE OBRA . Se produjo un error al intentar enviar el correo a TasasDigital.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "le otorgo estado PERMISO AUTOMÁTICO DE OBRA");
            }
            catch
            {
                lblResult.Text = "El plano obtuvo el estado PERMISO AUTOMÁTICO DE OBRA. Se produjo un error al intentar enviar el correo al profesional.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "le otorgo estado PERMISO AUTOMÁTICO DE OBRA");
            }
            catch
            {
                lblResult.Text = "El plano obtuvo el estado PERMISO AUTOMÁTICO DE OBRA. Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar","InspeccionDigital@tigre.gov.ar", "le otorgo estado PERMISO AUTOMÁTICO DE OBRA");
            }
            catch
            {
                lblResult.Text = "El plano obtuvo el estado PERMISO AUTOMÁTICO DE OBRA. Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }           
        }
        else
        {
            if (control == 0)
            {
                lblResult.Text = "El plano NO obtuvo el estado PERMISO AUTOMÁTICO DE OBRA.";
                lblResult.Visible = true;
            }
        }
    }
    protected void registrarSolicitudInspeccion(string cuenta)
    {
        Int32 control = 0;
        try
        {
            string usuario = Session["usuario"].ToString();
            string carpeta = cuenta;
            string estado = "0016";
            string observacion = usuario;
            DateTime fecha = DateTime.Now;
            string ip = Request.UserHostAddress;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
            control = 1;
        }
        catch
        {
            lblResult.Text = "Se produjo un error al solicitar la inspección del plano, vuelva a intentarlo";
            lblResult.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            lblResult.Text = "La cuenta solicitó Inspección con exito.";
            lblResult.Visible = true;
            lblResult.Visible = true;            
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", "ObrasParticularesDigita@tigre.gov.ar", " Solicitó INSPECCIÓN DE OBRA");
            }
            catch
            {
                lblResult.Text = "La cuenta  logró solicitar la INSPECCIÓN DE OBRA . Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", "InspeccionDigital@tigre.gov.ar", " Solicitó INSPECCIÓN DE OBRA");
            }
            catch
            {
                lblResult.Text = "La cuenta  logró solicitar la INSPECCIÓN DE OBRA . Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
        }      
        else
        {
            if (control == 0)
            {
                lblResult.Text = "El plano NO obtuvo el estado PERMISO AUTOMÁTICO DE OBRA.";
                lblResult.Visible = true;
            }
        }
    }  
    protected void registrarAvisoInicioObra(string cuenta)
    {
        Int32 control = 0;
        try
        {
            string usuario = Session["usuario"].ToString();
            string carpeta = cuenta;
            string estado = "0015";
            string observacion = usuario;
            DateTime fecha = DateTime.Now;
            string ip = Request.UserHostAddress;
            Funciones objeto = new Funciones();           
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
            control = 1;
        }
        catch
        {
            lblResult.Text = "Se produjo un error al solicitar el aviso de inicio de obra, vuelva a intentarlo";
            lblResult.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            lblResult.Text = "La cuenta solicitó Aviso de Inicio de Obra con exito.";
            lblResult.Visible = true;
            lblResult.Visible = true;
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", "ObrasParticularesDigita@tigre.gov.ar", "Solicitó AVISO DE INICIO DE OBRA");
            }
            catch
            {
                lblResult.Text = "La cuenta  logró solicitar el AVISO DE INICIO DE OBRA. Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", "InspeccionDigital@tigre.gov.ar", " Solicitó AVISO DE INICIO DE OBRA");
            }
            catch
            {
                lblResult.Text = "La cuenta  logró solicitar el AVISO DE INICIO DE OBRA . Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
            try
            {
                enviarCorreoRegistrado("ObrasParticularesDigital@tigre.gov.ar", "TasasDigital@tigre.gov.ar", " Solicitó AVISO DE INICIO DE OBRA");
            }
            catch
            {
                lblResult.Text = "La cuenta  logró solicitar el AVISO DE INICIO DE OBRA . Se produjo un error al intentar enviar el correo al propietario.";
                lblResult.Visible = true;
            }
        }
        else
        {
            if (control == 0)
            {
                lblResult.Text = "El plano  obtuvo el estado AVISO DE INICIO DE OBRA.";
                lblResult.Visible = true;
            }
        }
    }

}
