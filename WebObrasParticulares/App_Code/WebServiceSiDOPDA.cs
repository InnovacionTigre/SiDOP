using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;


/// <summary>
/// Descripción breve de WebServiceSiDOPDA
/// </summary>
[WebService(Namespace = "http://planodigital.tigre.gov.ar/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class WebServiceSiDOPDA : System.Web.Services.WebService {

    public WebServiceSiDOPDA () {

        //Eliminar la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }
    private static string connString = "Data Source=SQLTIGRE;Initial Catalog=PlanoDigital;Persist Security Info=True;User ID=; Password=";
    [WebMethod]    
       
    public DataSet GetCuentas()
    {
        
        System.Data.SqlClient.SqlDataAdapter adapter;
        System.Data.DataSet ds;
        adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT TOP (10) idCarpeta, Estado, Observacion, fecha, ip FROM Carpetas where idCarpeta='88888888'", connString);
        ds = new System.Data.DataSet();
        adapter.Fill(ds, "SiDOP");
        return ds;
        
    }
}

