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

public partial class CambioPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
           cargardni();
           cargarDatosPersonales();             
    }
    protected void cargardni()
    {
            if (Session["Permiso"].ToString() == "profesional")
            {
                lblDocumento.Text = Session["NroDocumentoProfesional"].ToString();
            }
            else
            {
                lblDocumento.Text = Session["NroDocumentoMunicipio"].ToString();
            }      
    }
    protected void cargarDatosPersonales()
    {
        if (IsPostBack==false)
        {
            DataSet Ds_Persona = new DataSet();
            Funciones objeto = new Funciones();
            DataTable Filas_Persona = new DataTable();
            objeto.agregar_tabla_dataset("Select nombre, apellido, mail, telefono, direccion from Personas where nrodocumento='" + lblDocumento.Text + "'", "Persona", Ds_Persona);
            Filas_Persona = Ds_Persona.Tables[0];
            txtNombre.Text = Filas_Persona.Rows[0][0].ToString();
            txtApellido.Text = Filas_Persona.Rows[0][1].ToString();
            txtCorreo.Text = Filas_Persona.Rows[0][2].ToString();
            txtTelefono.Text = Filas_Persona.Rows[0][3].ToString();
            txtDireccion.Text = Filas_Persona.Rows[0][4].ToString();
        }
    }
    protected void validarpass()
    { 
        
       DataSet Ds_Usuarios = new DataSet();
        Funciones objeto = new Funciones();
        DataTable  Filas = new DataTable ();
        
        objeto.agregar_tabla_dataset("Select nrodocumento, password from Usuarios where nrodocumento='" + lblDocumento.Text + "'", "Usuarios", Ds_Usuarios);
             
        Filas = Ds_Usuarios.Tables[0];

        if (txtClaveActual.Text == Filas.Rows[0][1].ToString())
        {
            if (txtNuevaClave.Text == txtNuevaClave2.Text)
            {
                try
                {
                    objeto.Ejecutarconsulta2("Update Usuarios set password='" + txtNuevaClave.Text + "' where nrodocumento='" + lblDocumento.Text + "'");
                    lblcartel.Text = "Se completo el cambio de contraseña con exito";
                    lblcartel.Visible = true;
                }
                catch
                {
                    lblcartel.Text = "No se puedo completar el cambio de contraseña, vuelva a intentarlo";
                    lblcartel.Visible = true;
                }
            }
            else
            {
                lblcartel.Text = "La clave nueva ingresada no su campo verificador, vuelva a intentarlo";
                lblcartel.Visible = true;
            }
        }
        else 
        {
            lblcartel.Text = "La clave ingresada no coincide con nuestro registro, vuelva a intentarlo";
            lblcartel.Visible = true;
        }     
   }

    protected void btnCambiar_Click(object sender, EventArgs e)
    {
        validarpass();
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
        }
    }
    protected void btnActualizar_Click(object sender, EventArgs e)
    {
        Funciones objeto = new Funciones();
        string sql = "Update Personas set nombre='" + txtNombre.Text + "', apellido='" + txtApellido.Text + "', mail='" + txtCorreo.Text + "', telefono='" + txtTelefono.Text + "', direccion='" + txtDireccion.Text + "' where nrodocumento='" + lblDocumento.Text + "'";
        try
        {
            objeto.Ejecutarconsulta2(sql);
            lblCartelActualizar.Text = "Se actualizaron los datos correctamente";
            lblCartelActualizar.Visible = true;
        }
        catch
        {
            lblCartelActualizar.Text = "No se logro actualizar los datos personales";
            lblCartelActualizar.Visible = true;
        }
    }
}
