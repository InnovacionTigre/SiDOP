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

public partial class AsociarProfesionalMunicipio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
            comando = Objeto.ArmarParametrosProfesionalesxCuenta (comando, RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["nroDocumento"].Text, RadGrid2.MasterTableView.Items[RadGrid2.SelectedIndexes[0].ToString()]["idCarpeta"].Text);
            Objeto.EjecutarSp("SPagregarProfesionalXCuenta", comando);           
            Response.Write(@"<script language='javascript'>alert('Se realizo la asignación del profesional \n');</script>");
            actualizarVista();
    {
        string origen = Request.QueryString["origen"];
        Response.Redirect("./AsociarProfesionalMunicipio.aspx?origen=" + origen);
    }
        }
        catch
        {
            Response.Write(@"<script language='javascript'>alert('No se logro completar la vinculación, compruebe que no se encuentre relacionada la cuenta al profesional con anterioridad \n. Recuerde seleccionar un profesional antes de asignarlo');</script>");
        }        
    }
    
    protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
    }
    protected void imbVolver_Click(object sender, ImageClickEventArgs e)
    {
        string origen = Request.QueryString["origen"];
        switch (origen)
        {
            case "1":
                Response.Redirect("./Principal.aspx");
                break;
            case "2":
                Response.Redirect("./ResponsableOP.aspx");
                break;
            case "3":
                Response.Redirect("./DirectorGeneral.aspx");
                break;
            case "4":
                Response.Redirect("./ResponsableMunicipio.aspx");
                break;
        }
    }
    protected void ImbDesvincular_Click(object sender, ImageClickEventArgs e)
    {
        SqlCommand comando = new SqlCommand();
        Funciones Objeto = new Funciones();        
        comando = Objeto.ArmarParametrosProfesionalesxCuenta(comando, RdVerificadoresXcuenta.MasterTableView.Items[RdVerificadoresXcuenta.SelectedIndexes[0].ToString()]["nroDocumento"].Text, RdVerificadoresXcuenta.MasterTableView.Items[RdVerificadoresXcuenta.SelectedIndexes[0].ToString()]["nroCuenta"].Text);
       
        Objeto.EjecutarSp("SPeliminarProfesionalXCuenta", comando);
        actualizarVista();
    }
    protected void actualizarVista()
    {
        string origen = Request.QueryString["origen"];
        Response.Redirect("./AsociarProfesionalMunicipio.aspx?origen=" + origen);
    }
}
