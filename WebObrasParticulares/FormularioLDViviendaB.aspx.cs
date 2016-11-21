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

public partial class FormularioLDViviendaB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataSet visado = new DataSet();
            lblNroCuenta.Text = Request.QueryString["cuenta"];
            ddlCategoria_SelectedIndexChanged(sender, e);
        }
    }
    protected void calculos()
    {
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
        txtimportePileta.Text = Convert.ToString(Convert.ToDouble(txtValorPileta.Text) * Convert.ToDouble(lblPiletaTasa.Text));
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
        txtimporteExistentePileta.Text = Convert.ToString(Convert.ToDouble(txtValorExistentePileta.Text) * Convert.ToDouble(lblExistentePiletaTasa.Text));
        txtRecargoExistentePileta.Text = Convert.ToString(Convert.ToDouble(txtimporteExistentePileta.Text) * Convert.ToDouble(lblExistentePiletaTasaRecargo.Text));
        txtExistenteSubTotalPileta.Text = Convert.ToString(Convert.ToDouble(txtimporteExistentePileta.Text) + Convert.ToDouble(txtRecargoExistentePileta.Text));
        sumaTotal();
    }
    protected void sumaTotal()
    {
        txtTotalPagar.Text = Convert.ToString(Convert.ToDouble(txtSubtotalObraNuevaCub.Text) + Convert.ToDouble(txtSubTotalObraNuevaSCub.Text) + Convert.ToDouble(txtSubTotalAmpliacionCub.Text) + Convert.ToDouble(txtSubTotalAmpliacionSCub.Text) + Convert.ToDouble(txtSubTotalDemolicion.Text) + Convert.ToDouble(txtSubTotalModificionInterna.Text) + Convert.ToDouble(txtSubTotalPileta.Text) + Convert.ToDouble(txtExistenteSubtotalObraNuevaCub.Text) + Convert.ToDouble(txtExistenteSubTotalObraNuevaSCub.Text) + Convert.ToDouble(txtExistenteSubTotalAmpliacionCub.Text) + Convert.ToDouble(txtExistenteSubTotalAmpliacionSCub.Text) + Convert.ToDouble(txtExistenteSubTotalDemolicion.Text) + Convert.ToDouble(txtExistenteSubTotalModificionInterna.Text) + Convert.ToDouble(txtExistenteSubTotalPileta.Text));
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
            lblObraNuevaSCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblAmpliacionCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblAmpliacionSCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblsubsistenciaCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblSubsistenciaSCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblConformeObraCub.Text = Convert.ToString(tabla.Rows[0][1]);
            lblConformeObraSCub.Text = Convert.ToString(tabla.Rows[0][1]);
        }
        else
        {
            lblObraNuevaCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblObraNuevaSCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblAmpliacionCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblAmpliacionSCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblsubsistenciaCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblSubsistenciaSCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblConformeObraCub.Text = Convert.ToString(tabla.Rows[0][2]);
            lblConformeObraSCub.Text = Convert.ToString(tabla.Rows[0][2]);
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
}
