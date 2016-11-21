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

public partial class AltaProfesional : System.Web.UI.Page
{
    private string oldCaptchaCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        txtNumeroDocumento.Attributes.Add("onKeyPress", "Numeros()");
                
        if (!IsPostBack)
        {
            Session["CaptchaCode"] = RadCaptcha1.CaptchaImage.Text;            
        }
        lblCartel.Text = "Por favor, ingrese todos los datos";
        lblCartel.Visible = true;
     }
    protected void btnRegistrarme_Click(object sender, EventArgs e)
    {
      Boolean control = false;
      Funciones Objeto = new Funciones();

      if (txtNumeroDocumento.Text  == "1111")
      {
          lblCartel.Text = "El nro de Documento Pertenece a un Profesional temporalmente bloqueado";
          lblCartel.Visible = true;
      }
      else
      {
          if (controlCampos())
          {
              try
              {
                  control = Objeto.email_bien_escrito(txtMail.Text);
              }
              catch
              {
                  lblCartel.Text = "Debe ingresar un e-mail valido";
                  lblCartel.Visible = true;
              }             
              if (txtPassword.Text != txtPasswordRepit.Text)
              {
                  control = false;
              }
              if (control == true)
              {
                  if (RadCaptcha1.IsValid)
                  {
                      try
                      {
                          GrabarPersona();
                          GrabarProfesional();
                          GrabarUsuario();
                          try
                          {
                              EnviarCorreo();
                              EnviarCorreoTasas();
                              Response.Redirect("./CorreoEnviado.aspx");
                          }
                          catch
                          {
                              lblCartel.Text = "No se logro enviar el mail";
                              lblCartel.Visible = true;
                          }
                      }
                      catch
                      {
                          lblCartel.Text = "No se logro completar el registro, verifique si no se encuenta ya registrado";
                          lblCartel.Visible = true;
                      }
                      VisibleFalse();
                  }
              }
              else
              {                  
              }
          }
      }
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
   
     protected void EnviarCorreo()
    {
        int ValorRetorno;
        string Origen;
        string destino;
        string Asunto;
        string mensaje;
        Funciones  Objeto= new Funciones();

        Origen = "ObrasParticularesDigital@tigre.gov.ar";
        destino = txtMail.Text;
        Asunto="Registro Sistema Plano Digital";
        mensaje = "<html><p>MUCHAS GRACIAS POR REGISTRARTE EN NUESTRA WEB UNA VEZ QUE VERIFICADOS SUS DATOS RECIBIRÁ UN MAIL CON LA ACTIVACIÓN DE SU CUENTA EN FORMA DEFINITIVA.  </p><p>&nbsp;</p><p>PD: No responda este e-mail, éste es automático. </p><p>MUNICIPIO DE TIGRE </p></html>";
        ValorRetorno=Objeto.EnviarMail(Origen, destino, mensaje, Asunto);
           
    }
    protected void EnviarCorreoTasas()
    {
        int ValorRetorno;
        string Origen;
        string destino;
        string Asunto;
        string mensaje;
        Funciones Objeto = new Funciones();
        Origen = "ObrasParticularesDigital@tigre.gov.ar";
        destino =" TasasDigital@tigre.gov.ar";
        Asunto = "Registro Sistema Plano Digital - SiDOP";
        mensaje = "<html><p>SE REGISTRO UN NUEVO PROFESIONAL AL SISTEMA SiDOP. <BR /> " + txtApellido.Text + ", " + txtNombre.Text + " CON DNI N° " + txtNumeroDocumento.Text  + ". <br / > Direccion: " +txtDireccion.Text  + " - Telefono: "+ txtTelefono.Text + ". <br / > Localidad: " + txtLocalidad.Text + " - Ciudad: " + txtCiudad.Text  + "  +  <br /> Nro Registro Municipal: " + txtnroRegistroMunicipal.Text  + " - E-mail:" + txtMail.Text + " <p></p>  </p><p>&nbsp;</p><p>PD: No responda este e-mail, éste es automático. </p><p>MUNICIPIO DE TIGRE </p></html>";
        ValorRetorno = Objeto.EnviarMail(Origen, destino, mensaje, Asunto);

    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("./CorreoEnviado.aspx");
    }
    protected void GrabarPersona()
    {
        try
        {
            SqlCommand comando = new SqlCommand();
            Funciones Objeto = new Funciones(); ;
            comando = Objeto.ArmarParametrosPersonas(comando, txtNombre.Text, txtApellido.Text, ddlTipoDocumento.Text, txtNumeroDocumento.Text, txtMail.Text, txtTelefono.Text, txtDireccion.Text, txtLocalidad.Text,txtCiudad.Text );
            Objeto.EjecutarSp("SPagregarPersonas", comando);
        }
        catch
        {
            lblCartel.Text = "No se logro agregar la persona";
            lblCartel.Visible = true;
        }

    }
    protected void GrabarProfesional()
    {
        try
        {
            SqlCommand comando = new SqlCommand();
            Funciones Objeto = new Funciones();
            string cuit = txtCuitAnt.Text + "-" + txtNroCuit.Text + "-" + txtCuitValidador.Text;
            comando = Objeto.ArmarParametrosProfesionales(comando, ddlTipoDocumento.Text, txtNumeroDocumento.Text, txtNroRegistroProfesional.Text, txtnroRegistroMunicipal.Text, txtnroCuentaMunicipal.Text, cuit, txtTituloHabilitante.Text, txtCategoria.Text);
            Objeto.EjecutarSp("SPagregarProfesionales", comando);
        }
        catch
        {
            lblCartel.Text = "No se logro agregar al profesional";
            lblCartel.Visible = true;
        }
    }
    protected void GrabarUsuario()
    {
        try
        {
            SqlCommand comando = new SqlCommand();
            Funciones Objeto = new Funciones(); ;
            comando = Objeto.ArmarParametrosUsuario(comando, txtUsuario.Text, ddlTipoDocumento.Text, txtNumeroDocumento.Text, txtPassword.Text);
            Objeto.EjecutarSp("SPagregarUsuarios", comando);
        }
        catch
        {
            lblCartel.Text = "No se logro agregar el usuario";
            lblCartel.Visible = true;
        }
    }    
   
    protected void txtNumeroDocumento_TextChanged(object sender, EventArgs e)
    {
        txtUsuario.Text = txtNumeroDocumento.Text;
    }

    private void txtNumeroDocumento_KeyPress(object sender,
          KeyPressEventArgs e)
    {       
        if (Char.IsDigit(e.KeyChar))
        {
            e.Handled = false;
        }
        else
            if (Char.IsControl(e.KeyChar)) //permitir teclas de control como retroceso 
            {
                e.Handled = false;
            }
            else
            {
                //el resto de teclas pulsadas se desactivan 
                e.Handled = true;
            }
    }


    public Boolean controlContenido(String dato)
    {
        if (dato == "")
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public Boolean controlCampos()
    {
        Boolean control=true;
        Funciones Objeto = new Funciones();
        
            control = Objeto.email_bien_escrito(txtMail.Text);
            if (control == false)
            {
                lblCartel.Text = "Debe completar el E-mail en el formato correcto";
                txtMail.Focus();
                lblCartel.Visible = true;
                control = false;
            }
        if (controlContenido(txtPasswordRepit.Text))
        {
            lblCartel.Text = "Debe REPETIR LA CONTRASEÑA para continuar";
            txtPasswordRepit.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtPassword.Text))
        {
            lblCartel.Text = "Debe completar la CONTRASEÑA para continuar";
            txtPassword.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtCategoria.Text))
        {
            lblCartel.Text = "Debe completar la CATEGORIA para continuar";
            txtCategoria.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtTituloHabilitante.Text))
        {
            lblCartel.Text = "Debe completar el TITULO HABILITANTE para continuar";
            txtTituloHabilitante.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtNroCuit.Text) || controlContenido(txtCuitAnt.Text) || controlContenido(txtCuitValidador.Text))
        {
            lblCartel.Text = "Debe completar el NRO CUIT para continuar";
            txtCuitAnt.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtnroCuentaMunicipal.Text))
        {
            lblCartel.Text = "Debe completar el NRO DE CUENTA MUNICIPAL ASIGNADA AL PROFESIONAL para continuar";
            txtNombre.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtnroRegistroMunicipal.Text))
        {
            lblCartel.Text = "Debe completar el NRO DE REGISTRO MUNICIPAL para continuar";
            txtnroRegistroMunicipal.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtNroRegistroProfesional.Text))
        {
            lblCartel.Text = "Debe completar el NRO DE REGISTRO PROFESIONAL para continuar";
            txtNroRegistroProfesional.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtDireccion.Text))
        {
            lblCartel.Text = "Debe completar la DIRECCION para continuar";
            txtDireccion.Focus();
            lblCartel.Visible = true;
            control = false;
        } if (controlContenido(txtLocalidad.Text))
        {
            lblCartel.Text = "Debe completar la LOCALIDAD para continuar";
            txtLocalidad.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtCiudad.Text))
        {
            lblCartel.Text = "Debe completar la CIUDAD para continuar";
            txtCiudad .Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtTelefono.Text))
        {
            lblCartel.Text = "Debe completar el TELEFONO para continuar";
            txtTelefono.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtNumeroDocumento.Text))
        {
            lblCartel.Text = "Debe completar el NRO DE DOCUMENTO para continuar";
            txtNumeroDocumento.Focus();
            lblCartel.Visible = true;
            control = false;
        }
        if (controlContenido(txtApellido.Text))
        {
            lblCartel.Text = "Debe completar el APELLIDO para continuar";
            txtApellido.Focus();
            lblCartel.Visible = true;
            control = false;
        }
   
        if(controlContenido(txtNombre.Text))
       {
           lblCartel.Text = "Debe completar el NOMBRE para continuar";
           txtNombre.Focus();
           lblCartel.Visible = true;
           control = false;
       }
       
       return control;
    }

}
