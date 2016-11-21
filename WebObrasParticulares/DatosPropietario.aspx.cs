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

public partial class DatosPropietario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void iniciar()
    {
        if (Page.IsPostBack ==false )
        {
            try
            {
                String variable = "";
                variable = Session["NroCuenta"].ToString();
                Session["cuenta"] = variable;
                Funciones objeto = new Funciones();
                DataSet ds = new DataSet();
                string sql = "Select * from PropietarioxCuenta where nroCuenta='" + variable + "'";
                objeto.agregar_tabla_dataset(sql, "Propietario", ds);
                if (ds.Tables["Propietario"].Rows.Count == 0)
                {
                    sql = "Insert into PropietarioxCuenta values('" + variable + "','','','','-')";
                    objeto.Ejecutarconsulta2(sql);
                    sql = "Select * from PropietarioxCuenta where nroCuenta='" + variable + "'";
                    objeto.agregar_tabla_dataset(sql, "Propietario", ds);
                }
                string origen = Request.QueryString["origen"];
                if ((ds.Tables["Propietario"].Rows[0][4].ToString() == "-") || (origen=="p"))
                {
                    txtNroCuenta.Text = variable;
                    txtNroDocumento.Text = ds.Tables["Propietario"].Rows[0][1].ToString(); ;
                    txtNombre.Text = ds.Tables["Propietario"].Rows[0][2].ToString(); ;
                    txtApellido.Text = ds.Tables["Propietario"].Rows[0][3].ToString();
                    txtMail.Text = ds.Tables["Propietario"].Rows[0][4].ToString();
                }
                else
                {
                    Response.Redirect("./AsociarProfesional.aspx");
                }
            }
            catch
            { }
        }
    }
    protected void  imbActualizarDatos_Click(object sender, ImageClickEventArgs e)
{
        String variable = "";
        variable = Session["NroCuenta"].ToString();
        Session["cuenta"] = variable;
        Funciones objeto = new Funciones();  
        string sql = "Update PropietarioxCuenta set nroDocumento='" + txtNroDocumento.Text + "', nombre='" + txtNombre.Text + "', apellido='" + txtApellido.Text + "', mail='" + txtMail.Text + "' where nroCuenta='" + variable + "'";
        try
        {
            if (txtMail.Text == "-" || objeto.email_bien_escrito(txtMail.Text).ToString() == "False")
            {
                lblMensaje.Text = "Para continuar debe ingresar un E-Mail valido";
            }
            else
            {
                imbActualizarDatos.Visible = false;
                imbContinuar.Visible = true;
                txtApellido.Enabled = false;
                txtMail.Enabled = false;
                txtNombre.Enabled = false;
                txtNroDocumento.Enabled = false;
                objeto.Ejecutarconsulta2(sql);
                lblMensaje.Text = "Los Datos se actualizaron correctamente";
            }              
            lblMensaje.Visible = true;                           
        }
        catch 
        {
            lblMensaje.Text = "No se lograron actualizar los datos, vuelva a intentarlo";
            lblMensaje.Visible = true;
        }
}
protected void  imbContinuar_Click(object sender, ImageClickEventArgs e)
{
     Response.Redirect("./AsociarProfesional.aspx");
}
}
          


