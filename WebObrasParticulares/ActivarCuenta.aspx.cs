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
using System.Data;

public partial class ActivarCuenta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        
    }
    protected void ActvarCuenta()
    {
        SqlCommand comando = new SqlCommand();
        Funciones Objeto = new Funciones();
        comando = Objeto.ArmarParametrosActivarCuenta(comando, Request.QueryString["cod"].Substring(6,9));
        Objeto.EjecutarSp("SPactivarCuenta", comando);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ActvarCuenta();
    }
}
