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
using System.IO;

public partial class copiaFielPlano : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void iniciar()
    {
  
    }     
    protected void nuevaPagina(string url)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "otroTag('" + url + "');", true);
    }
    protected void actualizarArbol()
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "actualizarfile();", false);      
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string origen;
        string destino;
        origen = "obrasparticularesdigital@tigre.gov.ar";
        destino = txtMail.Text;
        guardarBase();
        enviarCorreo(origen, destino);
        enviarCorreoMunicipal(origen, "@tigre.gov.ar");
        enviarCorreoMunicipal(origen, "@tigre.gov.ar");
        generaDeuda();
        lblMensaje.Text = "Su pedido fue procesado con exito";
        lblMensaje.Visible = true;
    }
    protected void guardarBase()
    {
        Funciones objeto = new  Funciones();
        DateTime fecha = DateTime.Now;
        DataSet ds = new DataSet();
        string cuenta = Convert.ToString(Session["NroCuenta"]);
        string estado = "Solicitado";
        int nroPedido;
        string tipo="";        
        string sql = "Select MAX(nroPedido)as cantidad from PedidoCopiaFiel where NroCuenta='" + cuenta + "'";
        objeto.agregar_tabla_dataset(sql, "Cantidad", ds);
        if (ds.Tables[0].Rows[0][0].ToString() == "")
        {
            nroPedido = 1;
        }
        else{
        nroPedido = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + 1;
        }
        SqlCommand comando = new SqlCommand();

        if (rb1.Checked == true)
        {
            tipo = "fisico";
        }
        else
        {
            if (rbDitigal.Checked == true)
            { 
            tipo="digital";
            }
        }
        string sql2 = "Update PropietarioxCuenta set mail='" + txtMail.Text + "' where nroDocumento='" + txtUsuario.Text + "'";
        objeto.Ejecutarconsulta2(sql2);
        objeto.ArmarParametrosCopiaFielPlano(comando, cuenta, fecha, estado, nroPedido, tipo);
        objeto.EjecutarSp("SPagregarCopiaFielPlano", comando);
    }
    protected void generaDeuda()
    {
        Funciones Objeto = new Funciones();
        SqlCommand comandoTigre = new SqlCommand();
        DataTable dtTigre = new DataTable();
        DataSet DsTigre = new DataSet();
        Int32 cuenta = Convert.ToInt32(Session["NroCuenta"]);       
        Int32 liquidacion = 1;
        comandoTigre = Objeto.ArmarParametrosGererarDeudaCopiaFiel(comandoTigre, cuenta, liquidacion);        
        Objeto.Ejecutar_SP_C_Select_Tigre("WebCopiaPlano_CtaCte_Ins", comandoTigre, DsTigre);
        dtTigre = DsTigre.Tables[0];
        nuevaPagina(dtTigre.Rows[0][0].ToString());    
    }
       
    protected void enviarCorreo(string origen, string destino)
    {
        int ValorRetorno;        
        string Asunto;
        string mensaje;
        Funciones Objeto = new Funciones();
        string cuenta;
        cuenta = Convert.ToString(Session["NroCuenta"]);
        Asunto = "COPIA FIEL PLANO - SiDOP - Municipio de Tigre";        
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>Sr. Contribuyente, su pedido ha sido cursado, y se comunicara por este mismo medio el estado de su pedido. <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";       
        ValorRetorno = Objeto.EnviarMail(origen, destino, mensaje, Asunto);       
    }
    protected void enviarCorreoMunicipal(string origen, string destino)
    {
        int ValorRetorno;
        string Asunto;
        string mensaje;
        Funciones Objeto = new Funciones();
        string cuenta;
        cuenta = Convert.ToString(Session["NroCuenta"]);
        Asunto = "COPIA FIEL PLANO - SiDOP - Municipio de Tigre";        
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>Se solicitó Copia Fiel de Plano de la Cuenta Municipal : '" + cuenta + "'. <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";      
        ValorRetorno = Objeto.EnviarMail(origen, destino, mensaje, Asunto);    
    }
}
