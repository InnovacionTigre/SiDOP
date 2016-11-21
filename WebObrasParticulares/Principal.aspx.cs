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

public partial class Principal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
    }
    protected void cargarProfesional()
    { 
     Funciones objeto =new Funciones();
     DataSet  ds = new DataSet();
     DataTable dt =new DataTable();
     string nroDocumentoProfesional = Session["nroDocumentoProfesional"].ToString();
     objeto.agregar_tabla_dataset("Select apellido,nombre, telefono, mail from Personas where nroDocumento='" + nroDocumentoProfesional + "'", "personas", ds);
     dt = ds.Tables[0];
     lblProfesional.Text = dt.Rows[0][0].ToString() + ", " + dt.Rows[0][1].ToString() + " - Telefono: " + dt.Rows[0][2].ToString() + " - Correo: " + dt.Rows[0][3].ToString();
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
    protected void gvwCuentas_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadGrid1.Visible = false;
        try
        {
            string variable = gvwCuentas.SelectedRow.Cells[2].Text;
            lblSelec.Text = "SE SELECCIONO LA CUENTA NRO " + variable;
            FileExplorerObrasParticulares.TreeView.Nodes.Clear();
            FileExplorerObrasParticulares.Configuration.ViewPaths = new String[] { "~/Archivos/" + variable };
            FileExplorerObrasParticulares.Configuration.UploadPaths = new String[] { "~/Archivos/" + variable };
            FileExplorerObrasParticulares.Configuration.DeletePaths = new String[] { "~/Archivos/" + variable };
            Session["cuenta"] = variable;//prueba para email
            FileExplorerObrasParticulares.Visible = false;
            ImageButton1.Enabled = true;
            imbExplorar.Enabled = true;
            ImbSubirArchivo.Enabled = true;
            imbCartelObra.Enabled = true;
            imbDatosCuenta.Enabled = true;
            imbPlancheta.Enabled = true;
            borrarCondiciones();
            actualizarArbol();
        }
        catch { }
    }
   
    protected void rgCuentaProfesional_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadGrid1.Visible = false;        
        try
        {
            string variable = rgCuentaProfesional.MasterTableView.Items[rgCuentaProfesional.SelectedIndexes[0].ToString()]["Nro de cuenta municipal"].Text;
            string estado_actual = rgCuentaProfesional.MasterTableView.Items[rgCuentaProfesional.SelectedIndexes[0].ToString()]["Estado"].Text; 
            lblSelec.Text = "SE SELECCIONO LA CUENTA NRO " + variable + " : "+ estado_actual ;
            FileExplorerObrasParticulares.TreeView.Nodes.Clear();
            FileExplorerObrasParticulares.Configuration.ViewPaths = new String[] { "~/Archivos/" + variable };
            FileExplorerObrasParticulares.Configuration.UploadPaths = new String[] { "~/Archivos/" + variable };
            FileExplorerObrasParticulares.Configuration.DeletePaths = new String[] { "~/Archivos/" + variable };
            Session["cuenta"] = variable;
            FileExplorerObrasParticulares.Visible = false;
            imbDatosCuenta.Enabled = true;
            imbPlancheta.Enabled = true;
            imbExplorar.Enabled = true;           
            imbCartelObra.Enabled  = true;             
            imbConstanciaInscripcion.Enabled = true;
            imgHistorialCorreo.Enabled = true;
            imbDeclaracionJurada.Enabled = true;
            imbLiquidarDerechos.Enabled = true;
            ImbSubirArchivo.Enabled = true;
            ImageButton1.Enabled = true;
            borrarCondiciones();
            actualizarArbol();
        }
        catch { }
    }
    protected void gvwCuentas_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        string  variable;
        if (e.CommandName == "DJ")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvwCuentas.Rows[index];
            variable = Convert.ToString(gvwCuentas.Rows[index].Cells[2].Text);          
            Session["cuenta"] = variable;
            RadGrid1.Visible = true;
        }
        if (e.CommandName == "Plancheta")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvwCuentas.Rows[index];
            variable = Convert.ToString(gvwCuentas.Rows[index].Cells[2].Text);
            DataSet ds = new DataSet();
            Funciones objeto = new Funciones ();
            objeto.agregar_tabla_datasetTigre("Select * from WEBOP_V_AUT_Inmuebles where Cuenta='" + variable + "'", "WEBOP_V_AUT_Inmuebles", ds);       
            abrirPlancheta(ds);
        }
        if (e.CommandName == "declaracion")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvwCuentas.Rows[index];
            variable = Convert.ToString(gvwCuentas.Rows[index].Cells[2].Text);     
            nuevaPagina("./Documentos/FORMULARIO DECLARACION JURADA  0905-11-13.pdf");          
        }
        if (e.CommandName == "Derechos")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvwCuentas.Rows[index];
            variable = Convert.ToString(gvwCuentas.Rows[index].Cells[2].Text);
            nuevaPagina("Formulario.aspx?cuenta=" + variable +"&validator=4784sds12!7S");            
        }
        if (e.CommandName == "constancia")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvwCuentas.Rows[index];
            variable = Convert.ToString(gvwCuentas.Rows[index].Cells[2].Text);
            Response.Redirect("Constancia.aspx?origen=1&cuenta=" + variable);    
        }
    }
    protected void abrirPlancheta(DataSet ds)
    { 
        string sDibujo;
        string strDirectorio ="";
        string sRuta="//master/Usuarios/GRAFICOS/CATASTRO/";
        string strLManza="";
        string sSec;
        int iCirc;
        int ICodi;
        long IManzana =0;
        string sLetraManzana=""; 
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
        if (Convert.ToString(iCirc).Length== 0) 
        {
            iC="0";
        }
            else
        {
        iC=Convert.ToString(iCirc);
        }
        if (Convert.ToString(ICodi).Length==0)
        {
            iCo="0";
        }
        else
        {
            iCo=Convert.ToString(ICodi);
        }
        switch (Convert.ToString(IManzana).Length)
        {
            case 0: iM = "0000";
                break;
            case 1: 
                iM="000" + Convert.ToString(IManzana);
                break;
            case 2:
                iM="00" + Convert.ToString(IManzana);
                break;
            case 3:
                iM="0" + Convert.ToString(IManzana);
                break;
            case 4:
                iM=Convert.ToString(IManzana);
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./Comunicacion.aspx?origen=1");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpContext.Current.Response.Redirect("Formulario.aspx");
    }
    protected void nuevaPagina(string url)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "otroTag('" + url + "');", true);
    }
    protected void actualizarArbol()
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "actualizarfile();", false);    
    }
    protected void imbExplorar_Click(object sender, ImageClickEventArgs e)
    {
        FileExplorerObrasParticulares.Visible = true;
        borrarCondiciones();
    }
    protected void ImbSubirArchivo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./Subir_Archivo.aspx?origen=1");
    }
    protected void imbDatosCuenta_Click(object sender, ImageClickEventArgs e)
    {
        RadGrid1.Visible = true;
    }
    protected void imbCartelObra_Click(object sender, ImageClickEventArgs e)
    {
        string variable = rgCuentaProfesional.MasterTableView.Items[rgCuentaProfesional.SelectedIndexes[0].ToString()]["Nro de cuenta municipal"].Text;
        string estado_actual = rgCuentaProfesional.MasterTableView.Items[rgCuentaProfesional.SelectedIndexes[0].ToString()]["Estado"].Text;
        if ((estado_actual == "Registrado") || (estado_actual == "REGISTRADO") || (estado_actual == "1316") || (estado_actual == "0003") || (estado_actual == "Permiso de Obra") || (estado_actual == "PERMISO DE OBRA") || (estado_actual == "PERMISO AUTOMÁTICO DE OBRA"))
        {
            Response.Redirect("Constancia.aspx?origen=1&cuenta=" + variable);
        }
        else 
        {
            string texto = "Su expediente de obra no se encuentra registrado, no podrá visualizar el cartel de obra.";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "alerta('" + texto + "');", true);
        }
    }
    protected void imbPlancheta_Click(object sender, ImageClickEventArgs e)
    {
        string variable = rgCuentaProfesional.MasterTableView.Items[rgCuentaProfesional.SelectedIndexes[0].ToString()]["Nro de cuenta municipal"].Text;
        DataSet ds = new DataSet();
        Funciones objeto = new Funciones();
        objeto.agregar_tabla_datasetTigre("Select * from WEBOP_V_AUT_Inmuebles where Cuenta='" + variable + "'", "WEBOP_V_AUT_Inmuebles", ds);
        abrirPlancheta(ds);
    }
    protected void ImbLiquidarDerechos_Click(object sender, ImageClickEventArgs e)
    {
        string variable = rgCuentaProfesional.MasterTableView.Items[rgCuentaProfesional.SelectedIndexes[0].ToString()]["Nro de cuenta municipal"].Text;
        nuevaPagina("Formulario.aspx?cuenta=" + variable + "&validator=4784sds12!7S");
    }
    protected void imbDeclaracionJurada_Click(object sender, ImageClickEventArgs e)
    {      
        string variable = rgCuentaProfesional.MasterTableView.Items[rgCuentaProfesional.SelectedIndexes[0].ToString()]["Nro de cuenta municipal"].Text;
        nuevaPagina("./Documentos/FORMULARIO DECLARACION JURADA  0905-11-13.pdf");
    }
    protected void imgHistorialCorreo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./CorreoProfesional.aspx?origen=1");
    }
    protected void imbConstanciaInscripcion_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./ConstanciaProfesional.aspx");
    }
    protected void imbLiquidarSellado_Click(object sender, ImageClickEventArgs e)
    {
    }
    protected void imbDatosObra_Click(object sender, ImageClickEventArgs e)
    {
    }
    protected void rgCuentaProfesional_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
    {
    }
    protected void ImbAvisoInicioObra_Click(object sender, ImageClickEventArgs e)
    {
        nuevaPagina("./Documentos/Formulario_aviso de inicio deobra.pdf");
    }
    protected void ImbSolicitudInspeccion_Click(object sender, ImageClickEventArgs e)
    {
        nuevaPagina("./Documentos/Formulario_solicitud deinspeccion.pdf");
    }
}
