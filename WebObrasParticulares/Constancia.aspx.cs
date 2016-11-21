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


public partial class Constancia : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void inicio_pagina()
    {
        if (!Page.IsPostBack)
        {                     
            imgQR.ImageUrl  ="./Archivos/qr/"+Request.QueryString["cuenta"]+ ".png";
            int valor=validarEstado();
            if (valor == 0)
            {
                cargarinfo();
            }
            else
            {
                lbl1.Text = "PLANO NO REGISTRADO";
            }
        }       
    }
    public int validarEstado()
    {
        string cuenta = Request.QueryString["cuenta"].ToString();
        string origen = Request.QueryString["origen"].ToString();
        string consulta;
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        Funciones objeto = new Funciones();
        try
        {
            consulta = "SELECT estado from UltimoEstadoCuentas where idCarpeta='" + cuenta + "'";
            objeto.agregar_tabla_dataset(consulta, "estado", ds);
            dt = ds.Tables[0];
            if ((dt.Rows[0]["estado"].ToString() == "1316") || (dt.Rows[0]["estado"].ToString() == "Registrado") || (dt.Rows[0]["estado"].ToString() == "REGISTRADO") || (dt.Rows[0]["estado"].ToString() == "0003") || (dt.Rows[0]["estado"].ToString() == "0002") || (dt.Rows[0]["estado"].ToString() == "0011") || (dt.Rows[0]["estado"].ToString() == "0014"))
            {
                if(dt.Rows[0]["estado"].ToString() == "0014")
                {
                    lblEstadoExpediente.Text = "Permiso Automático de Obra";                   
                    lblEstadoExpediente.Visible = true;
                    lblViviendaUnifamiliar.Visible = true;
                }
                return 0;
            }
            else
            {
                if (origen == "1")
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
        }
        catch { 
        }
        return 1;
    }
    protected void cargarinfo()
    {
        string cuenta = Request.QueryString["cuenta"].ToString();
        string consulta;
        DataSet ds = new DataSet();
        Funciones objeto = new Funciones();
        DataTable dt = new DataTable();
        DataSet ds2 = new DataSet();
        
        DataTable dt2 = new DataTable();
        try
        {           
            consulta = "SELECT expedientesxCuenta.matricula, expedientesxCuenta.ejecicio, expedientesxCuenta.numero, expedientesxCuenta.letra, expedientesxCuenta.provincia, expedientesxCuenta.tipo, expedientesxCuenta.subNumero, Carpetas.fecha, Personas.nombre, Personas.apellido, Profesionales.nroRegistroProfesional, Personas.telefono, Personas.mail, Estadistica.destino, Estadistica.viviendaPropia, Estadistica.superficie, Estadistica.tipoObra FROM  expedientesxCuenta INNER JOIN Carpetas INNER JOIN  Personas LEFT OUTER JOIN Profesionales ON Personas.nroDocumento = Profesionales.nroDocumento INNER JOIN ProfesionalXcuenta ON Profesionales.nroDocumento = ProfesionalXcuenta.nroDocumentoProfesional ON Carpetas.idCarpeta = ProfesionalXcuenta.nroCuenta ON expedientesxCuenta.nroCuenta = Carpetas.idCarpeta LEFT OUTER JOIN Estadistica ON expedientesxCuenta.nroCuenta = Estadistica.nrocuenta WHERE  (Carpetas.Estado = 'verificado' OR Carpetas.Estado = '1287' OR Carpetas.Estado = '0011' OR Carpetas.Estado = '0014') AND (Carpetas.idCarpeta = '" + cuenta + "')ORDER BY expedientesxCuenta.ejecicio, expedientesxCuenta.numero DESC";
            objeto.agregar_tabla_dataset(consulta, "constancia", ds);
            dt = ds.Tables[0];
            int cuantos = ds.Tables[0].Rows.Count;
            lblResExpediente.Text = dt.Rows[cuantos - 1]["matricula"].ToString() + "-" + dt.Rows[cuantos - 1]["ejecicio"].ToString() + "-" + dt.Rows[cuantos - 1]["numero"].ToString() + "-" + dt.Rows[cuantos - 1]["letra"].ToString() + "-" + dt.Rows[cuantos - 1]["provincia"].ToString() + "-" + dt.Rows[cuantos - 1]["tipo"].ToString() + "-" + dt.Rows[cuantos - 1]["subNumero"].ToString();
            lblResRegistroFecha.Text = dt.Rows[cuantos - 1]["fecha"].ToString();            
            lblResNombreProfesional.Text = dt.Rows[cuantos - 1]["apellido"].ToString() + ", " + dt.Rows[cuantos - 1]["nombre"].ToString();
            lblResNroMatricula.Text = dt.Rows[cuantos - 1]["nroRegistroProfesional"].ToString();
            lblResTelefono.Text = dt.Rows[cuantos - 1]["telefono"].ToString();
            lblResMail.Text = dt.Rows[cuantos - 1]["mail"].ToString();
            lblDestinoRes.Text = obtenerDestino(Convert.ToInt32(dt.Rows[cuantos - 1]["destino"].ToString()));
            lblSuperficieRes.Text = dt.Rows[cuantos - 1]["superficie"].ToString();
            lblAlturaRes.Text = dt.Rows[cuantos - 1]["viviendaPropia"].ToString();
            lblResTipoObra.Text = dt.Rows[cuantos - 1]["tipoObra"].ToString();          
        }
        catch
        {
        }
    }
    protected void imgImprimir_Click(object sender, ImageClickEventArgs e)
    {        
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "imprSelec('muestra');", true);
    }
    public string obtenerDestino(Int32 valor)
    {
        string texto="";
        switch (valor)
        {
            case 1:
                texto = "Administración";
                break;
            case 2:
                texto = "Bailable";
                break;
            case 3:
                texto = "Barrio Cerrado";
                break;
            case 4:
                texto = "Comercio";
                break;
            case 5:
                texto = "Deportes";
                break;
            case 6:
                texto = "Educación";
                break;
            case 7:
                texto = "Guardería Náutica";
                break;
            case 8:
                texto = "Garage";
                break;
            case 9:
                texto = "Industria";
                break;
            case 10:
                texto = "Logística";
                break;
            case 11:
                texto = "Salud";
                break;
            case 12:
                texto = "Vivienda Multifamiliar";
                break;
            case 13:
                texto = "Vivienda Unifamiliar";
                break;
        }
        return texto;    
    }
    protected void imbVolver_Click(object sender, ImageClickEventArgs e)
    {
        string origen = Request.QueryString["origen"];        
        switch(origen)
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
}
