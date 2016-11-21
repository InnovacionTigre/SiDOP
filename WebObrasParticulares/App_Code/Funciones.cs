using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Funciones
/// </summary>
public class Funciones
{
    String ruta = "Data Source=SQLTIGRE;Initial Catalog=PlanoDigital;Persist Security Info=True;User ID=; Password=";
    String rutaTigre = "Data Source=SQLTIGRE;Initial Catalog=Bd_Munic1;Persist Security Info=True;User ID=; Password=";
    String rutaTigreC = "Data Source=SQLTIGRE;Initial Catalog=Bd_Munic1;Persist Security Info=True;User ID=; Password=";
    public Funciones()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

   
  public int EnviarMail(String From, String To, String Mensaje, String Asunto) 
{ 
    string desde;
    string mensajeCompleto=/*"DESDE " + From + "  " + */Mensaje;
    desde = "SiDOP@tigre.gov.ar";
      switch(From)
      {
          case "obrasparticularesdigital@tigre.gov.ar":
              desde = "obrasparticularesdigital@tigre.gov.ar";            
              break;
          case "TasasDigital@tigre.gov.ar":
              desde = "TasasDigital@tigre.gov.ar";       
              break;
          case "CatastroDigital@tigre.gov.ar":
              desde = "CatastroDigital@tigre.gov.ar";        
              break;
          case "InspeccionDigital@tigre.gov.ar":
              desde = "InspeccionDigital@tigre.gov.ar";           
              break;
          case "ComisionDigital@tigre.gov.ar":
              desde="ComisionDigital@tigre.gov.ar";
               break;
           case "":
               desde = "SiDOP@tigre.gov.ar";
               break;
      }
      MailAddress origen = new MailAddress(desde, "Administrador");    

      MailAddress destino = new MailAddress(To, "Cliente");
                
      MailMessage Email = new MailMessage(origen.Address, destino.Address, Asunto, mensajeCompleto);
      SmtpClient smtp = new SmtpClient();
     
        Email.IsBodyHtml = true;
        Email.Priority = MailPriority.High;         
        System.Net.NetworkCredential credencial = new System.Net.NetworkCredential("SiDOP", "xxxxxx");  
  
      switch (From)
        {
            case "obrasparticularesdigital@tigre.gov.ar":
               
               credencial.UserName="obrasparticularesdigital";
              credencial.Password="xxxx";
                break;

            case "TasasDigital@tigre.gov.ar":
                
               credencial.UserName="TasasDigital";
              credencial.Password="xxxx";
                break;
            case "CatastroDigital@tigre.gov.ar":            
               credencial.UserName="CatastroDigital";
              credencial.Password="xxxxx";
                break;
            case "InspeccionDigital@tigre.gov.ar":              
               credencial.UserName="InspeccionDigital";
              credencial.Password="xxxxx";
                break;
            case "ComisionDigital@tigre.gov.ar":              
               credencial.UserName="ComisionDigital";
              credencial.Password="xxx";
                break;
            
        }        
      smtp.UseDefaultCredentials = false;         
        smtp.Credentials = credencial;         
        smtp.Host = "mail.tigre.gov.ar";
        try
        {
            smtp.Send(Email);
        }
        catch { }

return 1;
}
    public Boolean  email_bien_escrito(String email)
    {
        string expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";

        if (Regex.IsMatch(email, expresion))
        {
            if (Regex.Replace(email, expresion, String.Empty).Length == 0)
            { return true; }
            else
            { return false; }
        }
        else
        { return false; }                  
      
    }

    public void EjecutarSp(string nombresp,SqlCommand  comando)

    {   
        SqlConnection conexion = new SqlConnection(ruta);
        comando.CommandType = CommandType.StoredProcedure;
        comando.CommandText = nombresp;
        comando.Connection = conexion;
        conexion.Open();
        comando.ExecuteNonQuery();
        conexion.Close();
    }
   
         
    public void Ejecutarconsulta(string consulta, SqlCommand  comando)
    {
       SqlConnection conexion =  new SqlConnection(ruta);
        comando.CommandType = CommandType.Text;
        comando.CommandText = consulta;
        comando.Connection = conexion;
        conexion.Open();
        comando.ExecuteNonQuery();
        conexion.Close();
    }
    public void Ejecutarconsulta2(string consulta)
    {
        SqlCommand comando = new SqlCommand();
        SqlConnection conexion = new SqlConnection(ruta);
        comando.CommandType = CommandType.Text;
        comando.CommandText = consulta;
        comando.Connection = conexion;
        conexion.Open();
        comando.ExecuteNonQuery();
        conexion.Close();
    }
    public void Ejecutar_Select_Sp(DataSet ds, string NombreSp)
    {
        SqlConnection conexion = new SqlConnection(ruta);
        conexion.Open();
        SqlCommand Comando=new SqlCommand(NombreSp, conexion);
        Comando.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter Sql_Adaptador =new SqlDataAdapter(Comando);
        Sql_Adaptador.Fill(ds);
        conexion.Close();
        Comando.Dispose();
    }
    public void Ejecutar_SP_C_Select(string NombreSP, SqlCommand comando, DataSet ds)
    {
        SqlConnection conexion = new SqlConnection(ruta);
        conexion.Open();        
        comando.CommandText = NombreSP;
        comando.Connection = conexion;
        comando.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter Sql_Adaptador = new SqlDataAdapter(comando);
        Sql_Adaptador.Fill(ds);
        conexion.Close();
        comando.Dispose();
    }
    public void Ejecutar_SP_C_Select_Tigre(string NombreSP, SqlCommand comando, DataSet ds)
    {
        SqlConnection conexion = new SqlConnection(rutaTigreC);
        conexion.Open();
        comando.CommandText = NombreSP;
        comando.Connection = conexion;
        comando.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter Sql_Adaptador = new SqlDataAdapter(comando);
        Sql_Adaptador.Fill(ds);
        conexion.Close();
        comando.Dispose();
    }
    public void agregar_tabla_dataset_SP(string NombreSP, SqlCommand  comando, DataSet ds)
    {
        SqlConnection conexion = new SqlConnection(ruta);
        conexion.Open();
        comando.CommandText = NombreSP;
        comando.Connection = conexion;
        comando.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter Sql_Adaptador = new SqlDataAdapter(comando);
        Sql_Adaptador.Fill(ds);
        conexion.Close();
        comando.Dispose();
    }
   public SqlCommand  ArmarParametrosPersonas(SqlCommand Comando, string nombre, string apellido, string tipoDocumento, string nroDocumento, string mail, string telefono, string direccion, string localidad, string ciudad)
        {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nombre", System.Data.SqlDbType.NVarChar);
        parametros.Value = nombre ;
        parametros = Comando.Parameters.Add("@apellido", System.Data.SqlDbType.NVarChar);
        parametros.Value = apellido ;
        parametros = Comando.Parameters.Add("@tipoDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = tipoDocumento ;
        parametros = Comando.Parameters.Add("@nroDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroDocumento ;
        parametros = Comando.Parameters.Add("@mail", System.Data.SqlDbType.NVarChar);
        parametros.Value = mail;
        parametros = Comando.Parameters.Add("@telefono", System.Data.SqlDbType.NVarChar);
        parametros.Value = telefono;
        parametros = Comando.Parameters.Add("@direccion", System.Data.SqlDbType.NVarChar);
        parametros.Value = direccion;
        parametros = Comando.Parameters.Add("@localidad", System.Data.SqlDbType.NVarChar);
        parametros.Value = direccion;
        parametros = Comando.Parameters.Add("@ciudad", System.Data.SqlDbType.NVarChar);
        parametros.Value = direccion;
       return Comando;
       }
    public SqlCommand ArmarParametrosEstadistica(SqlCommand Comando, string nrocuenta,int cantidadLocales, int cantidadViviendas, int cantidadDormitorios, int cantidadBanos, int destino, int viviendaPropia, int financiamientoPropio, int distanciaTransporte, Double superficie, string tipoObra)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nrocuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrocuenta;
        parametros = Comando.Parameters.Add("@cantidadLocales", System.Data.SqlDbType.Int);
        parametros.Value = cantidadLocales;
        parametros = Comando.Parameters.Add("@cantidadViviendas", System.Data.SqlDbType.Int);
        parametros.Value = cantidadViviendas ;
        parametros = Comando.Parameters.Add("@cantidadDormitorios", System.Data.SqlDbType.Int);
        parametros.Value = cantidadDormitorios;
        parametros = Comando.Parameters.Add("@cantidadBanos", System.Data.SqlDbType.Int);
        parametros.Value = cantidadBanos;
        parametros = Comando.Parameters.Add("@destino", System.Data.SqlDbType.Int);
        parametros.Value = destino;
        parametros = Comando.Parameters.Add("@viviendaPropia", System.Data.SqlDbType.Int);
        parametros.Value = viviendaPropia;
        parametros = Comando.Parameters.Add("@financiamientoPropio", System.Data.SqlDbType.Int);
        parametros.Value = financiamientoPropio ;
        parametros = Comando.Parameters.Add("@distanciaTransporte", System.Data.SqlDbType.Int);
        parametros.Value = distanciaTransporte;
        parametros = Comando.Parameters.Add("@superficie", System.Data.SqlDbType.Float);
        parametros.Value = superficie;
        parametros = Comando.Parameters.Add("@tipoObra", System.Data.SqlDbType.NVarChar);
        parametros.Value = tipoObra;
        return Comando;
    }
    public SqlCommand ArmarParametrosSelecEstadistica(SqlCommand Comando, string nrocuenta)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nrocuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrocuenta;
   
        return Comando;
    }

    public SqlCommand ArmarParametrosRegistroArchivos(SqlCommand Comando, String nroDocumentoProfesional, String nrocuenta, DateTime  fecha, String oficinaDestino, String subCarpeta, Int32 nro_archivo, String nombreArchivo, String ruta, String ip)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nroDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroDocumentoProfesional;
        parametros = Comando.Parameters.Add("@nrocuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrocuenta ;
        parametros = Comando.Parameters.Add("@fecha", System.Data.SqlDbType.DateTime );
        parametros.Value = fecha;
        parametros = Comando.Parameters.Add("@oficinaDestino", System.Data.SqlDbType.NVarChar);
        parametros.Value = oficinaDestino ;
        parametros = Comando.Parameters.Add("@subCarpeta", System.Data.SqlDbType.NVarChar);
        parametros.Value = subCarpeta ;
        parametros = Comando.Parameters.Add("@nro_archivo", System.Data.SqlDbType.Int);
        parametros.Value = nro_archivo ;
        parametros = Comando.Parameters.Add("@nombreArchivo", System.Data.SqlDbType.NVarChar);
        parametros.Value = nombreArchivo;
        parametros = Comando.Parameters.Add("@ruta", System.Data.SqlDbType.NVarChar);
        parametros.Value = ruta;
        parametros = Comando.Parameters.Add("@ip", System.Data.SqlDbType.NVarChar);
        parametros.Value = ip;
        return Comando;
    }

    public SqlCommand ArmarParametrosCopiaFielPlano(SqlCommand Comando, String nrocuenta, DateTime fecha, String estado,Int32 nroPedido, String tipo)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nroCuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrocuenta;
        parametros = Comando.Parameters.Add("@fecha", System.Data.SqlDbType.DateTime);
        parametros.Value = fecha;
        parametros = Comando.Parameters.Add("@estado", System.Data.SqlDbType.NVarChar);
        parametros.Value = estado;
        parametros = Comando.Parameters.Add("@nroPedido", System.Data.SqlDbType.Int);
        parametros.Value = nroPedido;
        parametros = Comando.Parameters.Add("@tipo", System.Data.SqlDbType.NVarChar);
        parametros.Value = tipo;
        return Comando;
    }
    public SqlCommand ArmarParametrosSelectRegistroArchivos(SqlCommand Comando, String nroDocumentoProfesional, String nrocuenta, DateTime fecha, String oficinaDestino, String subCarpeta)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nroDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroDocumentoProfesional;
        parametros = Comando.Parameters.Add("@nrocuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrocuenta;
        parametros = Comando.Parameters.Add("@fecha", System.Data.SqlDbType.DateTime);
        parametros.Value = fecha;
        parametros = Comando.Parameters.Add("@oficinaDestino", System.Data.SqlDbType.NVarChar);
        parametros.Value = oficinaDestino;
        parametros = Comando.Parameters.Add("@subCarpeta", System.Data.SqlDbType.NVarChar);
        parametros.Value = subCarpeta;
         return Comando;
    }

    public SqlCommand ArmarParametrosGererarDeuda(SqlCommand Comando, Int32 nroCuenta, Int32 nroLiquidacion, Double importe, Double importeFondo, Double importeAridos)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@Cuenta", System.Data.SqlDbType.Int);
        parametros.Value = nroCuenta;
        parametros = Comando.Parameters.Add("@Liquidacion", System.Data.SqlDbType.Int);
        parametros.Value = nroLiquidacion;
        parametros = Comando.Parameters.Add("@ImporteDerecho ", System.Data.SqlDbType.Float);
        parametros.Value = importe;
        parametros = Comando.Parameters.Add("@ImporteFondo ", System.Data.SqlDbType.Float);
        parametros.Value = importeFondo;
        parametros = Comando.Parameters.Add("@ImporteAridos ", System.Data.SqlDbType.Float);
        parametros.Value = importeAridos;
        return Comando;
    }
    public SqlCommand ArmarParametrosGererarDeudaCopiaFiel(SqlCommand Comando,Int32 Cuenta ,Int32  Liquidacion)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@Cuenta", System.Data.SqlDbType.Int);
        parametros.Value = Cuenta;
        parametros = Comando.Parameters.Add("@Liquidacion", System.Data.SqlDbType.Int);
        parametros.Value = Liquidacion;
        return Comando;
    }
    public SqlCommand ArmarParametrosGererarDeudaSellado(SqlCommand Comando, Int32 Cuenta, Int32 Liquidacion)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@Cuenta", System.Data.SqlDbType.Int);
        parametros.Value = Cuenta;
        parametros = Comando.Parameters.Add("@Liquidacion", System.Data.SqlDbType.Int);
        parametros.Value = Liquidacion;
        return Comando;
    }
    public SqlCommand  ArmarParametrosProfesionales(SqlCommand Comando, string tipoDocumento, string nroDocumento, string nroRegistroProfesional, string nroRegistroMunicipal, string nroCuentaMunicipal, string nro_cuit, string tituloHabilitante, string categoria)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@tipoDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = tipoDocumento;
        parametros = Comando.Parameters.Add("@nroDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroDocumento;
        parametros = Comando.Parameters.Add("@nroRegistroProfesional", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroRegistroProfesional ;
        parametros = Comando.Parameters.Add("@nroRegistroMunicipal", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroRegistroMunicipal;
        parametros = Comando.Parameters.Add("@nroCuentaMunicipal", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroCuentaMunicipal;
        parametros = Comando.Parameters.Add("@nro_cuit", System.Data.SqlDbType.NVarChar);
        parametros.Value = nro_cuit;
        parametros = Comando.Parameters.Add("@tituloHabilitante", System.Data.SqlDbType.NVarChar);
        parametros.Value = tituloHabilitante ;
        parametros = Comando.Parameters.Add("@categoria", System.Data.SqlDbType.NVarChar);
        parametros.Value = categoria;
        return Comando;
    }
    public SqlCommand  ArmarParametrosUsuario(SqlCommand Comando, string usuario, string tipoDocumento, string nroDocumento, string password)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@usuario", System.Data.SqlDbType.NVarChar);
        parametros.Value = usuario;
        parametros = Comando.Parameters.Add("@tipoDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = tipoDocumento;
        parametros = Comando.Parameters.Add("@nroDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroDocumento;
        parametros = Comando.Parameters.Add("@password", System.Data.SqlDbType.NVarChar);
        parametros.Value = password;
        parametros = Comando.Parameters.Add("@permisos", System.Data.SqlDbType.NVarChar);
        parametros.Value = "profesional";
        parametros = Comando.Parameters.Add("@activo", System.Data.SqlDbType.Bit);
        parametros.Value = false;
        return Comando;
    }
    public SqlCommand ArmarParametrosActivarCuenta(SqlCommand Comando, string usuario)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@usuario", System.Data.SqlDbType.NVarChar);
        parametros.Value = usuario;
        parametros = Comando.Parameters.Add("@activo", System.Data.SqlDbType.Bit);
        parametros.Value = true;
        return Comando;
    }
    public SqlCommand ArmarParametrosActivarUsuario(SqlCommand Comando, string usuario, bool estado)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nroDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = usuario;
        parametros = Comando.Parameters.Add("@activo", System.Data.SqlDbType.Bit);
        parametros.Value = estado;
        return Comando;
    }
    public SqlCommand ArmarParametrosProfesionalesxCuenta(SqlCommand Comando, string nrodocumento, string nrocuenta)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nroDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrodocumento;
        parametros = Comando.Parameters.Add("@nroCuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrocuenta;
        return Comando;
    }
    public SqlCommand ArmarParametrosMunicipalesxCuenta(SqlCommand Comando, string nrodocumento, string nrocuenta)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nroDocumento", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrodocumento;
        parametros = Comando.Parameters.Add("@nroCuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrocuenta;
        return Comando;
    }
   
    public SqlCommand ArmarParametrosElementosaVisar(SqlCommand Comando, string nroCuenta, int nroItem, Boolean visado)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nrocuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroCuenta;
        parametros = Comando.Parameters.Add("@nroItem", System.Data.SqlDbType.Int);
        parametros.Value = nroItem;
        parametros = Comando.Parameters.Add("@Visado", System.Data.SqlDbType.Bit);
        parametros.Value = visado;
        return Comando;
    }
    public SqlCommand ArmarParametrosCargaVisado(SqlCommand Comando, String  nrocuenta)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nroCuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nrocuenta;
        return Comando;
    }
    public SqlCommand ArmarParametrosCategorias(SqlCommand Comando, String categoria)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@categoria", System.Data.SqlDbType.NVarChar);
        parametros.Value = categoria;
        return Comando;
    }
    public SqlCommand ArmarParametrosCargaLiquidacion(SqlCommand Comando, String nroCuenta, Int32 idLiquidacion, DateTime fecha)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@idLiquidacion", System.Data.SqlDbType.Int);
        parametros.Value = idLiquidacion;
        parametros = Comando.Parameters.Add("@nroCuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroCuenta;
        parametros = Comando.Parameters.Add("@fecha", System.Data.SqlDbType.DateTime);
        parametros.Value = fecha;
        return Comando;
    }
    public SqlCommand ArmarParametrosLiquidacionDerechosConstruccion(SqlCommand Comando, String categoria, String tipoVivienda, Double valorCategoria, Double nuevaObranueva_Cub, Double nuevaObranueva_Scub,
        Double nuevaAmpliacion_Cub, Double nuevaAmpliacion_Scub, Double nuevaObranuevaCub_Valor, Double nuevaObranuevaScub_Valor, Double nuevaAmpliacionCub_Valor, Double nuevaAmpliacionScub_Valor, Double nuevaDemolicion_Valor, Double nuevaModificacionInterna_Valor, 
        Double nuevaPileta_Valor,  Double nuevaObranuevaCub_Importe, Double nuevaObranuevaScub_Importe, Double nuevaAmpliacionCub_Importe, Double nuevaAmpliacionScub_Importe, Double nuevaDemolicion_Importe, Double nuevaModificacionInterna_Importe, 
        Double nuevaPileta_Importe,  Double nuevaObranuevaCub_Subtotal, Double nuevaObranuevaScub_Subtotal, Double nuevaAmpliacionCub_Subtotal, Double nuevaAmpliacionScub_Subtotal, Double nuevaDemolicion_Subtotal, Double nuevaModificacionInterna_Subtotal, 
        Double nuevaPileta_Subtotal, Double existenteSubsistencia_Cub, Double existenteSubsistencia_Scub, Double existenteConformeObra_Cub, Double existenteConformeObra_Scub, Double existenteSubsistenciaCub_Valor, Double existenteSubsistenciaScub_Valor,
        Double existenteConformeObraCub_Valor, Double existenteConformeObraScub_Valor, Double existenteDemolicion_Valor, Double existenteModificacionInterna_Valor, Double existentePileta_Valor,
        Double existenteSubsistenciaCub_Importe, Double existenteSubsistenciaScub_Importe,
        Double existenteConformeObraCub_Importe, Double existenteConformeObraScub_Importe, Double existenteDemolicion_Importe, Double existenteModificacionInterna_Importe, Double existentePileta_Importe,
        Double existenteSubsistenciaCub_Recargo, Double existenteSubsistenciaScub_Recargo,
        Double existenteConformeObraCub_Recargo, Double existenteConformeObraScub_Recargo, Double existenteDemolicion_Recargo, Double existenteModificacionInterna_Recargo, Double existentePileta_Recargo,
        Double existenteSubsistenciaCub_Subtotal, Double existenteSubsistenciaScub_Subtotal,
        Double existenteConformeObraCub_Subtotal, Double existenteConformeObraScub_Subtotal, Double existenteDemolicion_Subtotal, Double existenteModificacionInterna_Subtotal, Double existentePileta_Subtotal, 
        Double especialCubValor, Double especialScubValor, Double multifamiliarValor, Double galeriasValor, Double industriaValor, Double emprendimientosUrbanosValor, Double ambientalCubValor, Double ambientalScubvalor,
        Double especialCubImporte, Double especialScubImporte, Double multifamiliarImporte, Double galeriasImporte, Double industriaImporte, Double emprendimientosUrbanosImporte, Double ambientalCubImporte, Double ambientalScubImporte,
        Double especialCubSubtotal, Double especialScubSubtotal, Double multifamiliarSubtotal, Double galeriasSubtotal, Double industriaSubtotal, Double emprendimientosUrbanosSubtotal, Double ambientalCubSubtotal, Double ambientalScubSubtotal,
        Double canchaTenis, Double canchaPaddle, Double canchaTenisValor, Double canchaPaddleValor, Double canchaTenisSubtotal, Double canchaPaddleSubtotal,
        Double totalPagar, String nroCuenta)
    {
        SqlParameter parametros;  
        parametros = Comando.Parameters.Add("@categoria", System.Data.SqlDbType.NVarChar);
        parametros.Value = categoria;
        parametros = Comando.Parameters.Add("@tipoVivienda", System.Data.SqlDbType.NVarChar);
        parametros.Value = tipoVivienda;
        parametros = Comando.Parameters.Add("@valorCategoria", System.Data.SqlDbType.Float);
        parametros.Value = valorCategoria;
        parametros = Comando.Parameters.Add("@nuevaObranueva_Cub", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranueva_Cub;
        parametros = Comando.Parameters.Add("@nuevaObranueva_Scub", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranueva_Scub;
        parametros = Comando.Parameters.Add("@nuevaAmpliacion_Cub", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacion_Cub;
        parametros = Comando.Parameters.Add("@nuevaAmpliacion_Scub", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacion_Scub;
        parametros = Comando.Parameters.Add("@nuevaObranuevaCub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaCub_Valor;
        parametros = Comando.Parameters.Add("@nuevaObranuevaScub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaScub_Valor;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionCub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionCub_Valor;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionScub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionScub_Valor;
        parametros = Comando.Parameters.Add("@nuevaDemolicion_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaDemolicion_Valor;
        parametros = Comando.Parameters.Add("@nuevaModificacionInterna_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaModificacionInterna_Valor;
        parametros = Comando.Parameters.Add("@nuevaPileta_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaPileta_Valor;
        parametros = Comando.Parameters.Add("@nuevaObranuevaCub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaCub_Importe;
        parametros = Comando.Parameters.Add("@nuevaObranuevaScub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaScub_Importe;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionCub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionCub_Importe;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionScub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionScub_Importe;
        parametros = Comando.Parameters.Add("@nuevaDemolicion_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaDemolicion_Importe;
        parametros = Comando.Parameters.Add("@nuevaModificacionInterna_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaModificacionInterna_Importe;
        parametros = Comando.Parameters.Add("@nuevaPileta_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaPileta_Importe;
        parametros = Comando.Parameters.Add("@nuevaObranuevaCub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaCub_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaObranuevaScub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaScub_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionCub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionCub_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionScub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionScub_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaDemolicion_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaDemolicion_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaModificacionInterna_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaModificacionInterna_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaPileta_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaPileta_Subtotal;

        parametros = Comando.Parameters.Add("@existenteSubsistencia_Cub", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistencia_Cub;
        parametros = Comando.Parameters.Add("@existenteSubsistencia_Scub", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistencia_Scub;
        parametros = Comando.Parameters.Add("@existenteConformeObra_Cub", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObra_Cub;
        parametros = Comando.Parameters.Add("@existenteConformeObra_Scub", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObra_Scub;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaCub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaCub_Valor;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaScub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaScub_Valor;
        parametros = Comando.Parameters.Add("@existenteConformeObraCub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraCub_Valor;
        parametros = Comando.Parameters.Add("@existenteConformeObraScub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraScub_Valor;
        parametros = Comando.Parameters.Add("@existenteDemolicion_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteDemolicion_Valor;
        parametros = Comando.Parameters.Add("@existenteModificacionInterna_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteModificacionInterna_Valor;
        parametros = Comando.Parameters.Add("@existentePileta_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existentePileta_Valor;

        parametros = Comando.Parameters.Add("@existenteSubsistenciaCub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaCub_Importe;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaScub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaScub_Importe;
        parametros = Comando.Parameters.Add("@existenteConformeObraCub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraCub_Importe;
        parametros = Comando.Parameters.Add("@existenteConformeObraScub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraScub_Importe;
        parametros = Comando.Parameters.Add("@existenteDemolicion_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteDemolicion_Importe;
        parametros = Comando.Parameters.Add("@existenteModificacionInterna_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteModificacionInterna_Importe;
        parametros = Comando.Parameters.Add("@existentePileta_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existentePileta_Importe;

        parametros = Comando.Parameters.Add("@existenteSubsistenciaCub_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaCub_Recargo;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaScub_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaScub_Recargo;
        parametros = Comando.Parameters.Add("@existenteConformeObraCub_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraCub_Recargo;
        parametros = Comando.Parameters.Add("@existenteConformeObraScub_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraScub_Recargo;
        parametros = Comando.Parameters.Add("@existenteDemolicion_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteDemolicion_Recargo;
        parametros = Comando.Parameters.Add("@existenteModificacionInterna_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteModificacionInterna_Recargo;
        parametros = Comando.Parameters.Add("@existentePileta_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existentePileta_Recargo;

        parametros = Comando.Parameters.Add("@existenteSubsistenciaCub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaCub_Subtotal;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaScub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaScub_Subtotal;
        parametros = Comando.Parameters.Add("@existenteConformeObraCub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraCub_Subtotal;
        parametros = Comando.Parameters.Add("@existenteConformeObraScub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraScub_Subtotal;
        parametros = Comando.Parameters.Add("@existenteDemolicion_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteDemolicion_Subtotal;
        parametros = Comando.Parameters.Add("@existenteModificacionInterna_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteModificacionInterna_Subtotal;
        parametros = Comando.Parameters.Add("@existentePileta_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existentePileta_Subtotal;

        parametros = Comando.Parameters.Add("@especialCubValor", System.Data.SqlDbType.Float);
        parametros.Value = especialCubValor;
        parametros = Comando.Parameters.Add("@especialScubValor", System.Data.SqlDbType.Float);
        parametros.Value = especialScubValor;
        parametros = Comando.Parameters.Add("@multifamiliarValor", System.Data.SqlDbType.Float);
        parametros.Value = multifamiliarValor;
        parametros = Comando.Parameters.Add("@galeriasValor", System.Data.SqlDbType.Float);
        parametros.Value = galeriasValor;
        parametros = Comando.Parameters.Add("@industriaValor", System.Data.SqlDbType.Float);
        parametros.Value = industriaValor;
        parametros = Comando.Parameters.Add("@emprendimientosUrbanosValor", System.Data.SqlDbType.Float);
        parametros.Value = emprendimientosUrbanosValor;
        parametros = Comando.Parameters.Add("@ambientalCubValor", System.Data.SqlDbType.Float);
        parametros.Value = ambientalCubValor;
        parametros = Comando.Parameters.Add("@ambientalScubValor", System.Data.SqlDbType.Float);
        parametros.Value = ambientalScubvalor;

        parametros = Comando.Parameters.Add("@especialCubImporte", System.Data.SqlDbType.Float);
        parametros.Value = especialCubImporte;
        parametros = Comando.Parameters.Add("@especialScubImporte", System.Data.SqlDbType.Float);
        parametros.Value = especialScubImporte;
        parametros = Comando.Parameters.Add("@multifamiliarImporte", System.Data.SqlDbType.Float);
        parametros.Value = multifamiliarImporte;
        parametros = Comando.Parameters.Add("@galeriasImporte", System.Data.SqlDbType.Float);
        parametros.Value = galeriasImporte;
        parametros = Comando.Parameters.Add("@industriaImporte", System.Data.SqlDbType.Float);
        parametros.Value = industriaImporte;
        parametros = Comando.Parameters.Add("@emprendimientosUrbanosImporte", System.Data.SqlDbType.Float);
        parametros.Value = emprendimientosUrbanosImporte;
        parametros = Comando.Parameters.Add("@ambientalCubImporte", System.Data.SqlDbType.Float);
        parametros.Value = ambientalCubImporte;
        parametros = Comando.Parameters.Add("@ambientalScubImporte", System.Data.SqlDbType.Float);
        parametros.Value = ambientalScubImporte;

        parametros = Comando.Parameters.Add("@especialCubSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = especialCubSubtotal;
        parametros = Comando.Parameters.Add("@especialScubSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = especialScubSubtotal;
        parametros = Comando.Parameters.Add("@multifamiliarSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = multifamiliarSubtotal;
        parametros = Comando.Parameters.Add("@galeriasSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = galeriasSubtotal;
        parametros = Comando.Parameters.Add("@industriaSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = industriaSubtotal;
        parametros = Comando.Parameters.Add("@emprendimientosUrbanosSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = emprendimientosUrbanosSubtotal;
        parametros = Comando.Parameters.Add("@ambientalCubSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = ambientalCubSubtotal;
        parametros = Comando.Parameters.Add("@ambientalScubSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = ambientalScubSubtotal;
        parametros = Comando.Parameters.Add("@canchaTenis", System.Data.SqlDbType.Float);
        parametros.Value = canchaTenis;
        parametros = Comando.Parameters.Add("@canchaPaddle", System.Data.SqlDbType.Float);
        parametros.Value = canchaPaddle;
        parametros = Comando.Parameters.Add("@canchaTenisValor", System.Data.SqlDbType.Float);
        parametros.Value = canchaTenisValor ;
        parametros = Comando.Parameters.Add("@canchaPaddleValor", System.Data.SqlDbType.Float);
        parametros.Value = canchaPaddleValor;
        parametros = Comando.Parameters.Add("@canchaTenisSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = canchaTenisSubtotal;
        parametros = Comando.Parameters.Add("@canchaPaddleSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = canchaPaddleSubtotal;

        parametros = Comando.Parameters.Add("@totalPagar", System.Data.SqlDbType.Float);
        parametros.Value = totalPagar;
        parametros = Comando.Parameters.Add("@nroCuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroCuenta;
        return Comando;
    }
    public SqlCommand ArmarParametrosLiquidacionDerechosConstruccionUPDATE(SqlCommand Comando,Int32 idLiquidacion, String categoria, String tipoVivienda, Double valorCategoria, Double nuevaObranueva_Cub, Double nuevaObranueva_Scub,
       Double nuevaAmpliacion_Cub, Double nuevaAmpliacion_Scub, Double nuevaObranuevaCub_Valor, Double nuevaObranuevaScub_Valor, Double nuevaAmpliacionCub_Valor, Double nuevaAmpliacionScub_Valor, Double nuevaDemolicion_Valor, Double nuevaModificacionInterna_Valor,
       Double nuevaPileta_Valor, Double nuevaObranuevaCub_Importe, Double nuevaObranuevaScub_Importe, Double nuevaAmpliacionCub_Importe, Double nuevaAmpliacionScub_Importe, Double nuevaDemolicion_Importe, Double nuevaModificacionInterna_Importe,
       Double nuevaPileta_Importe, Double nuevaObranuevaCub_Subtotal, Double nuevaObranuevaScub_Subtotal, Double nuevaAmpliacionCub_Subtotal, Double nuevaAmpliacionScub_Subtotal, Double nuevaDemolicion_Subtotal, Double nuevaModificacionInterna_Subtotal,
       Double nuevaPileta_Subtotal, Double existenteSubsistencia_Cub, Double existenteSubsistencia_Scub, Double existenteConformeObra_Cub, Double existenteConformeObra_Scub, Double existenteSubsistenciaCub_Valor, Double existenteSubsistenciaScub_Valor,
       Double existenteConformeObraCub_Valor, Double existenteConformeObraScub_Valor, Double existenteDemolicion_Valor, Double existenteModificacionInterna_Valor, Double existentePileta_Valor,
       Double existenteSubsistenciaCub_Importe, Double existenteSubsistenciaScub_Importe,
       Double existenteConformeObraCub_Importe, Double existenteConformeObraScub_Importe, Double existenteDemolicion_Importe, Double existenteModificacionInterna_Importe, Double existentePileta_Importe,
       Double existenteSubsistenciaCub_Recargo, Double existenteSubsistenciaScub_Recargo,
       Double existenteConformeObraCub_Recargo, Double existenteConformeObraScub_Recargo, Double existenteDemolicion_Recargo, Double existenteModificacionInterna_Recargo, Double existentePileta_Recargo,
       Double existenteSubsistenciaCub_Subtotal, Double existenteSubsistenciaScub_Subtotal,
       Double existenteConformeObraCub_Subtotal, Double existenteConformeObraScub_Subtotal, Double existenteDemolicion_Subtotal, Double existenteModificacionInterna_Subtotal, Double existentePileta_Subtotal,
       Double especialCubValor, Double especialScubValor, Double multifamiliarValor, Double galeriasValor, Double industriaValor, Double emprendimientosUrbanosValor, Double ambientalCubValor, Double ambientalScubvalor,
       Double especialCubImporte, Double especialScubImporte, Double multifamiliarImporte, Double galeriasImporte, Double industriaImporte, Double emprendimientosUrbanosImporte, Double ambientalCubImporte, Double ambientalScubImporte,
       Double especialCubSubtotal, Double especialScubSubtotal, Double multifamiliarSubtotal, Double galeriasSubtotal, Double industriaSubtotal, Double emprendimientosUrbanosSubtotal, Double ambientalCubSubtotal, Double ambientalScubSubtotal,
       Double canchaTenis, Double canchaPaddle, Double canchaTenisValor, Double canchaPaddleValor, Double canchaTenisSubtotal, Double canchaPaddleSubtotal,
        Double totalPagar, String nroCuenta)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@idLiquidacion", System.Data.SqlDbType.Int);
        parametros.Value = idLiquidacion;
        parametros = Comando.Parameters.Add("@categoria", System.Data.SqlDbType.NVarChar);
        parametros.Value = categoria;
        parametros = Comando.Parameters.Add("@tipoVivienda", System.Data.SqlDbType.NVarChar);
        parametros.Value = tipoVivienda;
        parametros = Comando.Parameters.Add("@valorCategoria", System.Data.SqlDbType.Float);
        parametros.Value = valorCategoria;
        parametros = Comando.Parameters.Add("@nuevaObranueva_Cub", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranueva_Cub;
        parametros = Comando.Parameters.Add("@nuevaObranueva_Scub", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranueva_Scub;
        parametros = Comando.Parameters.Add("@nuevaAmpliacion_Cub", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacion_Cub;
        parametros = Comando.Parameters.Add("@nuevaAmpliacion_Scub", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacion_Scub;
        parametros = Comando.Parameters.Add("@nuevaObranuevaCub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaCub_Valor;
        parametros = Comando.Parameters.Add("@nuevaObranuevaScub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaScub_Valor;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionCub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionCub_Valor;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionScub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionScub_Valor;
        parametros = Comando.Parameters.Add("@nuevaDemolicion_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaDemolicion_Valor;
        parametros = Comando.Parameters.Add("@nuevaModificacionInterna_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaModificacionInterna_Valor;
        parametros = Comando.Parameters.Add("@nuevaPileta_Valor", System.Data.SqlDbType.Float);
        parametros.Value = nuevaPileta_Valor;
        parametros = Comando.Parameters.Add("@nuevaObranuevaCub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaCub_Importe;
        parametros = Comando.Parameters.Add("@nuevaObranuevaScub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaScub_Importe;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionCub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionCub_Importe;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionScub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionScub_Importe;
        parametros = Comando.Parameters.Add("@nuevaDemolicion_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaDemolicion_Importe;
        parametros = Comando.Parameters.Add("@nuevaModificacionInterna_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaModificacionInterna_Importe;
        parametros = Comando.Parameters.Add("@nuevaPileta_Importe", System.Data.SqlDbType.Float);
        parametros.Value = nuevaPileta_Importe;
        parametros = Comando.Parameters.Add("@nuevaObranuevaCub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaCub_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaObranuevaScub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaObranuevaScub_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionCub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionCub_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaAmpliacionScub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaAmpliacionScub_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaDemolicion_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaDemolicion_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaModificacionInterna_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaModificacionInterna_Subtotal;
        parametros = Comando.Parameters.Add("@nuevaPileta_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = nuevaPileta_Subtotal;

        parametros = Comando.Parameters.Add("@existenteSubsistencia_Cub", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistencia_Cub;
        parametros = Comando.Parameters.Add("@existenteSubsistencia_Scub", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistencia_Scub;
        parametros = Comando.Parameters.Add("@existenteConformeObra_Cub", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObra_Cub;
        parametros = Comando.Parameters.Add("@existenteConformeObra_Scub", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObra_Scub;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaCub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaCub_Valor;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaScub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaScub_Valor;
        parametros = Comando.Parameters.Add("@existenteConformeObraCub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraCub_Valor;
        parametros = Comando.Parameters.Add("@existenteConformeObraScub_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraScub_Valor;
        parametros = Comando.Parameters.Add("@existenteDemolicion_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteDemolicion_Valor;
        parametros = Comando.Parameters.Add("@existenteModificacionInterna_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existenteModificacionInterna_Valor;
        parametros = Comando.Parameters.Add("@existentePileta_Valor", System.Data.SqlDbType.Float);
        parametros.Value = existentePileta_Valor;

        parametros = Comando.Parameters.Add("@existenteSubsistenciaCub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaCub_Importe;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaScub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaScub_Importe;
        parametros = Comando.Parameters.Add("@existenteConformeObraCub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraCub_Importe;
        parametros = Comando.Parameters.Add("@existenteConformeObraScub_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraScub_Importe;
        parametros = Comando.Parameters.Add("@existenteDemolicion_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteDemolicion_Importe;
        parametros = Comando.Parameters.Add("@existenteModificacionInterna_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existenteModificacionInterna_Importe;
        parametros = Comando.Parameters.Add("@existentePileta_Importe", System.Data.SqlDbType.Float);
        parametros.Value = existentePileta_Importe;

        parametros = Comando.Parameters.Add("@existenteSubsistenciaCub_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaCub_Recargo;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaScub_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaScub_Recargo;
        parametros = Comando.Parameters.Add("@existenteConformeObraCub_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraCub_Recargo;
        parametros = Comando.Parameters.Add("@existenteConformeObraScub_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraScub_Recargo;
        parametros = Comando.Parameters.Add("@existenteDemolicion_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteDemolicion_Recargo;
        parametros = Comando.Parameters.Add("@existenteModificacionInterna_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existenteModificacionInterna_Recargo;
        parametros = Comando.Parameters.Add("@existentePileta_Recargo", System.Data.SqlDbType.Float);
        parametros.Value = existentePileta_Recargo;

        parametros = Comando.Parameters.Add("@existenteSubsistenciaCub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaCub_Subtotal;
        parametros = Comando.Parameters.Add("@existenteSubsistenciaScub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteSubsistenciaScub_Subtotal;
        parametros = Comando.Parameters.Add("@existenteConformeObraCub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraCub_Subtotal;
        parametros = Comando.Parameters.Add("@existenteConformeObraScub_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteConformeObraScub_Subtotal;
        parametros = Comando.Parameters.Add("@existenteDemolicion_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteDemolicion_Subtotal;
        parametros = Comando.Parameters.Add("@existenteModificacionInterna_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existenteModificacionInterna_Subtotal;
        parametros = Comando.Parameters.Add("@existentePileta_Subtotal", System.Data.SqlDbType.Float);
        parametros.Value = existentePileta_Subtotal;

        parametros = Comando.Parameters.Add("@especialCubValor", System.Data.SqlDbType.Float);
        parametros.Value = especialCubValor;
        parametros = Comando.Parameters.Add("@especialScubValor", System.Data.SqlDbType.Float);
        parametros.Value = especialScubValor;
        parametros = Comando.Parameters.Add("@multifamiliarValor", System.Data.SqlDbType.Float);
        parametros.Value = multifamiliarValor;
        parametros = Comando.Parameters.Add("@galeriasValor", System.Data.SqlDbType.Float);
        parametros.Value = galeriasValor;
        parametros = Comando.Parameters.Add("@industriaValor", System.Data.SqlDbType.Float);
        parametros.Value = industriaValor;
        parametros = Comando.Parameters.Add("@emprendimientosUrbanosValor", System.Data.SqlDbType.Float);
        parametros.Value = emprendimientosUrbanosValor;
        parametros = Comando.Parameters.Add("@ambientalCubValor", System.Data.SqlDbType.Float);
        parametros.Value = ambientalCubValor;
        parametros = Comando.Parameters.Add("@ambientalScubValor", System.Data.SqlDbType.Float);
        parametros.Value = ambientalScubvalor;

        parametros = Comando.Parameters.Add("@especialCubImporte", System.Data.SqlDbType.Float);
        parametros.Value = especialCubImporte;
        parametros = Comando.Parameters.Add("@especialScubImporte", System.Data.SqlDbType.Float);
        parametros.Value = especialScubImporte;
        parametros = Comando.Parameters.Add("@multifamiliarImporte", System.Data.SqlDbType.Float);
        parametros.Value = multifamiliarImporte;
        parametros = Comando.Parameters.Add("@galeriasImporte", System.Data.SqlDbType.Float);
        parametros.Value = galeriasImporte;
        parametros = Comando.Parameters.Add("@industriaImporte", System.Data.SqlDbType.Float);
        parametros.Value = industriaImporte;
        parametros = Comando.Parameters.Add("@emprendimientosUrbanosImporte", System.Data.SqlDbType.Float);
        parametros.Value = emprendimientosUrbanosImporte;
        parametros = Comando.Parameters.Add("@ambientalCubImporte", System.Data.SqlDbType.Float);
        parametros.Value = ambientalCubImporte;
        parametros = Comando.Parameters.Add("@ambientalScubImporte", System.Data.SqlDbType.Float);
        parametros.Value = ambientalScubImporte;

        parametros = Comando.Parameters.Add("@especialCubSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = especialCubSubtotal;
        parametros = Comando.Parameters.Add("@especialScubSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = especialScubSubtotal;
        parametros = Comando.Parameters.Add("@multifamiliarSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = multifamiliarSubtotal;
        parametros = Comando.Parameters.Add("@galeriasSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = galeriasSubtotal;
        parametros = Comando.Parameters.Add("@industriaSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = industriaSubtotal;
        parametros = Comando.Parameters.Add("@emprendimientosUrbanosSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = emprendimientosUrbanosSubtotal;
        parametros = Comando.Parameters.Add("@ambientalCubSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = ambientalCubSubtotal;
        parametros = Comando.Parameters.Add("@ambientalScubSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = ambientalScubSubtotal;
        parametros = Comando.Parameters.Add("@canchaTenis", System.Data.SqlDbType.Float);
        parametros.Value = canchaTenis;
        parametros = Comando.Parameters.Add("@canchaPaddle", System.Data.SqlDbType.Float);
        parametros.Value = canchaPaddle;
        parametros = Comando.Parameters.Add("@canchaTenisValor", System.Data.SqlDbType.Float);
        parametros.Value = canchaTenisValor;
        parametros = Comando.Parameters.Add("@canchaPaddleValor", System.Data.SqlDbType.Float);
        parametros.Value = canchaPaddleValor;
        parametros = Comando.Parameters.Add("@canchaTenisSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = canchaTenisSubtotal;
        parametros = Comando.Parameters.Add("@canchaPaddleSubtotal", System.Data.SqlDbType.Float);
        parametros.Value = canchaPaddleSubtotal;

        parametros = Comando.Parameters.Add("@totalPagar", System.Data.SqlDbType.Float);
        parametros.Value = totalPagar;
        parametros = Comando.Parameters.Add("@nroCuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroCuenta;
        return Comando;
    }
    public SqlCommand ArmarParametrosExpedientesxCuenta(SqlCommand Comando, String nroCuenta, Int32 matricula, Int32  ejercicio, Int32 numero, String letra, Int32 provincia, String tipo, Int32 subNumero)
    {
        SqlParameter parametros;
        parametros = Comando.Parameters.Add("@nroCuenta", System.Data.SqlDbType.NVarChar);
        parametros.Value = nroCuenta;
        parametros = Comando.Parameters.Add("@matricula", System.Data.SqlDbType.SmallInt);
        parametros.Value = matricula;
        parametros = Comando.Parameters.Add("@ejercicio", System.Data.SqlDbType.SmallInt);
        parametros.Value = ejercicio;
        parametros = Comando.Parameters.Add("@numero", System.Data.SqlDbType.Int);
        parametros.Value = numero;
        parametros = Comando.Parameters.Add("@letra", System.Data.SqlDbType.NVarChar);
        parametros.Value = letra;
        parametros = Comando.Parameters.Add("@provincia", System.Data.SqlDbType.SmallInt);
        parametros.Value = provincia;
        parametros = Comando.Parameters.Add("@tipo", System.Data.SqlDbType.Char);
        parametros.Value = tipo;
        parametros = Comando.Parameters.Add("@subNumero", System.Data.SqlDbType.SmallInt);
        parametros.Value = subNumero ;
        return Comando;
    }

    public void agregar_tabla_dataset(string consulta ,string nombre_tabla, DataSet ds)
    {
        SqlConnection conexion =new SqlConnection(ruta);
        SqlDataAdapter adaptador  = new SqlDataAdapter();
        SqlCommand comando = new SqlCommand(consulta, conexion);
        comando.CommandType = CommandType.Text;
        adaptador.SelectCommand = comando;
        conexion.Open();
        adaptador.Fill(ds, nombre_tabla);
        adaptador.Dispose();
        comando.Dispose();
        conexion.Close();
    }

    public void agregar_tabla_datasetTigre(string consulta, string nombre_tabla, DataSet ds)
    {
        SqlConnection conexion = new SqlConnection(rutaTigreC);
        SqlDataAdapter adaptador = new SqlDataAdapter();
        SqlCommand comando = new SqlCommand(consulta, conexion);
        comando.CommandType = CommandType.Text;
        adaptador.SelectCommand = comando;
        conexion.Open();
        adaptador.Fill(ds, nombre_tabla);
        adaptador.Dispose();
        comando.Dispose();
        conexion.Close();
    }
    public void agregarEstadoCarpeta(string carpeta, string estado, string observacion, string ip)
    {
        DateTime fecha = DateTime.Now;
        Ejecutarconsulta2("INSERT INTO Carpetas VALUES ('" + carpeta + "','" + estado + "','" + observacion + "','" + fecha.ToString("s") + "','" + ip + "')");
    
    }
    public bool validar_barrio(string barrio)
    {
        switch (barrio)
        {
            case "":
                return false;
                break;
            case "1":
                return false;
                break;
            case "2":
                return false;
                break;
            case "3":
                return false;
                break;
            case "4":
                return false;
                break;
            default:
                return true;

        }
    }
    
}
