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
using System.Net;
using System.Windows.Forms;
using System.Data.SqlClient;

public partial class Registracion : System.Web.UI.Page
{
    private string oldCaptchaCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["CaptchaCode"] = RadCaptcha1.CaptchaImage.Text;
        }
     }
    protected void btnRegistrarme_Click(object sender, EventArgs e)
    {
        Boolean control;
        Funciones Objeto = new Funciones();
        control = Objeto.email_bien_escrito(txtMail.Text);
        if (control == true)
        {
            GrabarPersona();
            GrabarProfesional();
            GrabarUsuario();
            VisibleFalse();
            EnviarCorreo();
            MessageBox.Show("Muchas Grasias por registrarte con nosotros", "Tigre Municipio", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
            Response.Redirect("./CorreoEnviado.aspx");
        }
        else
        {
            MessageBox.Show("El Email Ingresado no se encuentra en el Formato Correcto", txtMail.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
        }      
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
    }
    protected void lbtnLogin_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void EnabledFalse()
    {    
    }
    protected void VisibleTrue()
    {       
    }
    protected void VisibleFalse()
    {    
    }
   
    protected void imgCerrar_Click(object sender, ImageClickEventArgs e)
    {
        ModalPopupExtender1.Hide();
    }
    protected void EnviarCorreo()
    {
        int ValorRetorno;
        string Origen;
        string destino;
        string Asunto;
        string mensaje;
        Funciones  Objeto= new Funciones();
        Origen="lscarampi@tigre.gov.ar";
        destino = txtMail.Text;
        Asunto="Prueba";
        mensaje = "<p>MUCHAS GRACIAS POR REGISTRARTE EN NUESTRA WEB PARA LOGRAR LA ACTIVACIÓN DE SU CUENTA EN FORMA DEFINITIVA HAGA CLIK <a href='www.tigre.gov.ar/planodigital/ActivarCuenta.aspx?cod=wsd23e" + txtUsuario.Text  + "v43xm'>AQUÍ</a>.  </p><p>MUNICIPIO DE TIGRE </p>";
        ValorRetorno=Objeto.EnviarMail(Origen, destino, mensaje, Asunto);           
    }    
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("./CorreoEnviado.aspx");
    }
    protected void GrabarPersona()
    {
        SqlCommand comando = new SqlCommand();
        Funciones Objeto = new Funciones(); ;
        comando = Objeto.ArmarParametrosPersonas(comando,txtNombre.Text,txtApellido.Text,ddlTipoDocumento.Text,txtNumeroDocumento.Text,txtMail.Text);
        Objeto.EjecutarSp("SPagregarPersonas", comando);
    }
    protected void GrabarProfesional()
    {
        SqlCommand comando=new SqlCommand();
        Funciones Objeto = new Funciones(); ;
        comando = Objeto.ArmarParametrosProfesionales(comando, ddlTipoDocumento.Text, txtNumeroDocumento.Text, txtNroRegistroProfesional.Text, txtnroRegistroMunicipal.Text);
        Objeto.EjecutarSp("SPagregarProfesionales", comando);
    }
    protected void GrabarUsuario()
    {
        SqlCommand comando =new SqlCommand();
        Funciones Objeto = new Funciones(); ;
        comando = Objeto.ArmarParametrosUsuario(comando, txtUsuario.Text, ddlTipoDocumento.Text, txtNumeroDocumento.Text, txtPassword.Text);
        Objeto.EjecutarSp("SPagregarUsuarios", comando);
    }   
   
}
