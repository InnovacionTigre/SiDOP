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
using Telerik;
using System.Windows.Forms;
using Telerik.Web.UI;
using System.Data.SqlClient;


public partial class ActivarProfesionales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void pagina()
    {
        if (Page.IsPostBack==false )
        {
            try
            {
                rGProfesionales.CurrentPageIndex = Convert.ToInt32(Session["pag"]);
            }
            catch { 
            
            }
            
        }
    }
    protected void gvwCuentas_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

  
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string carpeta = rGProfesionales.MasterTableView.Items[rGProfesionales.SelectedIndexes[0].ToString()]["nroCuenta"].Text;
            string estado = "Verificado";
            string observacion = "";
            DateTime fecha = DateTime.Now;
            Funciones objeto = new Funciones();
            objeto.Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "')");
        }
        catch
        {
        }
    }
    protected void rGProfesionales_RowCommand(Object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
       
        Funciones Objeto = new Funciones();        
        if (e.CommandName == "Cambiar")
        {
            int index = e.Item.ItemIndex;
            String row = rGProfesionales.MasterTableView.Items[index]["nroDocumento"].Text;
            String mail = rGProfesionales.MasterTableView.Items[index]["mail"].Text;
        String estado = rGProfesionales.MasterTableView.Items[index]["estado"].Text;
       
            bool act;

            if(estado=="Activo")
            {
                act = false;

            }else
            {
                act = true;
            }
            try
            {
                SqlCommand comando = new SqlCommand();
                
                comando = Objeto.ArmarParametrosActivarUsuario(comando, row, act);
                Objeto.EjecutarSp("SPactivarUsuario", comando);
                try
                {
                    EnviarCorreo(act, mail);
                }
                catch
                { 
                
                }
                Session["pag"]=rGProfesionales.CurrentPageIndex;
                Response.Redirect("./ActivarProfesionales.aspx");
                MostrarCartel("Se cambio el estado correctamente");
            }
            catch
            { 
            MostrarCartel("No se logro cambiar el estado del profesional");
            }
        }
        if (e.CommandName == "password")
        {
            int index = e.Item.ItemIndex;
            String row = rGProfesionales.MasterTableView.Items[index]["nroDocumento"].Text;
            String mail = rGProfesionales.MasterTableView.Items[index]["mail"].Text;
            try
            {
                string sql = "UPDATE Usuarios SET password='" + row + "' where usuario='" + row + "'";
                Objeto.Ejecutarconsulta2(sql);
                EnviarCorreoPassword(mail);
                lblMensaje.Text = "Se restablecio los datos de acceso, la nueva contraseña equivale al nro de documento del profesional";
                lblMensaje.Visible = true;
            }
            catch
            {
                lblMensaje.Text = "No se logro restabler la contraseña para este profesional";
                lblMensaje.Visible = true;
            }
        
        }
       
    }
    protected void MostrarCartel(String cartel)
    {
        ScriptManager.RegisterStartupScript(Page , GetType(), "mostrar", "OpenAlert('" + cartel + "');", true);
    }

    protected void rGProfesionales_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
    {

    }
    protected void imbVolver_Click(object sender, ImageClickEventArgs e)
    {
        string origen = Request.QueryString["origen"].ToString();
        switch (origen)
        {            
            case "3":
                Response.Redirect("./DirectorGeneral.aspx");
                break;
            default :
                Response.Redirect("./ResponsableOP.aspx");
                break;
        }
        
    }
    protected void EnviarCorreo(bool act, string mail)
    {
        int ValorRetorno;
        string Origen;
        string destino;
        string Asunto;
        string mensaje;
        string estado;
        Funciones Objeto = new Funciones();
        if (act == true)
        {
            estado = "Activada";
        }
        else {
            estado = "Desactivada";
        }
        Origen = "SiDOP@tigre.gov.ar";
        destino = mail;
        Asunto = "Registro Sistema Plano Digital";
        
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>LA DIRECCIÓN DE OBRAS PARTICULAR DEL MUNICIPIO DE TIGRE LE INFORMA QUE SU CUENTA PARA TRABAJAR EN EL SISTEMA SiDOP, PARA PRESENTACI&Oacute;N DE PLANOS, SE ENCUENTA <b> " + estado + "</b> <p>No responda esta correo, es un envio automático del sistema</p><div /> <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";
        
        ValorRetorno = Objeto.EnviarMail(Origen, destino, mensaje, Asunto);

    }
    protected void EnviarCorreoPassword(string mail)
    {
        int ValorRetorno;
        string Origen;
        string destino;
        string Asunto;
        string mensaje;
        string estado;
        Funciones Objeto = new Funciones();
       
        Origen = "ObrasParticularesDigital@tigre.gov.ar";
        destino = mail;
        Asunto = "Restablecer contraseña SiDOP - Sistema Digital de Obras Particulares";
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>SE LE INFORMA QUE SUS DATOS DE ACCESO AL SISTEMA FUERON RESTABLECIDOS, SU NUEVA CONTRASEÑA ES: SU NRO DE DOCUMENTO. <p/> <P>PD: No responda esta mail, este es un correo automático</P><div /> <P><img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";
              
        ValorRetorno = Objeto.EnviarMail(Origen, destino, mensaje, Asunto);
    }
    protected void imbExportar_Click(object sender, ImageClickEventArgs e)
    {
        rGProfesionales.MasterTableView.ExportToExcel();
    }
}
