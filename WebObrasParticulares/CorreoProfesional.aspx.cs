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

public partial class CorreoProfesional : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarVariables();              
    }
    protected void cargarVariables()
    {       
        string nrodoc;
        string mail;
        try
        {
            if (Session["Permiso"].ToString() == "profesional")
            {
                nrodoc = Session["NroDocumentoProfesional"].ToString();
            }
            else
            {
                nrodoc = Session["NroDocumentoMunicipio"].ToString();
            }
            mail = obtener_correo(nrodoc);
            Session["correo"] = mail;

            string origen = Request.QueryString["origen"];
            if(origen=="2"){
            rGCorreos.DataSourceID = "SqlDataSourceCorreoCompleto";
             }            
        }
        catch 
        { }
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
    protected void imbRecibidos_Click(object sender, ImageClickEventArgs e)
    {
        rGCorreos.DataSourceID = "SqlDataSourceCorreos";
    }
    protected void imbEnviados_Click(object sender, ImageClickEventArgs e)
    {
        rGCorreos.DataSourceID = "SqlDataSourceCorreoSaliente";
    }
    protected void imgVolver_Click(object sender, ImageClickEventArgs e)
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
                Response.Redirect("./DirectorOP.aspx");
                break;
            case "4":
                Response.Redirect("./ResponsableMunicipio.aspx");
                break;
        }
       
    }
}
