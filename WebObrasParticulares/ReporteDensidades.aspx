<%@ Page Language="C#" MasterPageFile="~/design/MasterPageMunicipio.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ReporteDensidades.aspx.cs" Inherits="DirectorGeneral" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenuMunicipio" Src="DefaultMenuMunicipio.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
borrarCondiciones();
    }
</script>

<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuMunicipio ID="DefaultMenuContentMunicipio" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
    </telerik:RadStyleSheetManager>

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
        <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >DIRECCIÓN DE OBRAS PARTICULARES - Reporte de Densidades.<br />
            <br />
    </span></strong>
        <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br />
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Antes de ejecutar una operación debe seleccionar una cuenta.<br /></span>
    <asp:ImageButton ID="imbExportar" runat="server" ImageUrl="~/images/export_excel.png"
            OnClick="imbExportar_Click" ToolTip="Exportar a Excel" /><br />
         <script type="text/javascript">

    function OnClientFileOpen(oExplorer, args) {
     var item = args.get_item();
     var fileExtension = item.get_extension();
 
     var fileDownloadMode = true;
     if ((fileDownloadMode == true) && (fileExtension == "jpg" || fileExtension == "gif" || fileExtension == "pdf"  || fileExtension == "dwg" || fileExtension == "doc" || fileExtension == "docx" || fileExtension == "xls" || fileExtension == "xlsx")) {// Download the file
          // File is a image document, do not open a new window
          args.set_cancel(true);
           
          // Tell browser to open file directly
          //var requestImage = "Handler.ashx?path=" + item.get_url();
          var requestImage =  item.get_url();
          if(fileExtension == "dwg"){
          document.location.href="file://10.70.132.21"+ requestImage;}
          if(fileExtension == "pdf"){
          otroTag(requestImage)}     
          else
          {
           window.open(requestImage)
          }
          //document.open=requestImage;
          ////document.location=requestImage;
         
     }
}
function otroTag(url){
    window.open(url,'');
   // window.open(url);
    return false;
}
function actualizarfile(){
            var oExplorer = $find("<%=RadGrid1.ClientID%>");
            oExplorer.refresh();
            return false;

}

</script>
     <div style="text-align: center;">
         &nbsp;<asp:CheckBox ID="CHFILTRO" runat="server" AutoPostBack="True" OnCheckedChanged="CHFILTRO_CheckedChanged"
             Text="FILTRO : " TextAlign="Left" />
         <br />
         <telerik:RadComboBox ID="CBCircunscripcion" runat="server" DataSourceID="SqlMejorCircunscripcion" DataTextField="Nomenclatura_Circunscripcion"
             DataValueField="Nomenclatura_Circunscripcion" Skin="Sunset" OnSelectedIndexChanged="CBCircunscripcion_SelectedIndexChanged1" Label="Circunscripcion">
         </telerik:RadComboBox><telerik:RadComboBox ID="CBSeccion" runat="server" DataSourceID="SqlMejorSeccion" DataTextField="Nomenclatura_Seccion"
             DataValueField="Nomenclatura_Seccion" Skin="Sunset" Label="Seccion">
         </telerik:RadComboBox>
         &nbsp;
         &nbsp;<span style="float:right;margin-right:250px;margin-top:-20px;"></span>
         <telerik:RadComboBox ID="CBQuinta" runat="server" DataSourceID="SqlMejorQuinta" DataTextField="Nomenclatura_Quinta"
             DataValueField="Nomenclatura_Quinta" Skin="Sunset" Label="Quinta">
         </telerik:RadComboBox><telerik:RadComboBox ID="CBManzana" runat="server" DataSourceID="SqlMejorManzana" DataTextField="Nomenclatura_Manzana"
             DataValueField="Nomenclatura_Manzana" Skin="Sunset" Label="Manzana">
         </telerik:RadComboBox>
         <telerik:RadComboBox ID="CBParcela" runat="server" DataSourceID="SqlMejorParcela" DataTextField="Nomenclatura_Parcela"
             DataValueField="Nomenclatura_Parcela" Skin="Sunset" Label="Parcela">
         </telerik:RadComboBox>
         <telerik:RadComboBox ID="CBUFuncional" runat="server" DataSourceID="SqlMejorUFuncional" DataTextField="Nomenclatura_UFuncional"
             DataValueField="Nomenclatura_UFuncional" Skin="Sunset" Label="U.Funcional">
         </telerik:RadComboBox>
         <asp:Button ID="BTNFiltrar" runat="server" OnClick="BTNFiltrar_Click" Text="APLICAR FILTRO" />
         <br />
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" DataSourceID="SqlDataSourcePlanoDigital" OnItemDataBound="RadGrid1_ItemDataBound"
        GridLines="None" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnItemCommand="RadGrid1_RowCommand" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourcePlanoDigital">
            <Columns>
                <telerik:GridBoundColumn DataField="Cuenta" HeaderText="Cuenta" ReadOnly="True" SortExpression="Cuenta"
                    UniqueName="Cuenta">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Completa" HeaderText="Nomenclatura_Completa"
                    ReadOnly="True" SortExpression="Nomenclatura_Completa" UniqueName="Nomenclatura_Completa">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Localidad" HeaderText="Localidad" ReadOnly="True"
                    SortExpression="Localidad" UniqueName="Localidad">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Profesional Asociado" HeaderText="Profesional Asociado"
                    ReadOnly="True" SortExpression="Profesional Asociado" UniqueName="Profesional Asociado">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Verificador Asociado" HeaderText="Verificador Asociado"
                    ReadOnly="True" SortExpression="Verificador Asociado" UniqueName="Verificador Asociado">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" SortExpression="Estado"
                    UniqueName="Estado">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha Estado" DataType="System.DateTime" HeaderText="Fecha Estado"
                    SortExpression="Fecha Estado" UniqueName="Fecha Estado">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Superficie_Terreno" DataType="System.Decimal"
                    HeaderText="Superficie_Terreno" SortExpression="Superficie_Terreno" UniqueName="Superficie_Terreno">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Superficie a Construir" DataType="System.Double"
                    HeaderText="Superficie a Construir" SortExpression="Superficie a Construir" UniqueName="Superficie a Construir">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="cantidadDormitorios" DataType="System.Int32"
                    HeaderText="cantidadDormitorios" SortExpression="cantidadDormitorios" UniqueName="cantidadDormitorios">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Cant. de Hab." DataType="System.Int32" HeaderText="Cant. de Hab."
                    ReadOnly="True" SortExpression="Cant. de Hab." UniqueName="Cant. de Hab.">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Densidad del Proyecto" DataType="System.Decimal"
                    HeaderText="Densidad del Proyecto" ReadOnly="True" SortExpression="Densidad del Proyecto"
                    UniqueName="Densidad del Proyecto">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True" AllowColumnHide="True" AllowColumnsReorder="True" AllowRowsDragDrop="True" ReorderColumnsOnClient="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
        <ExportSettings FileName="Movimiento de Expedientes" IgnorePaging="True">
        </ExportSettings>
    </telerik:RadGrid><br /></div>
    <asp:Label ID="lblSelec" runat="server" Font-Bold="True" Font-Size="Large" Text="-"></asp:Label><br />
    <asp:Label ID="lblDensidadTotal" runat="server" Font-Bold="True" Font-Size="Large"
        Text="La densidad"></asp:Label>
    <br />
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click" /><br />
    
      <div>
      <div style="float:left; text-align:center;">  <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
          <asp:Image ID="imgConsulta" runat="server" ImageUrl="~/images/botones/consulta-titulos.png" Visible="False" /><br />
          <asp:ImageButton ID="imbPlanchetaCatastral" runat="server" Enabled="False" ImageUrl="~/images/botones/plancheta-catastral.png"
              OnClick="imbPlanchetaCatastral_Click" Visible="False" /><asp:ImageButton ID="imbVerDedechos" runat="server" ImageUrl="~/images/botones/derechos-de-construccion.png"
              OnClick="imbVerDedechos_Click" Visible="False" /><asp:ImageButton ID="imbExplorar" runat="server"  ImageUrl="~/images/botones/explorar.png" OnClick="imbExplorar_Click" Enabled="False" Visible="False" /><asp:ImageButton ID="imgConstanciaQR" runat="server" Enabled="False" ImageUrl="~/images/botones/cartel-de-obra.png"
              OnClick="imgConstanciaQR_Click" Visible="False" /><br />
          <asp:ImageButton ID="imbHistorialArchivos" runat="server" ImageUrl="~/images/botones/historial-de-archivos.png"
              OnClick="imbHistorialArchivos_Click" Visible="False" /><asp:ImageButton ID="imbHistorialCorreo" runat="server" Enabled="False" ImageUrl="~/images/botones/historial-correo-rojo.png"
              OnClick="imbHistorialCorreo_Click" Visible="False" /><asp:ImageButton ID="btnimgArchivosVisador" runat="server" ImageUrl="~/images/NUEVOS-BOTONES/archivosxvisador.png"
              OnClick="ArchivosVisador_Click" Visible="False" /><asp:ImageButton ID="imgbDemoraEstado" runat="server" ImageUrl="~/images/NUEVOS-BOTONES/demora-de-estados.png"
              OnClick="imgbDemoraEstado_Click" Visible="False" /></span></strong></div>
            <div style="float:right; text-align:center;">
            <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
                <asp:Image ID="imgOperacion" runat="server" ImageUrl="~/images/botones/operaciones-titulo.png" Visible="False" /><br />
    <asp:ImageButton ID="ImbSubirArchivo" runat="server"  ImageUrl="~/images/botones/subir-archivo.png" OnClick="ImbSubirArchivo_Click" Enabled="False" Visible="False" /><asp:ImageButton ID="imbRegistrarPlanos" runat="server" OnClick="imbRegistrarPlanos_Click" ImageUrl="~/images/botones/registrar-plano.png" Visible="False" /><asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" ImageUrl="~/images/botones/contactar.png" Enabled="False" Visible="False" /><asp:ImageButton
        ID="imbVincularVerificador" runat="server" ImageUrl="~/images/botones/vincular-verif.png"
        OnClick="imbVincularVerificador_Click" Visible="False" /><br />
                <asp:ImageButton ID="imbVincularProfesional" runat="server" ImageUrl="~/images/botones/vincular-prof.png"
                    OnClick="imbVincularProfesional_Click" Visible="False" /><asp:ImageButton ID="imgExpedientes" runat="server" ImageUrl="~/images/botones/vincular-expediente.png" OnClick="ImbExpedientes_Click" Visible="False" /><asp:ImageButton ID="imbVolverActivo" runat="server"
                        Enabled="False" ImageUrl="~/images/botones/activo.png" OnClick="imbVolverActivo_Click" Visible="False" /><asp:ImageButton
                            ID="imbDeclaracionJurada" runat="server" ImageUrl="~/images/botones/declaracion-jurada.png"
                            OnClick="imbDeclaracionJurada_Click" Visible="False" /><br />
                         <asp:ImageButton ID="imbPlanillaObservacion" runat="server" ImageUrl="~/images/botones/planilla-observacion.png"
                    OnClick="imbPlanillaObservacion_Click" Visible="False" /><asp:ImageButton ID="imbGenerarQr" runat="server" ImageUrl="~/images/botones/generar-qr.png" OnClick="imbGenerarQr_Click" Visible="False" /><asp:ImageButton
                            ID="imbActivarProfesionales" runat="server" ImageUrl="~/images/botones/activar-profesional.png"
                            OnClick="imbActivarProfesionales_Click" Visible="False" /></span></strong></div>
            </div>
    &nbsp; &nbsp;&nbsp;
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <telerik:RadFileExplorer ID="FileExplorerObrasParticulares" runat="server" Height="256px"
        meta:resourcekey="FileExplorerObrasParticularesResource1" Skin="Sunset" VisibleControls="TreeView, Grid, Toolbar, AddressBox, ContextMenus"
        Width="100%" Language="es-ES" LocalizationPath="~/App_GlobalResources/" style="font-family: Helvetica" EnableTheming="True" OnClientFileOpen="OnClientFileOpen" Visible="False">
        <Configuration SearchPatterns="*.*" UploadPaths="~/-" ViewPaths="~/-"  />
    </telerik:RadFileExplorer>
    <asp:SqlDataSource ID="SqlDataSourcePlanoDigital" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT &#13;&#10;                         tigre.Cuenta, tigre.Nomenclatura_Completa, tigre.Inmueble_Localidad AS Localidad, CAST(eCuenta.numero AS NVARCHAR(10)) &#13;&#10;                         + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(10)) AS Expediente,&#13;&#10;                             (SELECT        apellido + ' ' + nombre AS Expr1&#13;&#10;                               FROM            Personas&#13;&#10;                               WHERE        (nroDocumento = ProfesionalXcuenta_1.nroDocumentoProfesional)) AS [Profesional Asociado],&#13;&#10;                             (SELECT        apellido + ' ' + nombre AS Expr1&#13;&#10;                               FROM            Personas AS Personas_1&#13;&#10;                               WHERE        (nroDocumento = MunicipalxCuenta.nroDocumentoMunicipio)) AS [Verificador Asociado], estadosMajor.sidop AS Estado, &#13;&#10;                         UltimoEstadoCuentas.fecha AS [Fecha Estado], tigre.Superficie_Terreno, Estadistica.superficie AS [Superficie a Construir], Estadistica.cantidadDormitorios, &#13;&#10;                         Estadistica.cantidadDormitorios * 2 AS [Cant. de Hab.], Estadistica.cantidadDormitorios * 2 * 10000 / tigre.Superficie_Terreno AS [Densidad del Proyecto]&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre LEFT OUTER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta INNER JOIN&#13;&#10;                         Carpetas AS Carpetas_1 ON Carpetas_1.idCarpeta = tigre.Cuenta INNER JOIN&#13;&#10;                         UltimoEstadoCuentas ON Carpetas_1.idCarpeta = UltimoEstadoCuentas.idCarpeta INNER JOIN&#13;&#10;                         estadosMajor ON UltimoEstadoCuentas.estado = estadosMajor.codigo INNER JOIN&#13;&#10;                         Estadistica ON Carpetas_1.idCarpeta = Estadistica.nrocuenta LEFT OUTER JOIN&#13;&#10;                         ProfesionalXcuenta AS ProfesionalXcuenta_1 ON tigre.Cuenta = ProfesionalXcuenta_1.nroCuenta LEFT OUTER JOIN&#13;&#10;                         MunicipalxCuenta ON tigre.Cuenta = MunicipalxCuenta.nroCuenta&#13;&#10;ORDER BY Estado, tigre.Cuenta, [Fecha Estado]">
    </asp:SqlDataSource><asp:SqlDataSource ID="SqlMejorCircunscripcion" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT tigre.Nomenclatura_Circunscripcion&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre INNER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta">
    </asp:SqlDataSource><asp:SqlDataSource ID="SqlDensidadTotal" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT round(SUM(CAST(Estadistica.cantidadDormitorios AS BIGINT) * 2) * 10000 / SUM(tigre.Superficie_Terreno),2) AS totalDensidad&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre LEFT OUTER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta INNER JOIN&#13;&#10;                         Carpetas AS Carpetas_1 ON Carpetas_1.idCarpeta = tigre.Cuenta INNER JOIN&#13;&#10;                         UltimoEstadoCuentas ON Carpetas_1.idCarpeta = UltimoEstadoCuentas.idCarpeta INNER JOIN&#13;&#10;                         estadosMajor ON UltimoEstadoCuentas.estado = estadosMajor.codigo INNER JOIN&#13;&#10;                         Estadistica ON Carpetas_1.idCarpeta = Estadistica.nrocuenta LEFT OUTER JOIN&#13;&#10;                         ProfesionalXcuenta AS ProfesionalXcuenta_1 ON tigre.Cuenta = ProfesionalXcuenta_1.nroCuenta LEFT OUTER JOIN&#13;&#10;                         MunicipalxCuenta ON tigre.Cuenta = MunicipalxCuenta.nroCuenta&#13;&#10;WHERE        (Estadistica.cantidadDormitorios <> 0)">
    </asp:SqlDataSource><asp:SqlDataSource ID="SqlMejorQuinta" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT &#13;&#10;                       tigre.Nomenclatura_Quinta&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre INNER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlMejorSeccion" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT &#13;&#10;                      tigre.Nomenclatura_Seccion&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre INNER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta&#13;&#10;order by  tigre.Nomenclatura_Seccion">
    </asp:SqlDataSource><asp:SqlDataSource ID="SqlMejorManzana" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT &#13;&#10;                      tigre.Nomenclatura_Manzana&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre INNER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta&#13;&#10;order by  tigre.Nomenclatura_Manzana">
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlMejorParcela" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT &#13;&#10;                        tigre.Nomenclatura_Parcela&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre INNER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta&#13;&#10;order by tigre.Nomenclatura_Parcela">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlMejorUFuncional" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT &#13;&#10;                             tigre.Nomenclatura_UFuncional&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre INNER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta">
    </asp:SqlDataSource>
   
    <br />
    &nbsp;<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" EnableHistory="True" meta:resourcekey="RadAjaxManager1Resource1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadFileExplorer1">
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
    

</asp:Content>
