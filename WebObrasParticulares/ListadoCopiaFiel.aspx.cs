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

public partial class ListadoCopiaFiel : System.Web.UI.Page
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
            catch { }            
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
        if (e.CommandName == "cambiar")
        {
             int index = e.Item.ItemIndex;
        String row = rGProfesionales.MasterTableView.Items[index]["nroDocumento"].Text;
        String estado = rGProfesionales.MasterTableView.Items[index]["estado"].Text;
        String mail = rGProfesionales.MasterTableView.Items[index]["mail"].Text;
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
                Funciones Objeto = new Funciones(); ;
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
        Response.Redirect("./ResponsableOP.aspx");
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
        Origen = "ObrasParticularesDigital@tigre.gov.ar";
        destino = mail;
        Asunto = "Registro Sistema Plano Digital";
        mensaje = "<title>Mail</title><body><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>LA DIRECCIÓN DE OBRAS PARTICULAR DEL MUNICIPIO DE TIGRE LE INFORMA QUE SU CUENTA PARA TRABAJAR EN EL SISTEMA SiDOP, PARA PRESENTACI&Oacute;N DE PLANOS, SE ENCUENTA " + estado + " <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";        
        ValorRetorno = Objeto.EnviarMail(Origen, destino, mensaje, Asunto);
    }
}
