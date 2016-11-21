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
using System.IO;
using System.Windows.Forms;
using Telerik.Web.UI;

public partial class AsociarProfesional : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void cargaDeuda()
    {
        String deuda="0";
        try
        {
            deuda = Session["deuda"].ToString();           
        }
        catch { }
    
    if (Convert.ToDouble(deuda) > 0)
    {
        lblDeuda.Text = "SR. CONTRIBUYENTE SU CUENTA MUNICIPAL PRESENTA UNA DEUDA DE $" + deuda + ", LA CUAL PUEDE LLEGAR A IMPEDIRLE EL INICIO DE TRAMITE CON EL MUNICIPIO.";
        lblDeuda.Visible = true;
    }
    }
    protected void gvwProfesionales_SelectedIndexChanged(object sender, EventArgs e)
    {        
    }
    protected void btnAsociar_Click(object sender, EventArgs e)
    {
        GrabarProfesionalXcuenta();
    }
    protected void GrabarProfesionalXcuenta()
    {
        try
        {            
            SqlCommand comando = new SqlCommand();
            Funciones Objeto = new Funciones();            
            comando = Objeto.ArmarParametrosProfesionalesxCuenta(comando, RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["nroDocumento"].Text, Convert.ToString(Session["NroCuenta"]));
            Objeto.EjecutarSp("SPagregarProfesionalXCuenta", comando);            
            Response.Write(@"<script language='javascript'>alert('Se realizo la asignación del profesional \n');</script>");
            actualizarVista();
        }
        catch
        {
            Response.Write(@"<script language='javascript'>alert('Se produjo un error vuelva a intentarlo \n. Recuerde seleccionar un profesional antes de asignarlo');</script>");
        }        
    }    
    protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
    }
    protected void ImbDesvincular_Click(object sender, ImageClickEventArgs e)
    {
        SqlCommand comando = new SqlCommand();
        Funciones Objeto = new Funciones();       
        comando = Objeto.ArmarParametrosProfesionalesxCuenta(comando, RdProfesionalesxcuenta.MasterTableView.Items[RdProfesionalesxcuenta.SelectedIndexes[0].ToString()]["nroDocumento"].Text, Convert.ToString(Session["NroCuenta"]));
        Objeto.EjecutarSp("SPeliminarProfesionalXCuenta", comando);
        actualizarVista();
    }
    protected void actualizarVista()
    {
        Response.Redirect("./AsociarProfesional.aspx");
    }
}
