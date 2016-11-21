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
using System.Windows.Forms;
using Telerik.Web.UI;
using System.Globalization;
using System.Threading;

public partial class ConstanciaProfesional : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void inicio_pagina()
    {
        string nroDocumento = "";
        DataSet ds = new DataSet();
        Funciones objeto = new Funciones();
        DataTable dt = new DataTable();
        try
        {
            nroDocumento = Session["NroDocumentoProfesional"].ToString();
            objeto.agregar_tabla_dataset("Select apellido, nombre from personas where nroDocumento='" + nroDocumento + "'", "Personas", ds);
            dt = ds.Tables[0];
            lblNombre.Text = dt.Rows[0][0].ToString() + ", " + dt.Rows[0][1].ToString();
            lblDNI.Text = nroDocumento;
        }
        catch 
        {
        }
    }
    protected void imgImprimir_Click(object sender, ImageClickEventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "imprSelec('muestra');", true);
    }
    protected void imbVolver_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./Principal.aspx");
    }
}
