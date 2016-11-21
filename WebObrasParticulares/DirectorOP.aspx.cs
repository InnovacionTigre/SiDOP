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
using System.Net;


using MessagingToolkit.QRCode;
using MessagingToolkit.QRCode.Codec;
using System.Drawing;


public partial class DirectorOP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {       
    }
    protected void borrarCondiciones()
    {
        if (FileExplorerObrasParticulares.Visible == true)
        {
            RadToolBar toolBar = FileExplorerObrasParticulares.ToolBar;           
            int i = 0;
            while (i < toolBar.Items.Count)
            {
                if (toolBar.Items[i].Value == "Delete")
                {
                    toolBar.Items.RemoveAt(i);
                    continue;
                }
                else if (toolBar.Items[i].Value == "Upload")
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
                if (gridContextMenu.Items[i].Value == "Delete")
                {
                    gridContextMenu.Items.RemoveAt(i);
                    continue;
                }
                else if (gridContextMenu.Items[i].Value == "Upload")
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
        ImbSubirArchivo.Enabled = true; 
        ImageButton1.Enabled = true;
        ImageButton2.Enabled = true;
        imbRechazar.Enabled = true;     
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Int32 control = 0;
        try
        {
            string usuario = Session["usuario"].ToString();
            if (usuario == "11732" || usuario == "13057")
            {
                string carpeta = RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["Cuenta"].Text;
                string estado = "1316";
                string persona = Session["NroDocumentoMunicipio"].ToString();
                string observacion = persona;
                DateTime fecha = DateTime.Now;
                string ip = Request.UserHostAddress;            
                Funciones objeto = new Funciones();
                objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
                control = 1;
            }
            else{}
        }
        catch
        {
            lblCartel.Text = "Se produjo un error al registrar el plano, vuelva a intentarlo";
            lblCartel.Visible = true;
            control = 0;
        }
        if (control == 1)
        {
            try
            {
                enviarCorreo("ObrasParticularesDigital@tigre.gov.ar", "TasasDigital@tigre.gov.ar");
            }
            catch
            {
                lblCartel.Text = "El plano fue REGISTRADO. Se produjo un error al intentar enviar el correo a TasasDigital.";
                lblCartel.Visible = true;
            }
            try
            {
                enviarCorreo("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_profesional(Convert.ToString(Session["cuenta"])));
            }
            catch
            {
                lblCartel.Text = "El plano fue REGISTRADO. Se produjo un error al intentar enviar el correo al profesional.";
                lblCartel.Visible = true;
            }
            try
            {
                enviarCorreo("ObrasParticularesDigital@tigre.gov.ar", obtener_correo_Propietario(Convert.ToString(Session["cuenta"])));
            }
            catch
            {
                lblCartel.Text = "El plano fue REGISTRADO. Se produjo un error al intentar enviar el correo al propietario.";
                lblCartel.Visible = true;
            }
            lblCartel.Text = "El plano fue REGISTRADO con exito.";
            lblCartel.Visible = true;
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
        Response.Redirect("./CorreoProfesional.aspx?origen=3");
    }
    protected void imbVerDedechos_Click(object sender, ImageClickEventArgs e)
    {
        String row = Session["cuenta"].ToString();
        nuevaPagina("./Formulario.aspx?cuenta=" + row + "&validator=4721fsds12!7S");
    }
    protected void imbMovimientosExpedientes_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./DirectorGeneral.aspx");
    }
    protected void imbHistorialArchivos_Click(object sender, ImageClickEventArgs e)
    {
    }
    protected void imbRechazar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["Cuenta"].Text;
            string estado = "1280";
            string persona = Session["NroDocumentoMunicipio"].ToString();
            string observacion = persona;
            DateTime fecha = DateTime.Now;
            string ip = Request.UserHostAddress;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "', '" + ip + "')");
        }
        catch
        {
            lblCartel.Text = "Se produjo un error al rechazar el plano Registrado";
            lblCartel.Visible = true;
        }
    }
    protected void enviarCorreo(string origen, string destino)
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
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br> SE REGISTRO EL PLANO CORRESPONDIENTE A LA CUENTA " + cuenta + ", EXPEDIENTE " + expediente + ". <div /><p> No responda este e-mail, Es un envio automático</p> <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";       
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
    protected void imbDeclaracionJurada_Click(object sender, ImageClickEventArgs e)
    {
    }
    protected void imbPlanillaObservacion_Click(object sender, ImageClickEventArgs e)
    {
    }
    protected void imbGenerarQr_Click(object sender, ImageClickEventArgs e)
    {
    }
    protected void imbActivarProfesionales_Click(object sender, ImageClickEventArgs e)
    {
    }
}
