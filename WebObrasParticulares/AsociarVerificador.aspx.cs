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

    protected void gvwProfesionales_SelectedIndexChanged(object sender, EventArgs e)
    {      
    }
    protected void btnAsociar_Click(object sender, EventArgs e)
    {
        GrabarMunicipalXcuenta();
    }
    protected void GrabarMunicipalXcuenta()
    {
        try
        {
            SqlCommand comando = new SqlCommand();
            Funciones Objeto = new Funciones();            
            comando = Objeto.ArmarParametrosMunicipalesxCuenta(comando, RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["nroDocumento"].Text, RadGrid2.MasterTableView.Items[RadGrid2.SelectedIndexes[0].ToString()]["idCarpeta"].Text);
            Objeto.EjecutarSp("SPagregarMunicipalesXCuenta", comando);            
            Response.Write(@"<script language='javascript'>alert('Se realizo la asignación del profesional \n');</script>");
                String carpeta =RadGrid2.MasterTableView.Items[RadGrid2.SelectedIndexes[0].ToString()]["idCarpeta"].Text;
                String estado = "1280"; //Activo Estado inicializado
                String observacion = Session["usuario"].ToString();
                DateTime fecha = DateTime.Now;
                String ip = Request.UserHostAddress;
                Objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
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
        comando = Objeto.ArmarParametrosMunicipalesxCuenta(comando, RdVerificadoresXcuenta.MasterTableView.Items[RdVerificadoresXcuenta.SelectedIndexes[0].ToString()]["nroDocumento"].Text, RdVerificadoresXcuenta.MasterTableView.Items[RdVerificadoresXcuenta.SelectedIndexes[0].ToString()]["nroCuenta"].Text);
        Objeto.EjecutarSp("SPeliminarMunicipalesXCuenta", comando);
        actualizarVista();
    }
    protected void actualizarVista()
    {
        string origen = Request.QueryString["origen"];
        Response.Redirect("./AsociarVerificador.aspx?origen=" + origen);
    }
}
