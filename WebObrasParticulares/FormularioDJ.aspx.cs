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
public partial class FormularioDJ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataSet visado = new DataSet();
            LblnroCuenta.Text = Request.QueryString["variable"];
            visado=CargarVisados(visado);
            cargarGrilla(visado);
        }        
    }
    public  DataSet CargarVisados(DataSet visado)
    {
        Funciones objeto = new Funciones();
        SqlCommand comando = new SqlCommand();
        comando = objeto.ArmarParametrosCargaVisado(comando,LblnroCuenta.Text);
        objeto.agregar_tabla_dataset_SP("SPseleccionarVisado", comando, visado);
        return visado;           
    }
    public  void cargarGrilla(DataSet visado)
    {       
        DataTable tabla = new DataTable();
        tabla = visado.Tables[0];
        int contador=0;
        foreach (DataRow fila in tabla.Rows)
        {
            contador+=1;
            switch (contador)
            {
                case 1:                   
                    if ( Convert.ToString(tabla.Rows[contador-1][2]) == "True" )
                        Chb1.Checked = true;
                    else
                        Chb1.Checked = false;             
                    break;
                case 2:
                    
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb2.Checked = true;
                    else
                        Chb2.Checked = false;                   
                    break;
                case 3:
                    
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb3.Checked = true;
                    else
                        Chb3.Checked = false;                 
                    break;
                case 4:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb4.Checked = true;
                    else
                        Chb4.Checked = false;                   
                    break;
                case 5:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb5.Checked = true;
                    else
                        Chb5.Checked = false;               
                    break;
                case 6:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb6.Checked = true;
                    else
                        Chb6.Checked = false;                 
                    break;
                case 7:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb7.Checked = true;
                    else
                        Chb7.Checked = false;                   
                    break;
                case 8:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb8.Checked = true;
                    else
                        Chb8.Checked = false;                  
                    break;
                case 9:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb9.Checked = true;
                    else
                        Chb9.Checked = false;                   
                    break;
                case 10:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb10.Checked = true;
                    else
                        Chb10.Checked = false;                 
                    break;
                case 11:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb11.Checked = true;
                    else
                        Chb11.Checked = false;                   
                    break;
                case 12:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb12.Checked = true;
                    else
                        Chb12.Checked = false;                  
                    break;
                case 13:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb13.Checked = true;
                    else
                        Chb13.Checked = false;                    
                    break;
                case 14:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb14.Checked = true;
                    else
                        Chb14.Checked = false;                   
                    break;
                case 15:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb15.Checked = true;
                    else
                        Chb15.Checked = false;                    
                    break;
                case 16:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb16.Checked = true;
                    else
                        Chb16.Checked = false;   
                    break;
                case 17:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb17.Checked = true;
                    else
                        Chb17.Checked = false;  
                    break;
                case 18:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb18.Checked = true;
                    else
                        Chb18.Checked = false;
                    break;
                case 19:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb19.Checked = true;
                    else
                        Chb19.Checked = false;               
                    break;
                case 20:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb20.Checked = true;
                    else
                        Chb20.Checked = false;                  
                    break;
                case 21:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb21.Checked = true;
                    else
                        Chb21.Checked = false;            
                    break;
                case 22:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb22.Checked = true;
                    else
                        Chb22.Checked = false;                
                    break;
                case 23:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb23.Checked = true;
                    else
                        Chb23.Checked = false;                  
                    break;
                case 24:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb24.Checked = true;
                    else
                        Chb24.Checked = false;
                    break;
                case 25:

                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb25.Checked = true;
                    else
                        Chb25.Checked = false;                 
                    break;
                case 26:

                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb26.Checked = true;
                    else
                        Chb26.Checked = false;                
                    break;
                case 27:

                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb27.Checked = true;
                    else
                        Chb27.Checked = false;                   
                    break;
                case 28:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb28.Checked = true;
                    else
                        Chb28.Checked = false;            
                    break;
                case 29:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb29.Checked = true;
                    else
                        Chb29.Checked = false;                   
                    break;
                case 30:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb30.Checked = true;
                    else
                        Chb30.Checked = false;    
                    break;
                case 31:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb31.Checked = true;
                    else
                        Chb31.Checked = false;            
                    break;
                case 32:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb32.Checked = true;
                    else
                        Chb32.Checked = false;            
                    break;
                case 33:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb33.Checked = true;
                    else
                        Chb33.Checked = false;
                    break;
                case 34:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb34.Checked = true;
                    else
                        Chb34.Checked = false;
                    break;
                case 35:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb35.Checked = true;
                    else
                        Chb35.Checked = false;
                    break;
                case 36:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb36.Checked = true;
                    else
                        Chb36.Checked = false;      
                    break;
                case 37:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb37.Checked = true;
                    else
                        Chb37.Checked = false;
                    break;
                case 38:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb38.Checked = true;
                    else
                        Chb38.Checked = false;
                    break;
                case 39:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb39.Checked = true;
                    else
                        Chb39.Checked = false;
                    break;
                case 40:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb40.Checked = true;
                    else
                        Chb40.Checked = false;
                    break;
                case 41:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb41.Checked = true;
                    else
                        Chb41.Checked = false;
                    break;
                case 42:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb42.Checked = true;
                    else
                        Chb42.Checked = false;
                    break;
                case 43:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb43.Checked = true;
                    else
                        Chb43.Checked = false;
                    break;
                case 44:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb44.Checked = true;
                    else
                        Chb44.Checked = false;
                    break;
                case 45:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb45.Checked = true;
                    else
                        Chb45.Checked = false;
                    break;
                case 46:

                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb46.Checked = true;
                    else
                        Chb46.Checked = false;
                    break;
                case 47:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb47.Checked = true;
                    else
                        Chb47.Checked = false;
                    break;
                case 48:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb48.Checked = true;
                    else
                        Chb48.Checked = false;
                    break;
                case 49:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb49.Checked = true;
                    else
                        Chb49.Checked = false;
                    break;
                case 50:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb50.Checked = true;
                    else
                        Chb50.Checked = false;
                    break;
                case 51:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb51.Checked = true;
                    else
                        Chb51.Checked = false;
                    break;
                case 52:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb52.Checked = true;
                    else
                        Chb52.Checked = false;
                    break;
                case 53:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb53.Checked = true;
                    else
                        Chb53.Checked = false;
                    break;
                case 54:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb54.Checked = true;
                    else
                        Chb54.Checked = false;
                    break;
                case 55:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb55.Checked = true;
                    else
                        Chb55.Checked = false;
                    break;
                case 56:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb56.Checked = true;
                    else
                        Chb56.Checked = false;
                    break;
                case 57:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb57.Checked = true;
                    else
                        Chb57.Checked = false;
                    break;
                case 58:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb58.Checked = true;
                    else
                        Chb58.Checked = false;
                    break;
                case 59:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb59.Checked = true;
                    else
                        Chb59.Checked = false;
                    break;
                case 60:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb60.Checked = true;
                    else
                        Chb60.Checked = false;
                    break;
                case 61:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb61.Checked = true;
                    else
                        Chb61.Checked = false;
                    break;
                case 62:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb62.Checked = true;
                    else
                        Chb62.Checked = false;
                    break;
                case 63:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb63.Checked = true;
                    else
                        Chb63.Checked = false;
                    break;
                case 64:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb64.Checked = true;
                    else
                        Chb64.Checked = false;
                    break;
                case 65:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb65.Checked = true;
                    else
                        Chb65.Checked = false;
                    break;
                case 66:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb66.Checked = true;
                    else
                        Chb66.Checked = false;
                    break;
                case 67:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb67.Checked = true;
                    else
                        Chb67.Checked = false;
                    break;
                case 68:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb68.Checked = true;
                    else
                        Chb68.Checked = false;
                    break;
                case 69:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb69.Checked = true;
                    else
                        Chb69.Checked = false;           
                    break;
                case 70:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb70.Checked = true;
                    else
                        Chb70.Checked = false;
                    break;
                case 71:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb71.Checked = true;
                    else
                        Chb71.Checked = false;
                    break;
                case 72:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb72.Checked = true;
                    else
                        Chb72.Checked = false;
                    break;
                case 73:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb73.Checked = true;
                    else
                        Chb73.Checked = false;
                    break;
                case 74:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb74.Checked = true;
                    else
                        Chb74.Checked = false;
                    break;
                case 75:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb75.Checked = true;
                    else
                        Chb75.Checked = false;
                    break;
                case 76:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb76.Checked = true;
                    else
                        Chb76.Checked = false;
                    break;
                case 77:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb77.Checked = true;
                    else
                        Chb77.Checked = false;                 
                    break;
                case 78:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb78.Checked = true;
                    else
                        Chb78.Checked = false;
                    break;
                case 79:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb79.Checked = true;
                    else
                        Chb79.Checked = false;
                    break;
                case 80:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb80.Checked = true;
                    else
                        Chb80.Checked = false;
                    break;
                case 81:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb81.Checked = true;
                    else
                        Chb81.Checked = false;
                    break;
                case 82:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb82.Checked = true;
                    else
                        Chb82.Checked = false;
                    break;
                case 83:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb83.Checked = true;
                    else
                        Chb83.Checked = false;             
                    break;
                case 84:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb84.Checked = true;
                    else
                        Chb84.Checked = false;        
                    break;
                case 85:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb85.Checked = true;
                    else
                        Chb85.Checked = false;
                    break;
                case 86:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb86.Checked = true;
                    else
                        Chb86.Checked = false;
                    break;
                case 87:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb87.Checked = true;
                    else
                        Chb87.Checked = false;
                    break;
                case 88:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb88.Checked = true;
                    else
                        Chb88.Checked = false;
                    break;
                case 89:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb89.Checked = true;
                    else
                        Chb89.Checked = false;
                    break;
                case 90:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb90.Checked = true;
                    else
                        Chb90.Checked = false;
                    break;
                case 91:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb91.Checked = true;
                    else
                        Chb91.Checked = false;
                    break;
                case 92:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb92.Checked = true;
                    else
                        Chb92.Checked = false;
                    break;
                case 93:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb93.Checked = true;
                    else
                        Chb93.Checked = false;
                    break;
                case 94:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb94.Checked = true;
                    else
                        Chb94.Checked = false;
                    break;
                case 95:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb95.Checked = true;
                    else
                        Chb95.Checked = false;
                    break;
                case 96:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb96.Checked = true;
                    else
                        Chb96.Checked = false;
                    break;
                case 97:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb97.Checked = true;
                    else
                        Chb97.Checked = false;
                    break;
                case 98:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb98.Checked = true;
                    else
                        Chb98.Checked = false;
                    break;
                case 99:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb99.Checked = true;
                    else
                        Chb99.Checked = false;
                    break;
                case 100:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb100.Checked = true;
                    else
                        Chb100.Checked = false;
                    break;
                case 101:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb101.Checked = true;
                    else
                        Chb101.Checked = false;
                    break;
                case 102:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb102.Checked = true;
                    else
                        Chb102.Checked = false;
                    break;
                case 103:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb103.Checked = true;
                    else
                        Chb103.Checked = false;
                    break;
                case 104:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb104.Checked = true;
                    else
                        Chb104.Checked = false;
                    break;
                case 105:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb105.Checked = true;
                    else
                        Chb105.Checked = false;
                    break;
                case 106:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb106.Checked = true;
                    else
                        Chb106.Checked = false;
                    break;
                case 107:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb107.Checked = true;
                    else
                        Chb107.Checked = false;
                    break;
                case 108:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb108.Checked = true;
                    else
                        Chb108.Checked = false;
                    break;
                case 109:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb109.Checked = true;
                    else
                        Chb109.Checked = false;
                    break;
                case 110:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb110.Checked = true;
                    else
                        Chb110.Checked = false;
                    break;
                case 111:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb111.Checked = true;
                    else
                        Chb111.Checked = false;
                    break;
                case 112:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb112.Checked = true;
                    else
                        Chb112.Checked = false;
                    break;
                case 113:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb113.Checked = true;
                    else
                        Chb113.Checked = false;
                    break;
                case 114:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb114.Checked = true;
                    else
                        Chb114.Checked = false;
                    break;
                case 115:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb115.Checked = true;
                    else
                        Chb115.Checked = false;
                    break;
                case 116:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb116.Checked = true;
                    else
                        Chb116.Checked = false;
                    break;
                case 117:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb117.Checked = true;
                    else
                        Chb117.Checked = false;
                    break;
                case 118:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb118.Checked = true;
                    else
                        Chb118.Checked = false;
                    break;
                case 119:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb119.Checked = true;
                    else
                        Chb119.Checked = false;
                    break;
                case 120:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb120.Checked = true;
                    else
                        Chb120.Checked = false;
                    break;
                case 121:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb121.Checked = true;
                    else
                        Chb121.Checked = false;
                    break;               
                case 122:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb122.Checked = true;
                    else
                        Chb122.Checked = false;
                    break;
                case 123:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb123.Checked = true;
                    else
                        Chb123.Checked = false;
                    break;
                case 124:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb124.Checked = true;
                    else
                        Chb124.Checked = false;
                    break;
                case 125:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb125.Checked = true;
                    else
                        Chb125.Checked = false;
                    break;
                case 126:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb126.Checked = true;
                    else
                        Chb126.Checked = false;
                    break;
                case 127:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb127.Checked = true;
                    else
                        Chb127.Checked = false;
                    break;
                case 128:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb128.Checked = true;
                    else
                        Chb128.Checked = false;
                    break;
                case 129:

                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb129.Checked = true;
                    else
                        Chb129.Checked = false;

                    break;
                case 130:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb130.Checked = true;
                    else
                        Chb130.Checked = false;
                    break;
                case 131:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb131.Checked = true;
                    else
                        Chb131.Checked = false;
                    break;
                case 132:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb132.Checked = true;
                    else
                        Chb132.Checked = false;
                    break;
                case 133:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb133.Checked = true;
                    else
                        Chb133.Checked = false;
                    break;
                case 134:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb134.Checked = true;
                    else
                        Chb134.Checked = false;
                    break;
                case 135:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb135.Checked = true;
                    else
                        Chb135.Checked = false;
                    break;
                case 136:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb136.Checked = true;
                    else
                        Chb136.Checked = false;
                    break;
                case 137:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb137.Checked = true;
                    else
                        Chb137.Checked = false;
                    break;
                case 138:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb138.Checked = true;
                    else
                        Chb138.Checked = false;
                    break;
                case 139:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb139.Checked = true;
                    else
                        Chb139.Checked = false;
                    break;
                case 140:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb140.Checked = true;
                    else
                        Chb140.Checked = false;
                    break;
                case 141:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb141.Checked = true;
                    else
                        Chb141.Checked = false;
                    break;
                case 142:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb142.Checked = true;
                    else
                        Chb142.Checked = false;
                    break;
                case 143:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb143.Checked = true;
                    else
                        Chb143.Checked = false;
                    break;
                case 144:
                    if (Convert.ToString(tabla.Rows[contador - 1][2]) == "True")
                        Chb144.Checked = true;
                    else
                        Chb144.Checked = false;
                    break;
            }
        }  
    }

  
    protected void BtnGuardar_Click(object sender, EventArgs e)
    {
        VerificarChequeados();              
    }
    protected void VerificarChequeados()
    {
        ActualizarDJ(1, Chb1.Checked);
        ActualizarDJ(2, Chb2.Checked);
        ActualizarDJ(3, Chb3.Checked);
        ActualizarDJ(4, Chb4.Checked);
        ActualizarDJ(5, Chb5.Checked);
        ActualizarDJ(6, Chb6.Checked);
        ActualizarDJ(7, Chb7.Checked);
        ActualizarDJ(8, Chb8.Checked);
        ActualizarDJ(9, Chb9.Checked);
        ActualizarDJ(10, Chb10.Checked);

        ActualizarDJ(11, Chb11.Checked);
        ActualizarDJ(12, Chb12.Checked);
        ActualizarDJ(13, Chb13.Checked);
        ActualizarDJ(14, Chb14.Checked);
        ActualizarDJ(15, Chb15.Checked);
        ActualizarDJ(16, Chb16.Checked);
        ActualizarDJ(17, Chb17.Checked);
        ActualizarDJ(18, Chb18.Checked);
        ActualizarDJ(19, Chb19.Checked);
        ActualizarDJ(20, Chb20.Checked);

        ActualizarDJ(21, Chb21.Checked);
        ActualizarDJ(22, Chb22.Checked);
        ActualizarDJ(23, Chb23.Checked);
        ActualizarDJ(24, Chb24.Checked);
        ActualizarDJ(25, Chb25.Checked);
        ActualizarDJ(26, Chb26.Checked);
        ActualizarDJ(27, Chb27.Checked);
        ActualizarDJ(28, Chb28.Checked);
        ActualizarDJ(29, Chb29.Checked);
        ActualizarDJ(30, Chb30.Checked);

        ActualizarDJ(31, Chb31.Checked);
        ActualizarDJ(32, Chb32.Checked);
        ActualizarDJ(33, Chb33.Checked);
        ActualizarDJ(34, Chb34.Checked);
        ActualizarDJ(35, Chb35.Checked);
        ActualizarDJ(36, Chb36.Checked);
        ActualizarDJ(37, Chb37.Checked);
        ActualizarDJ(38, Chb38.Checked);
        ActualizarDJ(39, Chb39.Checked);
        ActualizarDJ(40, Chb40.Checked);

        ActualizarDJ(41, Chb41.Checked);
        ActualizarDJ(42, Chb42.Checked);
        ActualizarDJ(43, Chb43.Checked);
        ActualizarDJ(44, Chb44.Checked);
        ActualizarDJ(45, Chb45.Checked);
        ActualizarDJ(46, Chb46.Checked);
        ActualizarDJ(47, Chb47.Checked);
        ActualizarDJ(48, Chb48.Checked);
        ActualizarDJ(49, Chb49.Checked);
        ActualizarDJ(50, Chb50.Checked);

        ActualizarDJ(51, Chb51.Checked);
        ActualizarDJ(52, Chb52.Checked);
        ActualizarDJ(53, Chb53.Checked);
        ActualizarDJ(54, Chb54.Checked);
        ActualizarDJ(55, Chb55.Checked);
        ActualizarDJ(56, Chb56.Checked);
        ActualizarDJ(57, Chb57.Checked);
        ActualizarDJ(58, Chb58.Checked);
        ActualizarDJ(59, Chb59.Checked);
        ActualizarDJ(60, Chb60.Checked);

        ActualizarDJ(61, Chb61.Checked);
        ActualizarDJ(62, Chb62.Checked);
        ActualizarDJ(63, Chb63.Checked);
        ActualizarDJ(64, Chb64.Checked);
        ActualizarDJ(65, Chb65.Checked);
        ActualizarDJ(66, Chb66.Checked);
        ActualizarDJ(67, Chb67.Checked);
        ActualizarDJ(68, Chb68.Checked);
        ActualizarDJ(69, Chb69.Checked);
        ActualizarDJ(70, Chb70.Checked);

        ActualizarDJ(71, Chb71.Checked);
        ActualizarDJ(72, Chb72.Checked);
        ActualizarDJ(73, Chb73.Checked);
        ActualizarDJ(74, Chb74.Checked);
        ActualizarDJ(75, Chb75.Checked);
        ActualizarDJ(76, Chb76.Checked);
        ActualizarDJ(77, Chb77.Checked);
        ActualizarDJ(78, Chb78.Checked);
        ActualizarDJ(79, Chb79.Checked);
        ActualizarDJ(80, Chb80.Checked);

        ActualizarDJ(81, Chb81.Checked);
        ActualizarDJ(82, Chb82.Checked);
        ActualizarDJ(83, Chb83.Checked);
        ActualizarDJ(84, Chb84.Checked);
        ActualizarDJ(85, Chb85.Checked);
        ActualizarDJ(86, Chb86.Checked);
        ActualizarDJ(87, Chb87.Checked);
        ActualizarDJ(88, Chb88.Checked);
        ActualizarDJ(89, Chb89.Checked);
        ActualizarDJ(90, Chb90.Checked);

        ActualizarDJ(91, Chb91.Checked);
        ActualizarDJ(92, Chb92.Checked);
        ActualizarDJ(93, Chb93.Checked);
        ActualizarDJ(94, Chb94.Checked);
        ActualizarDJ(95, Chb95.Checked);
        ActualizarDJ(96, Chb96.Checked);
        ActualizarDJ(97, Chb97.Checked);
        ActualizarDJ(98, Chb98.Checked);
        ActualizarDJ(99, Chb99.Checked);
        ActualizarDJ(100, Chb100.Checked);

        ActualizarDJ(101, Chb101.Checked);
        ActualizarDJ(102, Chb102.Checked);
        ActualizarDJ(103, Chb103.Checked);
        ActualizarDJ(104, Chb104.Checked);
        ActualizarDJ(105, Chb105.Checked);
        ActualizarDJ(106, Chb106.Checked);
        ActualizarDJ(107, Chb107.Checked);
        ActualizarDJ(108, Chb108.Checked);
        ActualizarDJ(109, Chb109.Checked);
        ActualizarDJ(110, Chb110.Checked);

        ActualizarDJ(111, Chb111.Checked);
        ActualizarDJ(112, Chb112.Checked);
        ActualizarDJ(113, Chb113.Checked);
        ActualizarDJ(114, Chb114.Checked);
        ActualizarDJ(115, Chb115.Checked);
        ActualizarDJ(116, Chb116.Checked);
        ActualizarDJ(117, Chb117.Checked);
        ActualizarDJ(118, Chb118.Checked);
        ActualizarDJ(119, Chb119.Checked);
        ActualizarDJ(120, Chb120.Checked);

        ActualizarDJ(121, Chb121.Checked);
        ActualizarDJ(122, Chb122.Checked);
        ActualizarDJ(123, Chb123.Checked);
        ActualizarDJ(124, Chb124.Checked);
        ActualizarDJ(125, Chb125.Checked);
        ActualizarDJ(126, Chb126.Checked);
        ActualizarDJ(127, Chb127.Checked);
        ActualizarDJ(128, Chb128.Checked);
        ActualizarDJ(129, Chb129.Checked);
        ActualizarDJ(130, Chb130.Checked);

        ActualizarDJ(141, Chb141.Checked);
        ActualizarDJ(142, Chb142.Checked);
        ActualizarDJ(143, Chb143.Checked);
        ActualizarDJ(144, Chb144.Checked);    
    }
    protected void ActualizarDJ(int item, Boolean visado)
    {
        Funciones Objeto = new Funciones();  
        SqlCommand comando= new SqlCommand();
        comando = Objeto.ArmarParametrosElementosaVisar(comando, LblnroCuenta.Text,item ,visado);
        Objeto.EjecutarSp("SPactualizarDJ", comando);    
    }
        
}
