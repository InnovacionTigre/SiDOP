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

public partial class SolicitudesCopiaFiel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarVariables();    
    }
    protected void cargarVariables()
    {     
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
    protected void imbConfeccionando_Click(object sender, ImageClickEventArgs e)
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        string variable = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["Cuenta"].Text;
        DateTime fecha = DateTime.Now;
        string estado = "Procesando";
        int nroPedido =Convert.ToInt32(rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["nroPedido"].Text);
        string tipo = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["tipo"].Text;
        objeto.ArmarParametrosCopiaFielPlano(comando, variable, fecha, estado, nroPedido, tipo);
        objeto.EjecutarSp("SPagregarCopiaFielPlano", comando);
        string origen = "ObrasParticularesDigital@tigre.gov.ar";
        string destino;
        DataSet ds = new DataSet();
        string sql = "Select mail from PropietarioxCuenta where nroCuenta='" + variable + "'";
       objeto.agregar_tabla_dataset(sql, "mail", ds);
        destino=ds.Tables[0].Rows[0][0].ToString();
        try
        {
            enviarCorreo(origen, destino, "Procesando");
        }
        catch
        {
            lblcartel.Text = "El estado fue actualizado correctamente, pero no se logro enviar el correo electrónico al propietario";
            lblcartel.Visible = true;
        }
        Response.Redirect("./SolicitudesCopiaFiel.aspx");
    }
    protected void imbFinalizado_Click(object sender, ImageClickEventArgs e)
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        string variable = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["Cuenta"].Text;
        DateTime fecha = DateTime.Now;
        string estado = "Finalizado";
        int nroPedido = Convert.ToInt32(rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["nroPedido"].Text);
        string tipo = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["tipo"].Text;
        objeto.ArmarParametrosCopiaFielPlano(comando, variable, fecha, estado, nroPedido, tipo);
        objeto.EjecutarSp("SPagregarCopiaFielPlano", comando);
        string origen = "ObrasParticularesDigital@tigre.gov.ar";
        string destino;
        DataSet ds = new DataSet();
        string sql = "Select mail from PropietarioxCuenta where nroCuenta='" + variable + "'";
        objeto.agregar_tabla_dataset(sql, "mail", ds);
        destino=ds.Tables[0].Rows[0][0].ToString();
        try
        {
            enviarCorreo(origen, destino, "Finalizado");
        }
        catch
        {
            lblcartel.Text = "El estado fue actualizado correctamente, pero no se logro enviar el correo electrónico al propietario";
            lblcartel.Visible = true;
        }
        Response.Redirect("./SolicitudesCopiaFiel.aspx");
    }
    protected void imbEntregado_Click(object sender, ImageClickEventArgs e)
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        string variable = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["Cuenta"].Text;
        DateTime fecha = DateTime.Now;
        string estado = "Entregado";
        int nroPedido = Convert.ToInt32(rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["nroPedido"].Text);
        string tipo = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["tipo"].Text;
        objeto.ArmarParametrosCopiaFielPlano(comando, variable, fecha, estado, nroPedido, tipo);
        objeto.EjecutarSp("SPagregarCopiaFielPlano", comando);
        Response.Redirect("./SolicitudesCopiaFiel.aspx");
    }
    protected void enviarCorreo(string origen, string destino, string estado)
    {
        int ValorRetorno;
        string Asunto;
        string mensaje;
        Funciones Objeto = new Funciones();
        string cuenta;
        cuenta = Convert.ToString(Session["NroCuenta"]);
        Asunto = "COPIA FIEL PLANO - SiDOP - Municipio de Tigre";        
        mensaje = "<title>Mail</title><body><div style='width:750px'><p><img src='http://planodigital.tigre.gov.ar/img-mail/cabezal.png'  />    </br>Sr. Contribuyente, su pedido de copia fiel de la cuenta '" + cuenta + "' cambió su estado a '" + estado + "' . <p>  <img src='http://planodigital.tigre.gov.ar/img-mail/pie.png'  /></p></body></html>";
        ValorRetorno = Objeto.EnviarMail(origen, destino, mensaje, Asunto);
    }
    protected void imbParaRetirar_Click(object sender, ImageClickEventArgs e)
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        string variable = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["Cuenta"].Text;
        DateTime fecha = DateTime.Now;
        string estado = "Para Retirar";
        int nroPedido = Convert.ToInt32(rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["nroPedido"].Text);
        string tipo = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["tipo"].Text;
        objeto.ArmarParametrosCopiaFielPlano(comando, variable, fecha, estado, nroPedido, tipo);
        objeto.EjecutarSp("SPagregarCopiaFielPlano", comando);
        string origen = "ObrasParticularesDigital@tigre.gov.ar";
        string destino;
        DataSet ds = new DataSet();
        string sql = "Select mail from PropietarioxCuenta where nroCuenta='" + variable + "'";
        objeto.agregar_tabla_dataset(sql, "mail", ds);
        destino = ds.Tables[0].Rows[0][0].ToString();
        try
        {
            enviarCorreo(origen, destino, "Para Retirar");
        }
        catch
        {
            lblcartel.Text = "El estado fue actualizado correctamente, pero no se logro enviar el correo electrónico al propietario";
            lblcartel.Visible = true;
        }
        Response.Redirect("./SolicitudesCopiaFiel.aspx");
    }
    protected void imbNoHayPlano_Click(object sender, ImageClickEventArgs e)
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        string variable = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["Cuenta"].Text;
        DateTime fecha = DateTime.Now;
        string estado = "No Hay Plano";
        int nroPedido = Convert.ToInt32(rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["nroPedido"].Text);
        string tipo = rGCorreos.MasterTableView.Items[rGCorreos.SelectedIndexes[0].ToString()]["tipo"].Text;
        objeto.ArmarParametrosCopiaFielPlano(comando, variable, fecha, estado, nroPedido, tipo);
        objeto.EjecutarSp("SPagregarCopiaFielPlano", comando);
        string origen = "ObrasParticularesDigital@tigre.gov.ar";
        string destino;
        DataSet ds = new DataSet();
        string sql = "Select mail from PropietarioxCuenta where nroCuenta='" + variable + "'";
        objeto.agregar_tabla_dataset(sql, "mail", ds);
        destino = ds.Tables[0].Rows[0][0].ToString();
        try
        {
            enviarCorreo(origen, destino, "No Hay Plano");
        }
        catch
        {
            lblcartel.Text = "El estado fue actualizado correctamente, pero no se logro enviar el correo electrónico al propietario";
            lblcartel.Visible = true;
        }
        Response.Redirect("./SolicitudesCopiaFiel.aspx");
    }
}
