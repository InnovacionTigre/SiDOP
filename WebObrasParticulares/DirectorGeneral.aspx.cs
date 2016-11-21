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
using System.Data.SqlClient;
using Telerik.Web.UI;
using MessagingToolkit.QRCode;
using MessagingToolkit.QRCode.Codec;
using System.Drawing;
using System.Net;
using System.Windows.Forms;

public partial class DirectorGeneral : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {      
    }
    protected void borrarCondiciones()
    {         
        if (Session["Permiso"].ToString() == "profesional")
        {
            Response.Redirect("http://planodigital.tigre.gov.ar/index.html");
        }

        if (FileExplorerObrasParticulares.Visible == true)
        {
            RadToolBar toolBar = FileExplorerObrasParticulares.ToolBar;           
            int i = 0;
            while (i < toolBar.Items.Count)
            {             
                if (toolBar.Items[i].Value == "Upload")
                {
                    toolBar.Items.RemoveAt(i);
                    continue; 
                }
                else if (toolBar.Items[i].Value == "Rename")
                {
                    toolBar.Items.RemoveAt(i);
                    continue; 
                }
                i++;
            }
            RadContextMenu gridContextMenu = FileExplorerObrasParticulares.GridContextMenu;
            i = 0;
            while (i < gridContextMenu.Items.Count)
            {
                 if (gridContextMenu.Items[i].Value == "Upload")
                {
                    gridContextMenu.Items.RemoveAt(i);
                    continue;
                }
                else if (gridContextMenu.Items[i].Value == "Rename")
                {
                    gridContextMenu.Items.RemoveAt(i);
                    continue;
                }
                i++;
            }            
            RadMenuItem item = new RadMenuItem("Descargar");
            item.PostBack = false;
            item.Value = "Descargar";
            gridContextMenu.Items.Add(item);
        }
    }
    protected void RadGrid1_RowCommand(Object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "DJ")
        {
            int index = e.Item.ItemIndex;
            String row = RadGrid1.MasterTableView.Items[index]["nroCuenta"].Text;
            nuevaPagina("./Formulario.aspx?cuenta=" + row + "&validator=4721fsds12!7S");
        }
    }
    protected void gvwCuentas_SelectedIndexChanged(object sender, EventArgs e)
    {      
        string variable = gvwCuentas.SelectedRow.Cells[2].Text;
        FileExplorerObrasParticulares.TreeView.Nodes.Clear();
        FileExplorerObrasParticulares.Configuration.ViewPaths = new String[] { "~/Archivos/" + variable};
        FileExplorerObrasParticulares.Configuration.UploadPaths = new String[] { "~/Archivos/" + variable };
        FileExplorerObrasParticulares.Configuration.DeletePaths = new String[] { "~/Archivos/" + variable };      
    }

    protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {        
        string variable = RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["Cuenta"].Text;
        string variableExpediente = RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["Expediente"].Text;
        string estadoActual = RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["Estado"].Text;
        Session["cuenta"] = variable;
        Session["expediente"] = variableExpediente;
        lblSelec.Text = "SE SELECCIONO LA CUENTA NRO " + variable;
        try
        {
            FileExplorerObrasParticulares.TreeView.Nodes.Clear();
        }
        catch { }
        FileExplorerObrasParticulares.Configuration.ViewPaths = new String[] { "~/Archivos/" + variable };
        FileExplorerObrasParticulares.Configuration.UploadPaths = new String[] { "~/Archivos/" + variable };
        FileExplorerObrasParticulares.Configuration.DeletePaths = new String[] { "~/Archivos/" + variable };      
        FileExplorerObrasParticulares.Visible = false;
        imbPlanchetaCatastral.Enabled = true;
        imbExplorar.Enabled = true;
        imgConstanciaQR.Enabled = true;
        imbHistorialCorreo.Enabled = true;
        imbVolverActivo.Enabled = true;
        imbHistorialEstados.Enabled = true;
        ImbSubirArchivo.Enabled = true;        
        ImageButton2.Enabled = true;
        if (estadoActual == "Inspeccion de Obra")
        {
            imbRecibirInspeccion.Visible = true;
            imbRecibirInspeccion.Enabled = true;
            imbClausurar.Visible = true;
            imbClausurar.Enabled = true;
            imbEnviarInspeccion.Visible = false;
        }
        else
        {
            imbEnviarInspeccion.Visible = true;
            imbEnviarInspeccion.Enabled = true;
            imbRecibirInspeccion.Visible = false;
            imbClausurar.Visible = false;
        }       
    }
    
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./Comunicacion.aspx?origen=3");
    }
    protected void imbExplorar_Click(object sender, ImageClickEventArgs e)
    {
        FileExplorerObrasParticulares.Visible = true;
        borrarCondiciones();
    }
    protected void ImbSubirArchivo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./Subir_Archivo.aspx?origen=3");
    }
    protected void nuevaPagina(string url)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "otroTag('" + url + "');", true);
    }
    protected void imbPlanchetaCatastral_Click(object sender, ImageClickEventArgs e)
    {
        string variable;
        variable = Session["cuenta"].ToString();
        DataSet ds = new DataSet();
        Funciones objeto = new Funciones();
        objeto.agregar_tabla_datasetTigre("Select * from WEBOP_V_AUT_Inmuebles where Cuenta='" + variable + "'", "WEBOP_V_AUT_Inmuebles", ds);
        abrirPlancheta(ds);
    }
    protected void abrirPlancheta(DataSet ds)
    {
        string sDibujo;
        string strDirectorio = "";
        string sRuta = "//master/Usuarios/GRAFICOS/CATASTRO/";
        string strLManza = "";
        string sSec;
        int iCirc;
        int ICodi;
        long IManzana = 0;
        string sLetraManzana = "";
        iCirc = Convert.ToInt32(ds.Tables[0].Rows[0][2].ToString());
        sSec = ds.Tables[0].Rows[0][3].ToString();
        ICodi = Convert.ToInt32(ds.Tables[0].Rows[0][4].ToString());
        switch (Convert.ToInt32(ds.Tables[0].Rows[0][4].ToString()))
        {
            case 1:
                IManzana = Convert.ToInt64(ds.Tables[0].Rows[0][5].ToString());
                sLetraManzana = ds.Tables[0].Rows[0][6].ToString();
                break;
            case 2:
                IManzana = Convert.ToInt64(ds.Tables[0].Rows[0][7].ToString());
                sLetraManzana = ds.Tables[0].Rows[0][8].ToString();
                break;
            case 3:
                IManzana = Convert.ToInt64(ds.Tables[0].Rows[0][11].ToString());
                sLetraManzana = ds.Tables[0].Rows[0][12].ToString();
                break;
            case 4:
                IManzana = Convert.ToInt64(ds.Tables[0].Rows[0][9].ToString());
                sLetraManzana = ds.Tables[0].Rows[0][10].ToString();
                break;
            case 5:
                IManzana = Convert.ToInt64(ds.Tables[0].Rows[0][11].ToString());
                sLetraManzana = ds.Tables[0].Rows[0][12].ToString();
                break;
            case 6:
                IManzana = Convert.ToInt64(ds.Tables[0].Rows[0][11].ToString());
                sLetraManzana = ds.Tables[0].Rows[0][12].ToString();
                break;
            case 7:
                IManzana = Convert.ToInt64(ds.Tables[0].Rows[0][5].ToString());
                sLetraManzana = ds.Tables[0].Rows[0][9].ToString();
                break;
            case 8:
                IManzana = Convert.ToInt64(ds.Tables[0].Rows[0][7].ToString());
                sLetraManzana = ds.Tables[0].Rows[0][9].ToString();
                break;
        }

        string iC;
        string iCo;
        string iM;
        if (Convert.ToString(iCirc).Length == 0)
        {
            iC = "0";
        }
        else
        {
            iC = Convert.ToString(iCirc);
        }
        if (Convert.ToString(ICodi).Length == 0)
        {
            iCo = "0";
        }
        else
        {
            iCo = Convert.ToString(ICodi);
        }       
        switch (Convert.ToString(IManzana).Length)
        {
            case 0: iM = "0000";
                break;
            case 1:
                iM = "000" + Convert.ToString(IManzana);
                break;
            case 2:
                iM = "00" + Convert.ToString(IManzana);
                break;
            case 3:
                iM = "0" + Convert.ToString(IManzana);
                break;
            case 4:
                iM = Convert.ToString(IManzana);
                break;
            default:
                iM = Convert.ToString(IManzana);
                break;
        }
        switch (Convert.ToInt32(iC))
        {
            case 1:
                strDirectorio = "PRIMERA/";
                break;
            case 2:
                strDirectorio = "SEGUNDA/";
                break;
            case 3:
                strDirectorio = "TERCERA/";
                break;
            case 4:
                strDirectorio = "CUARTA/";
                break;
        }

        if ((Convert.ToInt32(iCo) == 7) || (Convert.ToInt32(iCo) == 8) || (Convert.ToInt32(iCo) == 6)) //ICodi
        {            
            switch (sLetraManzana)
            {
                case "1":
                    strLManza = "A";
                    break;
                case "2":
                    strLManza = "B";
                    break;
                case "3":
                    strLManza = "C";
                    break;
                case "4":
                    strLManza = "E";
                    break;
                case "5":
                    strLManza = "F";
                    break;
                case "A":
                    strLManza = "A";
                    break;
                case "B":
                    strLManza = "B";
                    break;
                case "C":
                    strLManza = "C";
                    break;
                case "D":
                    strLManza = "E";
                    break;
                case "F":
                    strLManza = "F";
                    break;
            }
        }
        strDirectorio = strDirectorio + iC + sSec.Trim() + "/";
        sDibujo = iC + sSec.ToUpper() + iCo + iM + strLManza;     
        string RutaFinal = sRuta + strDirectorio + sDibujo + ".dwg";        
        try
        {
            string strURL = "";
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;            
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + sDibujo + ".dwg\"");            
            byte[] data = req.DownloadData(RutaFinal);            
            response.BinaryWrite(data);
            response.End();
        }
        catch (Exception ex)
        {
        }
    }
    protected void imgConstanciaQR_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["Cuenta"].Text;
            Response.Redirect("./Constancia.aspx?res=233sqw!&origen=3&cuenta=" + carpeta + "&artic=jsnf5376h23");
        }
        catch
        {
        }
    }
    protected void imbHistorialCorreo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./HistorialCorreoGeneral.aspx?origen=3&validator=874564fsda!$");
    }
    protected void imbVerDedechos_Click(object sender, ImageClickEventArgs e)
    {
        String row = Session["cuenta"].ToString();
        nuevaPagina("./Formulario.aspx?cuenta=" + row + "&validator=4721fsds12!7S");
    }   
    protected void imbHistorialArchivos_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./HistorialArchivosGeneral.aspx?origen=3&validator=874564fsda!$");
    }
    protected void imbRegistrarPlanos_Click(object sender, ImageClickEventArgs e)
    {        
        Response.Redirect("DirectorOP.aspx");
    }
    protected void imbVincularVerificador_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./AsociarVerificador.aspx?origen=3");
    }
    protected void imbVincularProfesional_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./AsociarProfesionalMunicipio.aspx?origen=3");
    }
    protected void ImbExpedientes_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./AsociarExpediente.aspx?origen=3");
    }
    protected void imbVolverActivo_Click(object sender, ImageClickEventArgs e)
    {
        String cuenta = Session["cuenta"].ToString();
        string persona = Session["NroDocumentoMunicipio"].ToString();
        string ip = Request.UserHostAddress;
        string estado="1280";
        Funciones objeto = new Funciones();
        try
        {
            objeto.agregarEstadoCarpeta(cuenta, estado, persona, ip);
            lblSelec.Text = "Se logro cambiar el estado a ACTIVO a la cuenta " + cuenta + ".";
            lblSelec.Visible = true;
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "ACTIVO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Activo. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "ACTIVO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Activo. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch 
        {
            lblSelec.Text = "No se logro pasar al estado ACTIVO a la cuenta " + cuenta + ".";
            lblSelec.Visible = true;
        }
    }
    protected void imbDeclaracionJurada_Click(object sender, ImageClickEventArgs e)
    {
        nuevaPagina("./Documentos/FORMULARIO DECLARACION JURADA  0905-11-13.pdf");
    }
    protected void imbPlanillaObservacion_Click(object sender, ImageClickEventArgs e)
    {
        nuevaPagina("./Documentos/FORMULARIO DECLARACION JURADA  05-11-13 Anexo II.pdf");
    }
    protected void imbGenerarQr_Click(object sender, ImageClickEventArgs e)
    {
        Int32 control = 0;
        try
        {
            string carpeta = RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["Cuenta"].Text;
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "1287";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                guardarQR(carpeta);
            }
            catch
            {
                lblSelec.Text = "Se produjo un error inesperado al generar el Archivo QR.";
                lblSelec.Visible = true;
            }
            control = 1;

        }
        catch
        {
            lblSelec.Text = "Se produjo un error inesperado y no se logro realizar la verificación del plano, vuelva a intentarlo";
            lblSelec.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            try
            {
                enviarCorreo("ObrasParticularesDigital@tigre.gov.ar", "PPisani@tigre.gov.ar");
            }
            catch
            {
                lblSelec.Text = "El plano fue verificado. Se produjo un error al intentar enviar el correo al Dir. Obras Particulares.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])));
            }
            catch
            {
                lblSelec.Text = "El plano fue verificado. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])));
            }
            catch
            {
                lblSelec.Text = "El plano fue verificado. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
            lblSelec.Text = "El plano fue verificado con exito.";
            lblSelec.Visible = true;
        }
    }
    protected void imbActivarProfesionales_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./ActivarProfesionales.aspx?origen=3");
    }
    protected void guardarQR(string cuenta)
    {
        string URL = "http://planodigital.tigre.gov.ar/verificar.aspx?cuenta=" + cuenta + "";
        string ruta = Server.MapPath("/Archivos/qr/" + cuenta + ".png");
        QRCodeEncoder encoder = new QRCodeEncoder();
        Bitmap qrcode = encoder.Encode(URL);
        qrcode.Save(ruta);
        lblSelec.Text = ruta;
    }
    protected void enviarCorreo(string origen, string destino)
    {
        int ValorRetorno;        
        string Asunto;
        string mensaje;
        Funciones Objeto = new Funciones();
        string cuenta;
        cuenta = Session["cuenta"].ToString();
        Asunto = "Archivo Subido - SiDOP - Municipio de Tigre";        
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>Se realizo la verificación del expediente presentado por la cuenta municipal " + cuenta + ". Queda en espera de su aprobación. <div /><p> No responda este e-mail, Es un envio automático</p> <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";   
        ValorRetorno = Objeto.EnviarMail(origen, destino, mensaje, Asunto);   
    }
    protected void enviarCorreo2(string origen, string destino, string estado)
    {
        int ValorRetorno;    
        string Asunto;
        string mensaje;
        Funciones Objeto = new Funciones();
        string cuenta;
        cuenta = Session["cuenta"].ToString();
        Asunto = "Archivo Subido - SiDOP - Municipio de Tigre";       
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>Se actualizó el estado de su expediente presentado por la cuenta municipal " + cuenta + ". Su nuevo estado es " + estado + ". <div /><p> No responda este e-mail, Es un envio automático</p> <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";      
        ValorRetorno = Objeto.EnviarMail(origen, destino, mensaje, Asunto); 
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
    protected string obtener_correo_Propietario(string cuenta)
    {
        Funciones objeto = new Funciones();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        objeto.agregar_tabla_dataset("SELECT PropietarioxCuenta.mail FROM PropietarioxCuenta WHERE PropietarioxCuenta.nroCuenta = '" + cuenta + "'", "PropietarioxCuenta", ds);
        dt = ds.Tables[0];
        return dt.Rows[0]["mail"].ToString();
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem dataItem = (GridDataItem)e.Item;
            TableCell myCell = dataItem["Fecha Estado"];
            TableCell estado = dataItem["Estado"];
            DateTime hoy = DateTime.Today;
            DateTime fEstado = Convert.ToDateTime(myCell.Text);
            Int32 diferencia = calcularDias(fEstado, hoy);
            if ((diferencia > 15))
            {               
                dataItem.BackColor = System.Drawing.Color.Tomato;
            }
            else
            {
                if ((diferencia > 5))
                {
                    dataItem.BackColor = System.Drawing.Color.Khaki;
                }
                else
                {
                    dataItem.BackColor = System.Drawing.Color.LightGreen;
                }
            }

        }
    }
    private int calcularDias(DateTime oldDate, DateTime newDate)
    {  
        TimeSpan ts = newDate - oldDate;
        return ts.Days;
    }
    protected void ArchivosVisador_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./ReporteArchivosOP.aspx?origen=3");
    }
    protected void imgbDemoraEstado_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./ReporteVariacionTiempo.aspx?origen=3");
    }
    protected void imbExportar_Click(object sender, ImageClickEventArgs e)
    {
        RadGrid1.MasterTableView.ExportToExcel();
    }
    protected void imgbReporteDensidades_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./ReporteDensidades.aspx?origen=3");
    }
    protected void imbEnvioMasivoCorreos_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("./ComunicacionProfesionales.aspx?origen=3");
    }
    protected void imbEnviarInspeccion_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "0007";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "INSPECCION DE OBRA");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Inspección de Obra. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "INSPECCION DE OBRA");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Inspección de Obra. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "El plano no fue enviado a Inspección de Obra a causa de un error.";
            lblSelec.Visible = true;
        }
    }
    protected void imbRecibirInspeccion_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "0008";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "ACTIVO - INSPECCIONADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Activo-Inspeccionado. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "ACTIVO - INSPECCIONADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Activo-Inspeccionado. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "El plano no fue devuelvo a Obras Particulares a causa de un error.";
            lblSelec.Visible = true;
        }
    }
    protected void imbClausurar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "0009";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "PLANO CLAUSURADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Clausurado. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "PLANO CLAUSURADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Clausurado. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "El plano no fue Clausurado a causa de un error.";
            lblSelec.Visible = true;
        }
    }
    protected void imbVerificado_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "1287";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "PLANO VERIFICADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Verificado. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "PLANO VERIFICADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Verificado. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "El plano no fue Verificado a causa de un error.";
            lblSelec.Visible = true;
        }
    }
    protected void imbCaducar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "1312";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "PLANO CADUDADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Caducado. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "PLANO CADUCADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Caducado. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "El plano no fue Caducado a causa de un error.";
            lblSelec.Visible = true;
        }
    }
    protected void imbSuspender_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "1310";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "PLANO SUSPENDIDO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Suspendido. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "PLANO SUSPENDIDO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Suspendido. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "El plano no fue Suspendido a causa de un error.";
            lblSelec.Visible = true;
        }
    }
    protected void imbVincularWEB_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "0006";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "VINCULADO WEB");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Vinculado Web. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "VINCULADO WEB");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Vinculado Web. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "Al plano no se le pudo cambiar el estado a VINCULADO-WEB.";
            lblSelec.Visible = true;
        }
    }
    protected void imbCambiarAprobado_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "1308";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "PLANO APROBADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Aprobado. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "PLANO APROBADO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Aprobado. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "Al plano no se le pudo cambiar el estado a Aprobado.";
            lblSelec.Visible = true;
        }
    }
    protected void imbcambiarInscripto_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "0002";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])),"PLANO INSCRIPTO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Inscripto. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])),"PLANO INSCRIPTO");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Plano Inscripto. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "Al plano no se le pudo cambiar el estado a INSCRIPTO.";
            lblSelec.Visible = true;
        }
    }
    protected void imbPermisoObra_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "0003";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])),"PERMISO DE OBRA");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Permiso de Obra. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])),"PERMISO DE OBRA");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Permiso de Obra. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "Al plano no se le pudo cambiar el estado a PERMISO DE OBRA.";
            lblSelec.Visible = true;
        }
    }
    protected void imbPrimeraObs_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "1302";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])),"PRIMERA OBSERVACION");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Primera Observación. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])),"PRIMERA OBSERVACION");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Primera Observación. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "Al plano no se le pudo cambiar el estado a PRIMER OBSERVACION.";
            lblSelec.Visible = true;
        }
    }
    protected void imbSegundaObs_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "1304";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])),"SEGUNDA OBSERVACION");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Segunda Observación. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])),"SEGUNDA OBSERVACION");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Segunda Observación. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "Al plano no se le pudo cambiar el estado a SEGUNDA OBSERVACION.";
            lblSelec.Visible = true;
        }
    }
    protected void imbTerceraObv_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "1306";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");            
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])),"TERCERA OBSERVACION");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Tercera Observación. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])),"TERCERA OBSERVACION");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Tercera Observación. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "Al plano no se le pudo cambiar el estado a TERCER OBSERVACION.";
            lblSelec.Visible = true;
        }
    }
    protected void imbHistorialEstados_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./HistorialEstadosCuenta.aspx?origen=3&validator=874564fsda!$");
    }
    protected void imbCorreccionObv_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "0013";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "MAS DE TERCERA OBSERVACION");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Mas de Tercera Observación. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "MAS DE TERCERA OBSERVACION");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a más de Tercera Observación. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "Al plano no se le pudo cambiar el estado a MAS DE TERCER OBSERVACION.";
            lblSelec.Visible = true;
        }
    }
    protected void imbEnviarComision_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = Session["cuenta"].ToString();
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string estado = "1281";
            string observacion = persona;
            string ip = Request.UserHostAddress;
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])), "ENVIO A COMISIÓN");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Comisión. Se produjo un error al intentar enviar el correo al profesional.";
                lblSelec.Visible = true;
            }
            try
            {
                enviarCorreo2("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])), "ENVIO A COMISIÓN");
            }
            catch
            {
                lblSelec.Text = "El plano fue enviado a Comisión. Se produjo un error al intentar enviar el correo al propietario.";
                lblSelec.Visible = true;
            }
        }
        catch
        {
            lblSelec.Text = "Al plano no se le pudo cambiar el estado a ENVIO A COMISIÓN.";
            lblSelec.Visible = true;
        }
    }
}
