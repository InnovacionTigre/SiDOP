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
public partial class Formulario : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        txtObraNuevaCub.Attributes.Add("onKeyPress", "Numeros()");
        txtObraNuevaSCub.Attributes.Add("onKeyPress", "Numeros()");
        txtAmpliacionCub.Attributes.Add("onKeyPress", "Numeros()");
        txtAmpliacionSCub.Attributes.Add("onKeyPress", "Numeros()");
        txtValorDemolicion.Attributes.Add("onKeyPress", "Numeros()");
        txtValorModificacionInterna.Attributes.Add("onKeyPress", "Numeros()");
        txtValorPileta.Attributes.Add("onKeyPress", "Numeros()");
        txtsubsistenciaCub.Attributes.Add("onKeyPress", "Numeros()");
        txtSubsistenciaSCub.Attributes.Add("onKeyPress", "Numeros()");
        txtConformeObraCub.Attributes.Add("onKeyPress", "Numeros()");
        txtConformeObraSCub.Attributes.Add("onKeyPress", "Numeros()");
        txtValorExistenteDemolicion.Attributes.Add("onKeyPress", "Numeros()");
        txtValorExistenteModificacionInterna.Attributes.Add("onKeyPress", "Numeros()");
        txtValorExistentePileta.Attributes.Add("onKeyPress", "Numeros()");
        txtValorEspecialCub.Attributes.Add("onKeyPress", "Numeros()");
        txtValorEspecialScub.Attributes.Add("onKeyPress", "Numeros()");
        txtValorMultifamiliar.Attributes.Add("onKeyPress", "Numeros()");
        txtValorGalerias.Attributes.Add("onKeyPress", "Numeros()");
        txtValorIndustria.Attributes.Add("onKeyPress", "Numeros()");
        txtValorEmprendimientosUrbanos.Attributes.Add("onKeyPress", "Numeros()");
        txtValorAmbientalCub.Attributes.Add("onKeyPress", "Numeros()");
        txtValorAmbientalScub.Attributes.Add("onKeyPress", "Numeros()");
        txtCantLocales.Attributes.Add("onKeyPress", "Numeros()");
        txtCantViviendas.Attributes.Add("onKeyPress", "Numeros()");
        txtCantDormitorios.Attributes.Add("onKeyPress", "Numeros()");
        txtCantBanos.Attributes.Add("onKeyPress", "Numeros()");
        inicio_pagina();
        ddlCategoria_SelectedIndexChanged(sender, e);
        verSiProfesional();    
    }
    protected void verSiProfesional()
    {         
    }
    protected void inicio_pagina()
    {
        if (!Page.IsPostBack)
        {
            DataSet visado = new DataSet();
            lblNroCuenta.Text = Request.QueryString["cuenta"];                
            cargarTasas();
            cargarEstadistica();
            ddlCategoria.Focus();
        }    
    }
    
    protected void cargarEstadistica()
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        DataSet estadistica = new DataSet();
        DataTable dt = new DataTable();
        try
        {           
            comando = objeto.ArmarParametrosSelecEstadistica(comando, lblNroCuenta.Text);
            objeto.agregar_tabla_dataset_SP("SPseleccionarEstadistica", comando, estadistica);
            dt = estadistica.Tables[0];
            txtCantLocales.Text = dt.Rows[0]["cantidadLocales"].ToString();
            txtCantViviendas.Text = dt.Rows[0]["cantidadViviendas"].ToString();
            txtCantDormitorios.Text = dt.Rows[0]["cantidadDormitorios"].ToString();
            txtCantBanos.Text = dt.Rows[0]["cantidadBanos"].ToString();
            ddlDestino.SelectedValue = dt.Rows[0]["destino"].ToString();  
            txtAlturaConstruccion.Text  = dt.Rows[0]["viviendaPropia"].ToString();
            ddlFinanciamientoPropio.SelectedValue = dt.Rows[0]["financiamientoPropio"].ToString();
            ddlDistanciaTransporte.SelectedValue = dt.Rows[0]["DistanciaTransporte"].ToString();
            txtSuperficieConstruir.Text = dt.Rows[0]["Superficie"].ToString();
            ddlTipoObra.SelectedValue = dt.Rows[0]["tipoObra"].ToString();
            btnEstadistica.Text = "Actualizar Estadistica";
        }
        catch 
        {
            btnEstadistica.Text = "Grabar Estadistica";            
        }        
    }

    protected void cargarTasas()
    {
        string s;
        s = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.CurrencyDecimalSeparator;
        lblObraNuevaCubTasa.Text="0"+s+"0150";
        lblObraNuevaSCubTasa.Text = "0" + s + "0075";
        lblAmpliacionCubTasa.Text = "0" + s + "0150";
        lblAmpliacionSCubTasa.Text = "0" + s + "0075";
        lblDemolicionTasa.Text = "0" + s + "0150";
        lblModificacionInternaTasa.Text = "0" + s + "0150";
        lblPiletaTasa.Text = "0" + s + "0150";
        lblSubsistenciaCubTasa.Text = "0" + s + "0150";
        lblSubsistenciaSCubTasa.Text = "0" + s + "0075";
        lblConformeObraCubTasa.Text = "0" + s + "0150";
        lblConformeObraSCubTasa.Text = "0" + s + "0075";
        lblExistenteDemolicionTasa.Text = "0" + s + "0150";
        lblExistenteModificacionInternaTasa.Text = "0" + s + "0150";
        lblExistentePiletaTasa.Text = "0" + s + "0150";
        lblSubsistenciaCubTasaRecargo.Text = "0" + s + "5";
        lblSubsistenciaSCubTasaRecargo.Text = "0" + s + "5";
        lblConformeObraCubTasaRecargo.Text = "0" + s + "5";
        lblConformeObraSCubTasaRecargo.Text = "0" + s + "5";
        lblExistenteDemolicionTasaRecargo.Text = "0" + s + "5";
        lblExistenteModificacionInternaTasaRecargo.Text = "0" + s + "5";
        lblExistentePiletaTasaRecargo.Text = "0" + s + "5";
        lblEspecialCubTasa.Text = "0" + s + "0150";
        lblEspecialScubTasa.Text = "0" + s + "0150";
        lblMultifamiliarTasa.Text = "0" + s + "0300";
        lblGaleriasTasa.Text = "0" + s + "0200";
        lblIndustriaTasa.Text = "0" + s + "0250";
        lblEmprendimientosUrbanosTasa.Text = "0" + s + "0100";
        lblAmbientalCubTasa.Text = "20";
        lblAmbientalScubTasa.Text = "10";    
    }
    protected void txtObraNuevaCub_TextChanged(object sender, EventArgs e)
    {
        txtValorObraNuevaCub.Text = Convert.ToString(Convert.ToDouble(txtObraNuevaCub.Text) * Convert.ToDouble(lblObraNuevaCub.Text));
        txtImporteObraNuevaCub.Text = Convert.ToString(Convert.ToDouble(txtValorObraNuevaCub.Text) * Convert.ToDouble(lblObraNuevaCubTasa.Text));
        txtSubtotalObraNuevaCub.Text = txtImporteObraNuevaCub.Text;
        sumaTotal();
    }
    protected void txtObraNuevaSCub_TextChanged(object sender, EventArgs e)
    {
        txtValorObraNuevaSCub.Text = Convert.ToString(Convert.ToDouble(txtObraNuevaSCub.Text) * Convert.ToDouble(lblObraNuevaSCub.Text));
        txtImporteObraNuevaSCub.Text = Convert.ToString(Convert.ToDouble(txtValorObraNuevaSCub.Text) * Convert.ToDouble(lblObraNuevaSCubTasa.Text));
        txtSubTotalObraNuevaSCub.Text = txtImporteObraNuevaSCub.Text;
        sumaTotal();
    }
    protected void txtAmpliacionCub_TextChanged(object sender, EventArgs e)
    {
        txtValorAmpliacionCub.Text = Convert.ToString(Convert.ToDouble(txtAmpliacionCub.Text) * Convert.ToDouble(lblAmpliacionCub.Text));
        txtImporteAmpliacionCub.Text = Convert.ToString(Convert.ToDouble(txtValorAmpliacionCub.Text) * Convert.ToDouble(lblAmpliacionCubTasa.Text));
        txtSubTotalAmpliacionCub.Text = txtImporteAmpliacionCub.Text;
        sumaTotal();
    }
    protected void txtAmpliacionSCub_TextChanged(object sender, EventArgs e)
    {
        txtValorAmpliacionSCub.Text = Convert.ToString(Convert.ToDouble(txtAmpliacionSCub.Text) * Convert.ToDouble(lblAmpliacionSCub.Text));
        txtImporteAmpliacionSCub.Text = Convert.ToString(Convert.ToDouble(txtValorAmpliacionSCub.Text) * Convert.ToDouble(lblAmpliacionSCubTasa.Text));
        txtSubTotalAmpliacionSCub.Text = txtImporteAmpliacionSCub.Text;
        sumaTotal();
    }
    protected void txtValorDemolicion_TextChanged(object sender, EventArgs e)
    {
        txtImporteDemolicion.Text = Convert.ToString(Convert.ToDouble(txtValorDemolicion.Text) * Convert.ToDouble(lblDemolicionTasa.Text));
        txtSubTotalDemolicion.Text = txtImporteDemolicion.Text;
        sumaTotal();
    }
    protected void txtValorModificacionInterna_TextChanged(object sender, EventArgs e)
    {
        txtImporteModificionInterna.Text = Convert.ToString(Convert.ToDouble(txtValorModificacionInterna.Text) * Convert.ToDouble(lblModificacionInternaTasa.Text));
        txtSubTotalModificionInterna.Text = txtImporteModificionInterna.Text;
        sumaTotal();
    }
    protected void txtValorPileta_TextChanged(object sender, EventArgs e)
    {
        if (Convert.ToDouble(txtValorPileta.Text) * Convert.ToDouble(lblPiletaTasa.Text) < 2000)
        {
            txtimportePileta.Text = "3350";
        }
        else
        {
            txtimportePileta.Text = Convert.ToString(Convert.ToDouble(txtValorPileta.Text) * Convert.ToDouble(lblPiletaTasa.Text));
        }
        if (txtValorPileta.Text  == "0")
        {
            txtimportePileta.Text = "0";
        }
        txtSubTotalPileta.Text = txtimportePileta.Text;
        sumaTotal();
    }

    protected void txtsubsistenciaCub_TextChanged(object sender, EventArgs e)
    {
        txtValorSubsistenciaCub.Text = Convert.ToString(Convert.ToDouble(txtsubsistenciaCub.Text) * Convert.ToDouble(lblsubsistenciaCub.Text));
        txtImporteSubsistenciaCub.Text = Convert.ToString(Convert.ToDouble(txtValorSubsistenciaCub.Text) * Convert.ToDouble(lblSubsistenciaCubTasa.Text));
        txtRecargoSubsistenciaCub.Text = Convert.ToString(Convert.ToDouble(txtImporteSubsistenciaCub.Text) * Convert.ToDouble(lblSubsistenciaCubTasaRecargo.Text));
        txtExistenteSubtotalObraNuevaCub.Text = Convert.ToString(Convert.ToDouble(txtImporteSubsistenciaCub.Text) + Convert.ToDouble(txtRecargoSubsistenciaCub.Text));
        sumaTotal();
    }
    protected void txtSubsistenciaSCub_TextChanged(object sender, EventArgs e)
    {
        txtValorSubsistenciaSCub.Text = Convert.ToString(Convert.ToDouble(txtSubsistenciaSCub.Text) * Convert.ToDouble(lblSubsistenciaSCub.Text));
        txtImporteSubsistenciaSCub.Text = Convert.ToString(Convert.ToDouble(txtValorSubsistenciaSCub.Text) * Convert.ToDouble(lblSubsistenciaSCubTasa.Text));
        txtRecargoSubsistenciaSCub.Text = Convert.ToString(Convert.ToDouble(txtImporteSubsistenciaSCub.Text) * Convert.ToDouble(lblSubsistenciaSCubTasaRecargo.Text));
        txtExistenteSubTotalObraNuevaSCub.Text = Convert.ToString(Convert.ToDouble(txtImporteSubsistenciaSCub.Text) + Convert.ToDouble(txtRecargoSubsistenciaSCub.Text));
        sumaTotal();
    }
    protected void txtConformeObraCub_TextChanged(object sender, EventArgs e)
    {
        txtValorConformeObraCub.Text = Convert.ToString(Convert.ToDouble(txtConformeObraCub.Text) * Convert.ToDouble(lblConformeObraCub.Text));
        txtImporteConformeObraCub.Text = Convert.ToString(Convert.ToDouble(txtValorConformeObraCub.Text) * Convert.ToDouble(lblConformeObraCubTasa.Text));
        txtRecargoConformeObraCub.Text = Convert.ToString(Convert.ToDouble(txtImporteConformeObraCub.Text) * Convert.ToDouble(lblConformeObraCubTasaRecargo.Text));
        txtExistenteSubTotalAmpliacionCub.Text = Convert.ToString(Convert.ToDouble(txtImporteConformeObraCub.Text) + Convert.ToDouble(txtRecargoConformeObraCub.Text));
        sumaTotal();
    }
    protected void txtConformeObraSCub_TextChanged(object sender, EventArgs e)
    {
        txtValorConformeObraSCub.Text = Convert.ToString(Convert.ToDouble(txtConformeObraSCub.Text) * Convert.ToDouble(lblConformeObraSCub.Text));
        txtImporteConformeObraSCub.Text = Convert.ToString(Convert.ToDouble(txtValorConformeObraSCub.Text) * Convert.ToDouble(lblConformeObraSCubTasa.Text));
        txtRecargoConformeObraSCub.Text = Convert.ToString(Convert.ToDouble(txtImporteConformeObraSCub.Text) * Convert.ToDouble(lblConformeObraSCubTasaRecargo.Text));
        txtExistenteSubTotalAmpliacionSCub.Text = Convert.ToString(Convert.ToDouble(txtImporteConformeObraSCub.Text) + Convert.ToDouble(txtRecargoConformeObraSCub.Text));
        sumaTotal();
    }

    protected void txtValorExistenteDemolicion_TextChanged(object sender, EventArgs e)
    {
        txtImporteExistenteDemolicion.Text = Convert.ToString(Convert.ToDouble(txtValorExistenteDemolicion.Text) * Convert.ToDouble(lblExistenteDemolicionTasa.Text));
        txtRecargoExistenteDemolicion.Text = Convert.ToString(Convert.ToDouble(txtImporteExistenteDemolicion.Text) * Convert.ToDouble(lblExistenteDemolicionTasaRecargo.Text));
        txtExistenteSubTotalDemolicion.Text = Convert.ToString(Convert.ToDouble(txtImporteExistenteDemolicion.Text) + Convert.ToDouble(txtRecargoExistenteDemolicion.Text));
        sumaTotal();
    }
    protected void txtValorExistenteModificacionInterna_TextChanged(object sender, EventArgs e)
    {
        txtImporteExistenteModificionInterna.Text = Convert.ToString(Convert.ToDouble(txtValorExistenteModificacionInterna.Text) * Convert.ToDouble(lblExistenteModificacionInternaTasa.Text));
        txtRecargoExistenteModificionInterna.Text = Convert.ToString(Convert.ToDouble(txtImporteExistenteModificionInterna.Text) * Convert.ToDouble(lblExistenteModificacionInternaTasaRecargo.Text));
        txtExistenteSubTotalModificionInterna.Text = Convert.ToString(Convert.ToDouble(txtImporteExistenteModificionInterna.Text) + Convert.ToDouble(txtRecargoExistenteModificionInterna.Text));
        sumaTotal();
    }
    protected void txtValorExistentePileta_TextChanged(object sender, EventArgs e)
    {
        if(Convert.ToDouble(txtValorExistentePileta.Text) * Convert.ToDouble(lblExistentePiletaTasa.Text)<2000)
        {
        txtimporteExistentePileta.Text="3350";
        }
        else{
        txtimporteExistentePileta.Text = Convert.ToString(Convert.ToDouble(txtValorExistentePileta.Text) * Convert.ToDouble(lblExistentePiletaTasa.Text));
        }
        txtRecargoExistentePileta.Text = Convert.ToString(Convert.ToDouble(txtimporteExistentePileta.Text) * Convert.ToDouble(lblExistentePiletaTasaRecargo.Text));
        txtExistenteSubTotalPileta.Text = Convert.ToString(Convert.ToDouble(txtimporteExistentePileta.Text) + Convert.ToDouble(txtRecargoExistentePileta.Text));
        sumaTotal();
    }
    protected void sumaTotal()
    {
        try
        {
            txtTotalPagar.Text = Convert.ToString(Convert.ToDouble(txtSubtotalObraNuevaCub.Text) + Convert.ToDouble(txtSubTotalObraNuevaSCub.Text) + Convert.ToDouble(txtSubTotalAmpliacionCub.Text) + Convert.ToDouble(txtSubTotalAmpliacionSCub.Text) + Convert.ToDouble(txtSubTotalDemolicion.Text) + Convert.ToDouble(txtSubTotalModificionInterna.Text) + Convert.ToDouble(txtSubTotalPileta.Text) + Convert.ToDouble(txtExistenteSubtotalObraNuevaCub.Text) + Convert.ToDouble(txtExistenteSubTotalObraNuevaSCub.Text) + Convert.ToDouble(txtExistenteSubTotalAmpliacionCub.Text) + Convert.ToDouble(txtExistenteSubTotalAmpliacionSCub.Text) + Convert.ToDouble(txtExistenteSubTotalDemolicion.Text) + Convert.ToDouble(txtExistenteSubTotalModificionInterna.Text) + Convert.ToDouble(txtExistenteSubTotalPileta.Text) + Convert.ToDouble(txtEspecialCubSubtotal.Text) + Convert.ToDouble(txtEspecialScubSubtotal.Text) + Convert.ToDouble(txtMultifamiliarSubtotal.Text) + Convert.ToDouble(txtGaleriasSubtotal.Text) + Convert.ToDouble(txtIndustriaSubtotal.Text) + Convert.ToDouble(txtEmprendimientosUrbanosSubtotal.Text) + Convert.ToDouble(txtAmbientalCubSubtotal.Text) + Convert.ToDouble(txtAmbientalScubSubtotal.Text) + Convert.ToDouble(txtCanchaTenisValorTotal.Text) + Convert.ToDouble(txtCanchapaddleValorTotal.Text));           
            borrarboton();
        }
        catch { }
    }
    public DataSet ordenanzaFiscal(DataSet Ordenanza, string categoria)
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        comando = objeto.ArmarParametrosCategorias(comando, categoria);
        objeto.agregar_tabla_dataset_SP("SPseleccionarOrdenanzaFis", comando, Ordenanza);     
        return Ordenanza;
    }
    protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet Ordenanza = new DataSet();
        ordenanzaFiscal(Ordenanza, ddlCategoria.Text);
        cargarOrdenanza(Ordenanza);
    }
    protected void cargarOrdenanza(DataSet Ordenanza)
    {
        DataTable tabla = new DataTable();
        tabla = Ordenanza.Tables[0];
        if (ddlTipo.SelectedValue == "1")
        {
            lblObraNuevaCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblObraNuevaSCub.Text = (Convert.ToString(Convert.ToDouble(tabla.Rows[0][1]) * 0.5));
            lblAmpliacionCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblAmpliacionSCub.Text = (Convert.ToString(Convert.ToDouble(tabla.Rows[0][1]) * 0.5));
            lblsubsistenciaCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblSubsistenciaSCub.Text = (Convert.ToString(Convert.ToDouble(tabla.Rows[0][1]) * 0.5));
            lblConformeObraCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblConformeObraSCub.Text = (Convert.ToString(Convert.ToDouble(tabla.Rows[0][1]) * 0.5));
        }
        else
        {
            lblObraNuevaCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblObraNuevaSCub.Text = (Convert.ToString(Convert.ToDouble(tabla.Rows[0][2]) * 0.5));
            lblAmpliacionCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblAmpliacionSCub.Text = (Convert.ToString(Convert.ToDouble(tabla.Rows[0][2]) * 0.5));
            lblsubsistenciaCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblSubsistenciaSCub.Text = (Convert.ToString(Convert.ToDouble(tabla.Rows[0][2]) * 0.5));
            lblConformeObraCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblConformeObraSCub.Text = (Convert.ToString(Convert.ToDouble(tabla.Rows[0][2]) * 0.5));
        }
        lblcat.Text = ddlCategoria.SelectedItem.Text;
        lblVivienda.Text = ddlTipo.SelectedItem.Text.ToUpper();
        lblvalor.Text = lblObraNuevaCub.Text;
    }
    protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet Ordenanza = new DataSet();
        ordenanzaFiscal(Ordenanza, ddlCategoria.Text);
        cargarOrdenanza(Ordenanza);
    }
    protected void BtnLiquidar_Click(object sender, EventArgs e)
    {
        Funciones Objeto = new Funciones();        
        SqlCommand comando = new SqlCommand();
        SqlCommand comandoTigre = new SqlCommand();
        DataSet Ds = new DataSet();
        DataSet DsTigre = new DataSet();        
        DataTable dt = new DataTable();
        DataTable dtTigre = new DataTable();
        Double total;
        Double totalreciduosAridos;
        Double totalfondomunicipalvivienda;
        ValidarCamposVacios();        
        total = Convert.ToDouble(txtSubtotalObraNuevaCub.Text) + Convert.ToDouble(txtSubTotalObraNuevaSCub.Text) + Convert.ToDouble(txtSubTotalAmpliacionCub.Text) + Convert.ToDouble(txtSubTotalAmpliacionSCub.Text) + Convert.ToDouble(txtSubTotalDemolicion.Text) + Convert.ToDouble(txtSubTotalModificionInterna.Text) + Convert.ToDouble(txtSubTotalPileta.Text) + Convert.ToDouble(txtExistenteSubtotalObraNuevaCub.Text) + Convert.ToDouble(txtExistenteSubTotalObraNuevaSCub.Text) + Convert.ToDouble(txtExistenteSubTotalAmpliacionCub.Text) + Convert.ToDouble(txtExistenteSubTotalAmpliacionSCub.Text) + Convert.ToDouble(txtExistenteSubTotalDemolicion.Text) + Convert.ToDouble(txtExistenteSubTotalModificionInterna.Text) + Convert.ToDouble(txtExistenteSubTotalPileta.Text) + Convert.ToDouble(txtEspecialCubSubtotal.Text) + Convert.ToDouble(txtEspecialScubSubtotal.Text) + Convert.ToDouble(txtCanchaTenisValorTotal.Text) + Convert.ToDouble(txtCanchapaddleValorTotal.Text);
        totalreciduosAridos = Convert.ToDouble(txtAmbientalCubSubtotal.Text) + Convert.ToDouble(txtAmbientalScubSubtotal.Text);
        totalfondomunicipalvivienda = Convert.ToDouble(txtMultifamiliarSubtotal.Text) + Convert.ToDouble(txtGaleriasSubtotal.Text) + Convert.ToDouble(txtIndustriaSubtotal.Text) + Convert.ToDouble(txtEmprendimientosUrbanosSubtotal.Text);
        if (BtnLiquidar.Text == "LIQUIDAR PAGO")
        {
            try
            {
                comando = Objeto.ArmarParametrosLiquidacionDerechosConstruccion(comando, ddlCategoria.Text, ddlTipo.Text, Convert.ToDouble(lblvalor.Text), Convert.ToDouble(txtObraNuevaCub.Text), Convert.ToDouble(txtObraNuevaSCub.Text), Convert.ToDouble(txtAmpliacionCub.Text), Convert.ToDouble(txtAmpliacionSCub.Text), Convert.ToDouble(txtValorObraNuevaCub.Text), Convert.ToDouble(txtValorObraNuevaSCub.Text), Convert.ToDouble(txtValorAmpliacionCub.Text), Convert.ToDouble(txtValorAmpliacionSCub.Text), Convert.ToDouble(txtValorDemolicion.Text), Convert.ToDouble(txtValorModificacionInterna.Text), Convert.ToDouble(txtValorPileta.Text), Convert.ToDouble(txtImporteObraNuevaCub.Text), Convert.ToDouble(txtImporteObraNuevaSCub.Text), Convert.ToDouble(txtImporteAmpliacionCub.Text), Convert.ToDouble(txtImporteAmpliacionSCub.Text), Convert.ToDouble(txtImporteDemolicion.Text), Convert.ToDouble(txtImporteModificionInterna.Text), Convert.ToDouble(txtimportePileta.Text), Convert.ToDouble(txtSubtotalObraNuevaCub.Text), Convert.ToDouble(txtSubTotalObraNuevaSCub.Text), Convert.ToDouble(txtSubTotalAmpliacionCub.Text), Convert.ToDouble(txtSubTotalAmpliacionSCub.Text), Convert.ToDouble(txtSubTotalDemolicion.Text), Convert.ToDouble(txtSubTotalModificionInterna.Text), Convert.ToDouble(txtSubTotalPileta.Text), Convert.ToDouble(txtsubsistenciaCub.Text), Convert.ToDouble(txtSubsistenciaSCub.Text), Convert.ToDouble(txtConformeObraCub.Text), Convert.ToDouble(txtConformeObraSCub.Text), Convert.ToDouble(txtValorSubsistenciaCub.Text), Convert.ToDouble(txtValorSubsistenciaSCub.Text), Convert.ToDouble(txtValorConformeObraCub.Text), Convert.ToDouble(txtValorConformeObraSCub.Text), Convert.ToDouble(txtValorExistenteDemolicion.Text), Convert.ToDouble(txtValorExistenteModificacionInterna.Text), Convert.ToDouble(txtValorExistentePileta.Text), Convert.ToDouble(txtImporteSubsistenciaCub.Text), Convert.ToDouble(txtImporteSubsistenciaSCub.Text), Convert.ToDouble(txtImporteConformeObraCub.Text), Convert.ToDouble(txtImporteConformeObraSCub.Text), Convert.ToDouble(txtImporteExistenteDemolicion.Text), Convert.ToDouble(txtImporteExistenteModificionInterna.Text), Convert.ToDouble(txtimporteExistentePileta.Text), Convert.ToDouble(txtRecargoSubsistenciaCub.Text), Convert.ToDouble(txtRecargoSubsistenciaSCub.Text), Convert.ToDouble(txtRecargoConformeObraCub.Text), Convert.ToDouble(txtRecargoConformeObraSCub.Text), Convert.ToDouble(txtRecargoExistenteDemolicion.Text), Convert.ToDouble(txtRecargoExistenteModificionInterna.Text), Convert.ToDouble(txtRecargoExistentePileta.Text), Convert.ToDouble(txtExistenteSubtotalObraNuevaCub.Text), Convert.ToDouble(txtExistenteSubTotalObraNuevaSCub.Text), Convert.ToDouble(txtExistenteSubTotalAmpliacionCub.Text), Convert.ToDouble(txtExistenteSubTotalAmpliacionSCub.Text), Convert.ToDouble(txtExistenteSubTotalDemolicion.Text), Convert.ToDouble(txtExistenteSubTotalModificionInterna.Text), Convert.ToDouble(txtExistenteSubTotalPileta.Text), Convert.ToDouble(txtValorEspecialCub.Text), Convert.ToDouble(txtValorEspecialScub.Text), Convert.ToDouble(txtValorMultifamiliar.Text), Convert.ToDouble(txtValorGalerias.Text), Convert.ToDouble(txtValorIndustria.Text), Convert.ToDouble(txtValorEmprendimientosUrbanos.Text), Convert.ToDouble(txtValorAmbientalCub.Text), Convert.ToDouble(txtValorAmbientalScub.Text), Convert.ToDouble(txtEspecialCubImporte.Text), Convert.ToDouble(txtEspecialScubImporte.Text), Convert.ToDouble(txtMultifamiliarImporte.Text), Convert.ToDouble(txtGaleriasImporte.Text), Convert.ToDouble(txtIndustriaImporte.Text), Convert.ToDouble(txtEmprendimientosUrbanosImporte.Text), Convert.ToDouble(txtAmbientalCubImporte.Text), Convert.ToDouble(txtAmbientalScubImporte.Text), Convert.ToDouble(txtEspecialCubSubtotal.Text), Convert.ToDouble(txtEspecialScubSubtotal.Text), Convert.ToDouble(txtMultifamiliarSubtotal.Text), Convert.ToDouble(txtGaleriasSubtotal.Text), Convert.ToDouble(txtIndustriaSubtotal.Text), Convert.ToDouble(txtEmprendimientosUrbanosSubtotal.Text), Convert.ToDouble(txtAmbientalCubSubtotal.Text), Convert.ToDouble(txtAmbientalScubSubtotal.Text), Convert.ToDouble(txtCanchaTenis.Text), Convert.ToDouble(txtCanchapaddle.Text), Convert.ToDouble(txtCanchaTenisValor.Text), Convert.ToDouble(txtCanchapaddleValor.Text), Convert.ToDouble(txtCanchaTenisValorTotal.Text), Convert.ToDouble(txtCanchapaddleValorTotal.Text), Convert.ToDouble(txtTotalPagar.Text), lblNroCuenta.Text);                
                Objeto.Ejecutar_SP_C_Select("SPagregarFormularioDerechoConstruccion", comando, Ds);
                dt = Ds.Tables[0];
                comando.Dispose();
                comandoTigre = Objeto.ArmarParametrosGererarDeuda(comandoTigre, Convert.ToInt32(lblNroCuenta.Text), Convert.ToInt32(dt.Rows[0][0].ToString()), total ,totalfondomunicipalvivienda ,totalreciduosAridos );
                dt.Dispose();                
                Objeto.Ejecutar_SP_C_Select_Tigre("WebDerConstruccion_CtaCte_Ins", comandoTigre, DsTigre);
                dtTigre = DsTigre.Tables[0];
                MostrarCartel("Los Derechos de Construcción fueron liquidados correctamente, podrá imprimir el boleta de pago. Muchas Gracias");
                Response.Redirect(dtTigre.Rows[0][0].ToString());               
            }
            catch
            {
                MostrarCartel("No se lo pudo realizar la Liquidación, comprube que no haya dejado campos blanco y que los valores sean númericos.");
            }
        }
        else
        {
            try
            {
                comando = Objeto.ArmarParametrosLiquidacionDerechosConstruccionUPDATE(comando, Convert.ToInt32(Session["liqui"]), ddlCategoria.Text, ddlTipo.Text, Convert.ToDouble(lblvalor.Text), Convert.ToDouble(txtObraNuevaCub.Text), Convert.ToDouble(txtObraNuevaSCub.Text), Convert.ToDouble(txtAmpliacionCub.Text), Convert.ToDouble(txtAmpliacionSCub.Text), Convert.ToDouble(txtValorObraNuevaCub.Text), Convert.ToDouble(txtValorObraNuevaSCub.Text), Convert.ToDouble(txtValorAmpliacionCub.Text), Convert.ToDouble(txtValorAmpliacionSCub.Text), Convert.ToDouble(txtValorDemolicion.Text), Convert.ToDouble(txtValorModificacionInterna.Text), Convert.ToDouble(txtValorPileta.Text), Convert.ToDouble(txtImporteObraNuevaCub.Text), Convert.ToDouble(txtImporteObraNuevaSCub.Text), Convert.ToDouble(txtImporteAmpliacionCub.Text), Convert.ToDouble(txtImporteAmpliacionSCub.Text), Convert.ToDouble(txtImporteDemolicion.Text), Convert.ToDouble(txtImporteModificionInterna.Text), Convert.ToDouble(txtimportePileta.Text), Convert.ToDouble(txtSubtotalObraNuevaCub.Text), Convert.ToDouble(txtSubTotalObraNuevaSCub.Text), Convert.ToDouble(txtSubTotalAmpliacionCub.Text), Convert.ToDouble(txtSubTotalAmpliacionSCub.Text), Convert.ToDouble(txtSubTotalDemolicion.Text), Convert.ToDouble(txtSubTotalModificionInterna.Text), Convert.ToDouble(txtSubTotalPileta.Text), Convert.ToDouble(txtsubsistenciaCub.Text), Convert.ToDouble(txtSubsistenciaSCub.Text), Convert.ToDouble(txtConformeObraCub.Text), Convert.ToDouble(txtConformeObraSCub.Text), Convert.ToDouble(txtValorSubsistenciaCub.Text), Convert.ToDouble(txtValorSubsistenciaSCub.Text), Convert.ToDouble(txtValorConformeObraCub.Text), Convert.ToDouble(txtValorConformeObraSCub.Text), Convert.ToDouble(txtValorExistenteDemolicion.Text), Convert.ToDouble(txtValorExistenteModificacionInterna.Text), Convert.ToDouble(txtValorExistentePileta.Text), Convert.ToDouble(txtImporteSubsistenciaCub.Text), Convert.ToDouble(txtImporteSubsistenciaSCub.Text), Convert.ToDouble(txtImporteConformeObraCub.Text), Convert.ToDouble(txtImporteConformeObraSCub.Text), Convert.ToDouble(txtImporteExistenteDemolicion.Text), Convert.ToDouble(txtImporteExistenteModificionInterna.Text), Convert.ToDouble(txtimporteExistentePileta.Text), Convert.ToDouble(txtRecargoSubsistenciaCub.Text), Convert.ToDouble(txtRecargoSubsistenciaSCub.Text), Convert.ToDouble(txtRecargoConformeObraCub.Text), Convert.ToDouble(txtRecargoConformeObraSCub.Text), Convert.ToDouble(txtRecargoExistenteDemolicion.Text), Convert.ToDouble(txtRecargoExistenteModificionInterna.Text), Convert.ToDouble(txtRecargoExistentePileta.Text), Convert.ToDouble(txtExistenteSubtotalObraNuevaCub.Text), Convert.ToDouble(txtExistenteSubTotalObraNuevaSCub.Text), Convert.ToDouble(txtExistenteSubTotalAmpliacionCub.Text), Convert.ToDouble(txtExistenteSubTotalAmpliacionSCub.Text), Convert.ToDouble(txtExistenteSubTotalDemolicion.Text), Convert.ToDouble(txtExistenteSubTotalModificionInterna.Text), Convert.ToDouble(txtExistenteSubTotalPileta.Text), Convert.ToDouble(txtValorEspecialCub.Text), Convert.ToDouble(txtValorEspecialScub.Text), Convert.ToDouble(txtValorMultifamiliar.Text), Convert.ToDouble(txtValorGalerias.Text), Convert.ToDouble(txtValorIndustria.Text), Convert.ToDouble(txtValorEmprendimientosUrbanos.Text), Convert.ToDouble(txtValorAmbientalCub.Text), Convert.ToDouble(txtValorAmbientalScub.Text), Convert.ToDouble(txtEspecialCubImporte.Text), Convert.ToDouble(txtEspecialScubImporte.Text), Convert.ToDouble(txtMultifamiliarImporte.Text), Convert.ToDouble(txtGaleriasImporte.Text), Convert.ToDouble(txtIndustriaImporte.Text), Convert.ToDouble(txtEmprendimientosUrbanosImporte.Text), Convert.ToDouble(txtAmbientalCubImporte.Text), Convert.ToDouble(txtAmbientalScubImporte.Text), Convert.ToDouble(txtEspecialCubSubtotal.Text), Convert.ToDouble(txtEspecialScubSubtotal.Text), Convert.ToDouble(txtMultifamiliarSubtotal.Text), Convert.ToDouble(txtGaleriasSubtotal.Text), Convert.ToDouble(txtIndustriaSubtotal.Text), Convert.ToDouble(txtEmprendimientosUrbanosSubtotal.Text), Convert.ToDouble(txtAmbientalCubSubtotal.Text), Convert.ToDouble(txtAmbientalScubSubtotal.Text), Convert.ToDouble(txtCanchaTenis.Text), Convert.ToDouble(txtCanchapaddle.Text), Convert.ToDouble(txtCanchaTenisValor.Text), Convert.ToDouble(txtCanchapaddleValor.Text), Convert.ToDouble(txtCanchaTenisValorTotal.Text), Convert.ToDouble(txtCanchapaddleValorTotal.Text), Convert.ToDouble(txtTotalPagar.Text), lblNroCuenta.Text);
                Objeto.EjecutarSp("SPactualizarFormularioDerechosConstruccion", comando);
                comandoTigre = Objeto.ArmarParametrosGererarDeuda(comandoTigre, Convert.ToInt32(lblNroCuenta.Text), Convert.ToInt32(Session["liqui"]), total,totalfondomunicipalvivienda,totalreciduosAridos );
                dt.Dispose();               
                Objeto.Ejecutar_SP_C_Select_Tigre("WebDerConstruccion_CtaCte_Ins", comandoTigre, DsTigre);
                dtTigre = DsTigre.Tables[0];      
                MostrarCartel("Los Derechos de Construcción fueron actualizados correctamente, podrá imprimir el boleta de pago. Muchas Gracias");
                Response.Redirect(dtTigre.Rows[0][0].ToString());
            }
            catch
            {
                MostrarCartel("No se lo pudo realizar la Actualización , comprube que no haya dejado campos blanco y que los valores sean númericos.");
            }
        }
    }
    protected void ValidarCamposVacios()
    {
        if (txtObraNuevaCub.Text == "")
        {
            txtObraNuevaCub.Text = "0";
        }
        if (txtsubsistenciaCub.Text == "")
        {
            txtsubsistenciaCub.Text = "0";
        }
        if (txtObraNuevaSCub.Text == "")
        {
            txtObraNuevaSCub.Text = "0";
        }
        if (txtAmpliacionCub.Text == "")
        {
            txtAmpliacionCub.Text = "0";
        }
        if (txtAmpliacionSCub.Text == "")
        {
            txtAmpliacionSCub.Text = "0";
        }
        if (txtValorDemolicion.Text == "")
        {
            txtValorDemolicion.Text = "0";
        }
        if (txtValorModificacionInterna.Text == "")
        {
            txtValorModificacionInterna.Text = "0";
        }
        if (txtValorPileta.Text == "")
        {
            txtValorPileta.Text = "0";
        }
        if (txtsubsistenciaCub.Text == "")
        {
            txtsubsistenciaCub.Text = "0";
        }
        if (txtSubsistenciaSCub.Text == "")
        {
            txtSubsistenciaSCub.Text = "0";
        }
        if (txtConformeObraCub.Text == "")
        {
            txtConformeObraCub.Text = "0";
        }
        if (txtConformeObraSCub.Text == "")
        {
            txtConformeObraSCub.Text = "0";
        }
        if (txtValorExistenteDemolicion.Text == "")
        {
            txtValorExistenteDemolicion.Text = "0";
        }
        if (txtValorExistenteModificacionInterna.Text == "")
        {
            txtValorExistenteModificacionInterna.Text = "0";
        }
        if (txtValorExistentePileta.Text == "")
        {
            txtValorExistentePileta.Text = "0";
        }
        if (txtValorEspecialCub.Text == "")
        {
            txtValorEspecialCub.Text = "0";
        }
        if (txtValorEspecialScub.Text == "")
        {
            txtValorEspecialScub.Text = "0";
        }
        if (txtValorMultifamiliar.Text == "")
        {
            txtValorMultifamiliar.Text = "0";
        }
        if (txtValorGalerias.Text == "")
        {
            txtValorGalerias.Text = "0";
        }
        if (txtValorIndustria.Text == "")
        {
            txtValorIndustria.Text = "0";
        }
        if (txtValorEmprendimientosUrbanos.Text == "")
        {
            txtValorEmprendimientosUrbanos.Text = "0";
        }
        if (txtValorAmbientalCub.Text == "")
        {
            txtValorAmbientalCub.Text = "0";
        }
        if (txtValorAmbientalScub.Text == "")
        {
            txtValorAmbientalScub.Text = "0";
        }
        //--------------------------------------
        if (txtValorObraNuevaCub.Text == "")
        {
            txtValorObraNuevaCub.Text = "0";
        }
        if (txtValorObraNuevaSCub.Text == "")
        {
            txtValorObraNuevaSCub.Text = "0";
        }
        if (txtValorAmpliacionCub.Text == "")
        {
            txtValorAmpliacionCub.Text = "0";
        }
        if (txtValorAmpliacionSCub.Text == "")
        {
            txtValorAmpliacionSCub.Text = "0";
        }
        if (txtImporteObraNuevaCub.Text == "")
        {
            txtImporteObraNuevaCub.Text = "0";
        }
        if (txtImporteObraNuevaSCub.Text == "")
        {
            txtImporteObraNuevaSCub.Text = "0";
        }
        if (txtImporteAmpliacionCub.Text == "")
        {
            txtImporteAmpliacionCub.Text = "0";
        }
        if (txtImporteAmpliacionSCub.Text == "")
        {
            txtImporteAmpliacionSCub.Text = "0";
        }
        if (txtImporteDemolicion.Text == "")
        {
            txtImporteDemolicion.Text = "0";
        }
        if (txtImporteModificionInterna.Text == "")
        {
            txtImporteModificionInterna.Text = "0";
        }
        if (txtimportePileta.Text == "")
        {
            txtimportePileta.Text = "0";
        }
        if (txtCanchaTenis.Text == "")
        {
            txtCanchaTenis.Text = "0";
        }
        if (txtCanchapaddle.Text == "")
        {
            txtCanchapaddle.Text = "0";
        }    
    }
    protected DataSet cargarLiquidacionDerechoConstrucion(Int32 liquidacion, DateTime fecha)
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();      
        DataSet liqui = new DataSet();
        comando = objeto.ArmarParametrosCargaLiquidacion(comando, lblNroCuenta.Text,liquidacion,fecha);
        objeto.agregar_tabla_dataset_SP("SPseleccionarLiquidacionDerechoConstruccion", comando, liqui);      
        return liqui;
    }
    protected void llenarcamposLiquidacion(Int32 liqui, DateTime fecha)
    {
        DataSet liquidacion = new DataSet();
        DataTable tabla = new DataTable();
        liquidacion=cargarLiquidacionDerechoConstrucion(liqui,fecha);
        tabla = liquidacion.Tables[0];
        txtObraNuevaCub.Text = tabla.Rows[0]["nuevaObranueva_Cub"].ToString() ;
        txtObraNuevaSCub.Text = tabla.Rows[0]["nuevaObranueva_Scub"].ToString();
        txtAmpliacionCub.Text = tabla.Rows[0]["nuevaAmpliacion_Cub"].ToString();
        txtAmpliacionSCub.Text = tabla.Rows[0]["nuevaAmpliacion_Scub"].ToString();
        txtValorObraNuevaCub.Text = tabla.Rows[0]["nuevaObranuevaCub_Valor"].ToString();
        txtValorObraNuevaSCub.Text = tabla.Rows[0]["nuevaObranuevaScub_Valor"].ToString();
        txtValorAmpliacionCub.Text = tabla.Rows[0]["nuevaAmpliacionCub_Valor"].ToString();
        txtValorAmpliacionSCub.Text = tabla.Rows[0]["nuevaAmpliacionScub_Valor"].ToString();
        txtValorDemolicion.Text = tabla.Rows[0]["nuevaDemolicion_Valor"].ToString();
        txtValorModificacionInterna.Text = tabla.Rows[0]["nuevaModificacionInterna_Valor"].ToString();
        txtValorPileta.Text = tabla.Rows[0]["nuevaPileta_Valor"].ToString();
        txtImporteObraNuevaCub.Text = tabla.Rows[0]["nuevaObranuevaCub_Importe"].ToString();
        txtImporteObraNuevaSCub.Text = tabla.Rows[0]["nuevaObranuevaScub_Importe"].ToString();
        txtImporteAmpliacionCub.Text = tabla.Rows[0]["nuevaAmpliacionCub_Importe"].ToString();
        txtImporteAmpliacionSCub.Text = tabla.Rows[0]["nuevaAmpliacionScub_Importe"].ToString();
        txtImporteDemolicion.Text = tabla.Rows[0]["nuevaDemolicion_Importe"].ToString();
        txtImporteModificionInterna.Text = tabla.Rows[0]["nuevaModificacionInterna_Importe"].ToString();
        txtimportePileta.Text = tabla.Rows[0]["nuevaPileta_Importe"].ToString();
        txtSubtotalObraNuevaCub.Text = ControlVacio(tabla.Rows[0]["nuevaObranuevaCub_Subtotal"].ToString());
        txtSubTotalObraNuevaSCub.Text  = ControlVacio(tabla.Rows[0]["nuevaObranuevaScub_Subtotal"].ToString());
        txtSubTotalAmpliacionCub.Text = ControlVacio(tabla.Rows[0]["nuevaAmpliacionCub_Subtotal"].ToString());
        txtSubTotalAmpliacionSCub.Text = ControlVacio(tabla.Rows[0]["nuevaAmpliacionScub_Subtotal"].ToString());
        txtSubTotalDemolicion.Text = ControlVacio(tabla.Rows[0]["nuevaDemolicion_Subtotal"].ToString());
        txtSubTotalModificionInterna.Text = ControlVacio(tabla.Rows[0]["nuevaModificacionInterna_Subtotal"].ToString());
        txtSubTotalPileta.Text = ControlVacio(tabla.Rows[0]["nuevaPileta_Subtotal"].ToString());
        txtsubsistenciaCub.Text = tabla.Rows[0]["existenteSubsistencia_Cub"].ToString();
        txtSubsistenciaSCub.Text = tabla.Rows[0]["existenteSubsistencia_Scub"].ToString();
        txtConformeObraCub.Text = tabla.Rows[0]["existenteConformeObra_Cub"].ToString();
        txtConformeObraSCub.Text = tabla.Rows[0]["existenteConformeObra_Scub"].ToString();
        txtValorSubsistenciaCub.Text = tabla.Rows[0]["existenteSubsistenciaCub_Valor"].ToString();
        txtValorSubsistenciaSCub.Text = tabla.Rows[0]["existenteSubsistenciaScub_Valor"].ToString();
        txtValorConformeObraCub.Text = tabla.Rows[0]["existenteConformeObraCub_Valor"].ToString();
        txtValorConformeObraSCub.Text = tabla.Rows[0]["existenteConformeObraScub_Valor"].ToString();
        txtValorExistenteDemolicion.Text = tabla.Rows[0]["existenteDemolicion_Valor"].ToString();
        txtValorExistenteModificacionInterna.Text = tabla.Rows[0]["existenteModificacionInterna_Valor"].ToString();
        txtValorExistentePileta.Text = tabla.Rows[0]["existentePileta_Valor"].ToString();
        txtImporteSubsistenciaCub.Text = tabla.Rows[0]["existenteSubsistenciaCub_Importe"].ToString();
        txtImporteSubsistenciaSCub.Text = tabla.Rows[0]["existenteSubsistenciaScub_Importe"].ToString();
        txtImporteConformeObraCub.Text = tabla.Rows[0]["existenteConformeObraCub_Importe"].ToString();
        txtImporteConformeObraSCub.Text = tabla.Rows[0]["existenteConformeObraScub_Importe"].ToString();
        txtImporteExistenteDemolicion.Text = tabla.Rows[0]["existenteDemolicion_Importe"].ToString();
        txtImporteExistenteModificionInterna.Text = tabla.Rows[0]["existenteModificacionInterna_Importe"].ToString();
        txtimporteExistentePileta.Text = tabla.Rows[0]["existentePileta_Importe"].ToString();
        txtRecargoSubsistenciaCub.Text = tabla.Rows[0]["existenteSubsistenciaCub_Recargo"].ToString();
        txtRecargoSubsistenciaSCub.Text = tabla.Rows[0]["existenteSubsistenciaScub_Recargo"].ToString();
        txtRecargoConformeObraCub.Text = tabla.Rows[0]["existenteConformeObraCub_Recargo"].ToString();
        txtRecargoConformeObraSCub.Text = tabla.Rows[0]["existenteConformeObraScub_Recargo"].ToString();
        txtRecargoExistenteDemolicion.Text = tabla.Rows[0]["existenteDemolicion_Recargo"].ToString();
        txtRecargoExistenteModificionInterna.Text = tabla.Rows[0]["existenteModificacionInterna_Recargo"].ToString();
        txtRecargoExistentePileta.Text = tabla.Rows[0]["existentePileta_Recargo"].ToString();
        txtExistenteSubtotalObraNuevaCub.Text = ControlVacio(tabla.Rows[0]["existenteSubsistenciaCub_Subtotal"].ToString());
        txtExistenteSubTotalObraNuevaSCub.Text = ControlVacio(tabla.Rows[0]["existenteSubsistenciaScub_Subtotal"].ToString());
        txtExistenteSubTotalAmpliacionCub.Text = ControlVacio(tabla.Rows[0]["existenteConformeObraCub_Subtotal"].ToString());
        txtExistenteSubTotalAmpliacionSCub.Text = ControlVacio(tabla.Rows[0]["existenteConformeObraScub_Subtotal"].ToString());
        txtExistenteSubTotalDemolicion.Text = ControlVacio(tabla.Rows[0]["existenteDemolicion_Subtotal"].ToString());
        txtExistenteSubTotalModificionInterna.Text = ControlVacio(tabla.Rows[0]["existenteModificacionInterna_Subtotal"].ToString());
        txtExistenteSubTotalPileta.Text = ControlVacio(tabla.Rows[0]["existentePileta_Subtotal"].ToString());
        txtValorEspecialCub.Text = tabla.Rows[0]["especialCubValor"].ToString();
        txtValorEspecialScub.Text = tabla.Rows[0]["especialScubValor"].ToString();
        txtValorMultifamiliar.Text = tabla.Rows[0]["multifamiliarValor"].ToString();
        txtValorGalerias.Text = tabla.Rows[0]["galeriasValor"].ToString();
        txtValorIndustria.Text = tabla.Rows[0]["industriaValor"].ToString();
        txtValorEmprendimientosUrbanos.Text = tabla.Rows[0]["emprendimientosUrbanosValor"].ToString();
        txtValorAmbientalCub.Text = tabla.Rows[0]["ambientalCubValor"].ToString();
        txtValorAmbientalScub.Text = tabla.Rows[0]["ambientalScubValor"].ToString();
        txtEspecialCubImporte.Text = tabla.Rows[0]["especialCubImporte"].ToString();
        txtEspecialScubImporte.Text = tabla.Rows[0]["especialScubImporte"].ToString();
        txtMultifamiliarImporte.Text = tabla.Rows[0]["multifamiliarImporte"].ToString();
        txtGaleriasImporte.Text = tabla.Rows[0]["galeriasImporte"].ToString();
        txtIndustriaImporte.Text = tabla.Rows[0]["industriaImporte"].ToString();
        txtEmprendimientosUrbanosImporte.Text = tabla.Rows[0]["emprendimientosUrbanosImporte"].ToString();
        txtAmbientalCubImporte.Text = tabla.Rows[0]["ambientalCubImporte"].ToString();
        txtAmbientalScubImporte.Text = tabla.Rows[0]["ambientalScubImporte"].ToString();        
        txtEspecialCubSubtotal.Text = ControlVacio(tabla.Rows[0]["especialCubSubtotal"].ToString());
        txtEspecialScubSubtotal.Text = ControlVacio(tabla.Rows[0]["especialScubSubtotal"].ToString());
        txtMultifamiliarSubtotal.Text = ControlVacio(tabla.Rows[0]["multifamiliarSubtotal"].ToString());
        txtGaleriasSubtotal.Text = ControlVacio(tabla.Rows[0]["galeriasSubtotal"].ToString());
        txtIndustriaSubtotal.Text = ControlVacio(tabla.Rows[0]["industriaSubtotal"].ToString());
        txtEmprendimientosUrbanosSubtotal.Text = ControlVacio(tabla.Rows[0]["emprendimientosUrbanosSubtotal"].ToString());
        txtAmbientalCubSubtotal.Text = ControlVacio(tabla.Rows[0]["ambientalCubSubtotal"].ToString());
        txtAmbientalScubSubtotal.Text = ControlVacio(tabla.Rows[0]["ambientalScubSubtotal"].ToString());
        txtCanchaTenis.Text = tabla.Rows[0]["canchaTenis"].ToString();
        txtCanchapaddle.Text = tabla.Rows[0]["canchaPaddle"].ToString();
        txtCanchaTenisValor.Text = tabla.Rows[0]["canchaTenisValor"].ToString();
        txtCanchapaddleValor.Text = tabla.Rows[0]["canchaPaddleValor"].ToString();
        txtCanchaTenisValorTotal.Text = ControlVacio(tabla.Rows[0]["canchaTenisSubtotal"].ToString());
        txtCanchapaddleValorTotal.Text = ControlVacio(tabla.Rows[0]["canchaPaddleSubtotal"].ToString());
        txtTotalPagar.Text = tabla.Rows[0]["totalPagar"].ToString();
        BtnLiquidar.Text = "ACTUALIZAR LIQUIDACIÓN";
    }
    protected void btnCargar_Click(object sender, EventArgs e)
    {
        Int32 liquidacion;
        DateTime fecha;
        liquidacion=Convert.ToInt32(RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["idLiquidacion"].Text);       
        fecha = Convert.ToDateTime(RadGrid1.MasterTableView.Items[RadGrid1.SelectedIndexes[0].ToString()]["fecha"].Text);  
        Session["liqui"] = liquidacion;
        llenarcamposLiquidacion(liquidacion, fecha);
    }
    protected void txtValorSubsistenciaCub_TextChanged(object sender, EventArgs e)
    {       
    }
    protected void txtValorEspecialCub_TextChanged(object sender, EventArgs e)
    {
        txtEspecialCubImporte.Text = Convert.ToString(Convert.ToDouble(txtValorEspecialCub.Text) * Convert.ToDouble(lblEspecialCubTasa.Text));
        txtEspecialCubSubtotal.Text = txtEspecialCubImporte.Text;
        sumaTotal();
    }
    protected void txtValorEspecialScub_TextChanged(object sender, EventArgs e)
    {
        txtEspecialScubImporte.Text = Convert.ToString(Convert.ToDouble(txtValorEspecialScub.Text) * Convert.ToDouble(lblEspecialScubTasa.Text));
        txtEspecialScubSubtotal.Text = txtEspecialScubImporte.Text;
        sumaTotal();
    }
    protected void txtValorMultifamiliar_TextChanged(object sender, EventArgs e)
    {
        txtMultifamiliarImporte.Text = Convert.ToString(Convert.ToDouble(txtValorMultifamiliar.Text) * Convert.ToDouble(lblMultifamiliarTasa.Text));
        txtMultifamiliarSubtotal.Text = txtMultifamiliarImporte.Text;
        sumaTotal();
    }
    protected void txtValorGalerias_TextChanged(object sender, EventArgs e)
    {
        txtGaleriasImporte.Text = Convert.ToString(Convert.ToDouble(txtValorGalerias.Text) * Convert.ToDouble(lblGaleriasTasa.Text));
        txtGaleriasSubtotal.Text = txtGaleriasImporte.Text;
        sumaTotal();
    }
    protected void txtValorIndustria_TextChanged(object sender, EventArgs e)
    {
        txtIndustriaImporte.Text = Convert.ToString(Convert.ToDouble(txtValorIndustria.Text) * Convert.ToDouble(lblIndustriaTasa.Text));
        txtIndustriaSubtotal.Text = txtIndustriaImporte.Text;
        sumaTotal();
    }
    protected void txtValorEmprendimientosUrbanos_TextChanged(object sender, EventArgs e)
    {
        txtEmprendimientosUrbanosImporte.Text = Convert.ToString(Convert.ToDouble(txtValorEmprendimientosUrbanos.Text) * Convert.ToDouble(lblEmprendimientosUrbanosTasa.Text));
        txtEmprendimientosUrbanosSubtotal.Text = txtEmprendimientosUrbanosImporte.Text;
        sumaTotal();
    }
    protected void txtValorAmbientalCub_TextChanged(object sender, EventArgs e)
    {
        txtAmbientalCubImporte.Text = Convert.ToString(Convert.ToDouble(txtValorAmbientalCub.Text) * Convert.ToDouble(lblAmbientalCubTasa.Text));
        txtAmbientalCubSubtotal.Text = txtAmbientalCubImporte.Text;
        sumaTotal();
    }
    protected void txtValorAmbientalScub_TextChanged(object sender, EventArgs e)
    {
        txtAmbientalScubImporte.Text = Convert.ToString(Convert.ToDouble(txtValorAmbientalScub.Text) * Convert.ToDouble(lblAmbientalScubTasa.Text));
        txtAmbientalScubSubtotal.Text = txtAmbientalScubImporte.Text;
        sumaTotal();
    }  
    protected void Button1_Click1(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, GetType(), "mostrar", "OpenConfirm('Esta seguro')", true);
    }
    protected void MostrarCartel(String cartel)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, GetType(), "mostrar", "OpenAlert('"+ cartel +"')", true);
    }
    protected void DefaultHeader_Load(object sender, EventArgs e)
    {
    }
    protected void grabarEstadistica(int valorSP)
    {         
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        DataSet estadistica = new DataSet();
        string sp;
        if (valorSP == 1)
        {
            sp = "SPagregarEstadistica";
        }
        else 
        {
            sp = "SPactualizarEstadistica";
        }
        try
        {
            comando = objeto.ArmarParametrosEstadistica(comando, lblNroCuenta.Text, Convert.ToInt32(txtCantLocales.Text), Convert.ToInt32(txtCantViviendas.Text), Convert.ToInt32(txtCantDormitorios.Text), Convert.ToInt32(txtCantBanos.Text), Convert.ToInt32(ddlDestino.SelectedValue.ToString()), /*Convert.ToInt32(ddlViviendaPropia.SelectedValue.ToString())*/Convert.ToInt32(txtAlturaConstruccion.Text), Convert.ToInt32(ddlFinanciamientoPropio.SelectedValue.ToString()), Convert.ToInt32(ddlDistanciaTransporte.SelectedValue.ToString()), Convert.ToDouble(txtSuperficieConstruir.Text),ddlTipoObra.SelectedValue.ToString());
            objeto.EjecutarSp(sp, comando);
            lblEStadistica.Text = "Se guardaron con exito los datos ingresados";
            lblEStadistica.Visible = true;
        }
        catch 
        {            
            if (valorSP == 1)
            {
                lblEStadistica.Text = "Se produjo un error al agregar la estadistica, complete todos los campos y vuelva a intentarlo";
                lblEStadistica.Visible = true;
            }
            else
            {
                lblEStadistica.Text = "Se produjo un error al actualizar la estadistica, complete todos los campos y vuelva a intentarlo";
                lblEStadistica.Visible = true;
            }          
        }
    }
    protected void btnEstadistica_Click(object sender, EventArgs e)
    {
        int val;
        if (btnEstadistica.Text == "Grabar Estadistica")
        {
            val = 1;
        }
        else
        {
            val = 2;
        }
        grabarEstadistica(val);
    }
    protected void nuevaPagina(string url)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "otroTag('" + url + "');", true);
    }
    protected void imbComoCategorizar_Click(object sender, ImageClickEventArgs e)
    {
        nuevaPagina("./Documentos/AyudaLiquidacionDerechosConstruccionCategorias.pdf");
    }
    protected void txtCanchaTenis_TextChanged(object sender, EventArgs e)
    {
        txtCanchaTenisValor.Text = Convert.ToString((Convert.ToDouble (txtCanchaTenis.Text) * 1600));
        txtCanchaTenisValorTotal.Text = txtCanchaTenisValor.Text;
        sumaTotal();
    }
    protected void txtCanchapaddle_TextChanged(object sender, EventArgs e)
    {
        txtCanchapaddleValor.Text = Convert.ToString((Convert.ToDouble(txtCanchapaddle.Text) * 1050));
        txtCanchapaddleValorTotal.Text = txtCanchapaddleValor.Text;
        sumaTotal();
    }
    protected void txtCanchaTenisValor_TextChanged(object sender, EventArgs e)
    {
    }
    protected void txtCanchapaddleValor_TextChanged(object sender, EventArgs e)
    {
    }
    public string ControlVacio(string campo)
    {
            string valorCampo;
            if (campo != "")
                    {
                         valorCampo = campo;
                    }
                else
                        {
                            valorCampo = "0";
                        }
            return valorCampo;
    }
    protected void btnContinuar_Click(object sender, EventArgs e)
    {
        lblmensaje.Text = "Finalizar con la Liquidación de Derechos de Construcción generará una deuda de $" + txtTotalPagar.Text + " con el municipio";
        lblmensaje.Visible=true;
        BtnLiquidar.Visible = true;
        btnContinuar.Visible = false;        
    }
    protected void borrarboton()
    {
        lblmensaje.Visible = false;
        BtnLiquidar.Visible = false;
        btnContinuar.Visible = true;
    }
    protected void txtSubTotalPileta_TextChanged(object sender, EventArgs e)
    {       
    }
    protected void ddlTipoObra_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}
