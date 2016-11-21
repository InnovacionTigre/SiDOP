<%@ Page Language="C#" MasterPageFile="~/design/MasterPageMunicipio.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="DirectorGeneral.aspx.cs" Inherits="DirectorGeneral" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
        <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >DIRECCIÓN DE OBRAS PARTICULARES - CUENTAS ACTIVAS.<br />
            <br />
    </span></strong>
        <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br />
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Antes de ejecutar una operación debe seleccionar una cuenta.<br /></span>
    <br />
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
      <span style="float:right;margin-right:250px;margin-top:-20px;"><asp:ImageButton ID="imbExportar" runat="server" ImageUrl="~/images/export_excel.png"
            OnClick="imbExportar_Click" ToolTip="Exportar a Excel" /></span><br />
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" DataSourceID="SqlDataSourcePlanoDigital" OnItemDataBound="RadGrid1_ItemDataBound"
        GridLines="None" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnItemCommand="RadGrid1_RowCommand" AllowFilteringByColumn="True" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourcePlanoDigital">
            <Columns>
                <telerik:GridBoundColumn DataField="Cuenta" HeaderText="Cuenta" ReadOnly="True" SortExpression="Cuenta"
                    UniqueName="Cuenta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Completa" HeaderText="Nomenclatura_Completa"
                    ReadOnly="True" SortExpression="Nomenclatura_Completa" UniqueName="Nomenclatura_Completa" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inmueble_Contribuyente" HeaderText="Inmueble_Contribuyente"
                    ReadOnly="True" SortExpression="Inmueble_Contribuyente" UniqueName="Inmueble_Contribuyente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Deuda_Importe" DataType="System.Decimal" HeaderText="Deuda_Importe"
                    SortExpression="Deuda_Importe" UniqueName="Deuda_Importe" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Profesional Asociado" HeaderText="Profesional Asociado"
                    ReadOnly="True" SortExpression="Profesional Asociado" UniqueName="Profesional Asociado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Verificador Asociado" HeaderText="Verificador Asociado"
                    ReadOnly="True" SortExpression="Verificador Asociado" UniqueName="Verificador Asociado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" SortExpression="Estado"
                    UniqueName="Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha Estado" DataType="System.DateTime" HeaderText="Fecha Estado"
                    SortExpression="Fecha Estado" UniqueName="Fecha Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Dias trascurridos" DataType="System.Int32" HeaderText="Dias trascurridos"
                    ReadOnly="True" SortExpression="Dias trascurridos" UniqueName="Dias trascurridos" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
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
    <asp:GridView ID="gvwCuentas" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSourcePlanoDigital" OnSelectedIndexChanged="gvwCuentas_SelectedIndexChanged" Visible="False">
        <Columns>
            <asp:BoundField DataField="Cuenta" HeaderText="Cuenta" ReadOnly="True" SortExpression="Cuenta" />
            <asp:BoundField DataField="Nomenclatura_Completa" HeaderText="Nomenclatura_Completa"
                ReadOnly="True" SortExpression="Nomenclatura_Completa" />
            <asp:BoundField DataField="Inmueble_Contribuyente" HeaderText="Inmueble_Contribuyente"
                ReadOnly="True" SortExpression="Inmueble_Contribuyente" />
            <asp:BoundField DataField="Expediente" HeaderText="Expediente" ReadOnly="True" SortExpression="Expediente" />
            <asp:BoundField DataField="Deuda_Importe" HeaderText="Deuda_Importe" SortExpression="Deuda_Importe" />
            <asp:BoundField DataField="Profesional Asociado" HeaderText="Profesional Asociado"
                ReadOnly="True" SortExpression="Profesional Asociado" />
            <asp:BoundField DataField="Verificador Asociado" HeaderText="Verificador Asociado"
                ReadOnly="True" SortExpression="Verificador Asociado" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
            <asp:BoundField DataField="Fecha Estado" HeaderText="Fecha Estado" SortExpression="Fecha Estado" />
            <asp:BoundField DataField="Dias trascurridos" HeaderText="Dias trascurridos" ReadOnly="True"
                SortExpression="Dias trascurridos" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblSelec" runat="server" Font-Bold="True" Font-Size="Large" Text="-"></asp:Label><br />
    <br />
    
      <div>
      <div style="float:left; text-align:center;">  <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
          <asp:Image ID="imgConsulta" runat="server" ImageUrl="~/images/botones/consulta-titulos.png" /><br />
          <asp:ImageButton ID="imbPlanchetaCatastral" runat="server" Enabled="False" ImageUrl="~/images/botones/plancheta-catastral.png"
              OnClick="imbPlanchetaCatastral_Click" /><asp:ImageButton ID="imbVerDedechos" runat="server" ImageUrl="~/images/botones/derechos-de-construccion.png"
              OnClick="imbVerDedechos_Click" /><asp:ImageButton ID="imbExplorar" runat="server"  ImageUrl="~/images/botones/explorar.png" OnClick="imbExplorar_Click" Enabled="False" /><asp:ImageButton ID="imgConstanciaQR" runat="server" Enabled="False" ImageUrl="~/images/botones/cartel-de-obra.png"
              OnClick="imgConstanciaQR_Click" /><br />
          <asp:ImageButton ID="imbHistorialArchivos" runat="server" ImageUrl="~/images/botones/historial-de-archivos.png"
              OnClick="imbHistorialArchivos_Click" /><asp:ImageButton ID="imbHistorialCorreo" runat="server" Enabled="False" ImageUrl="~/images/botones/historial-correo-rojo.png"
              OnClick="imbHistorialCorreo_Click" /><asp:ImageButton ID="btnimgArchivosVisador" runat="server" ImageUrl="~/images/NUEVOS-BOTONES/archivosxvisador.png"
              OnClick="ArchivosVisador_Click" /><asp:ImageButton ID="imgbDemoraEstado" runat="server" ImageUrl="~/images/NUEVOS-BOTONES/demora-de-estados.png"
              OnClick="imgbDemoraEstado_Click" />
          <br />
          <asp:ImageButton ID="imbReposteDensidades" runat="server" ImageUrl="~/images/densidades.png"
              OnClick="imgbReporteDensidades_Click" />
          <asp:ImageButton ID="imbHistorialEstados" runat="server" Enabled="False" ImageUrl="~/images/botones/historial de estados.png"
              OnClick="imbHistorialEstados_Click" /></span></strong></div>
            <div style="float:right; text-align:center;">
            <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
                <asp:Image ID="imgOperacion" runat="server" ImageUrl="~/images/botones/operaciones-titulo.png" /><br />
    <asp:ImageButton ID="ImbSubirArchivo" runat="server"  ImageUrl="~/images/botones/subir-archivo.png" OnClick="ImbSubirArchivo_Click" Enabled="False" /><asp:ImageButton ID="imbRegistrarPlanos" runat="server" OnClick="imbRegistrarPlanos_Click" ImageUrl="~/images/botones/registrar-plano.png" /><asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" ImageUrl="~/images/botones/contactar.png" Enabled="False" /><asp:ImageButton
        ID="imbVincularVerificador" runat="server" ImageUrl="~/images/botones/vincular-verif.png"
        OnClick="imbVincularVerificador_Click" /><br />
                <asp:ImageButton ID="imbVincularProfesional" runat="server" ImageUrl="~/images/botones/vincular-prof.png"
                    OnClick="imbVincularProfesional_Click" /><asp:ImageButton ID="imgExpedientes" runat="server" ImageUrl="~/images/botones/vincular-expediente.png" OnClick="ImbExpedientes_Click" /><asp:ImageButton ID="imbVolverActivo" runat="server"
                        Enabled="False" ImageUrl="~/images/botones/activo.png" OnClick="imbVolverActivo_Click" /><asp:ImageButton
                            ID="imbDeclaracionJurada" runat="server" ImageUrl="~/images/botones/declaracion-jurada.png"
                            OnClick="imbDeclaracionJurada_Click" /><br />
                         <asp:ImageButton ID="imbPlanillaObservacion" runat="server" ImageUrl="~/images/botones/planilla-observacion.png"
                    OnClick="imbPlanillaObservacion_Click" /><asp:ImageButton ID="imbGenerarQr" runat="server" ImageUrl="~/images/botones/generar-qr.png" OnClick="imbGenerarQr_Click" /><asp:ImageButton
                            ID="imbActivarProfesionales" runat="server" ImageUrl="~/images/botones/activar-profesional.png"
                            OnClick="imbActivarProfesionales_Click" /><asp:ImageButton
                            ID="ImbEnvioMasivoCorreos" runat="server" ImageUrl="~/images/correo-masivo.png"
                            OnClick="imbEnvioMasivoCorreos_Click" /><br />
                <asp:ImageButton ID="imbEnviarInspeccion" runat="server" OnClick="imbEnviarInspeccion_Click" ImageUrl="~/images/botones/enviar-insp.png" Visible="False" /><asp:ImageButton ID="imbRecibirInspeccion" runat="server" OnClick="imbRecibirInspeccion_Click" ImageUrl="~/images/botones/recibir-insp.png" Visible="False" /><asp:ImageButton ID="imbClausurar" runat="server" OnClick="imbClausurar_Click" ImageUrl="~/images/botones/clausurado.png" Visible="False" /><asp:ImageButton ID="imbVerificado" runat="server" OnClick="imbVerificado_Click" ImageUrl="~/images/botones/verificar.png" /><br />
                <asp:ImageButton ID="imbCaducar" runat="server" OnClick="imbCaducar_Click" ImageUrl="~/images/botones/caducar.png" /><asp:ImageButton ID="imbSuspender" runat="server" OnClick="imbClausurar_Click" ImageUrl="~/images/botones/clausurar.png" /><asp:ImageButton ID="imbVincularWEB" runat="server" OnClick="imbVincularWEB_Click" ImageUrl="~/images/botones/vincular.png" /><asp:ImageButton ID="imbCambiarAprobado" runat="server" OnClick="imbCambiarAprobado_Click" ImageUrl="~/images/botones/cambiar-aprobado.png" /><br />
                <asp:ImageButton ID="imbcambiarInscripto" runat="server" OnClick="imbcambiarInscripto_Click" ImageUrl="~/images/botones/cambiar-inscripto.png" /><asp:ImageButton ID="imbPermisoObra" runat="server" OnClick="imbPermisoObra_Click" ImageUrl="~/images/botones/permiso-obra.png" /><asp:ImageButton ID="imbPrimeraObs" runat="server" OnClick="imbPrimeraObs_Click" ImageUrl="~/images/botones/primer-obv.png" /><asp:ImageButton ID="imbSegundaObs" runat="server" OnClick="imbSegundaObs_Click" ImageUrl="~/images/botones/segunda-obv.png" /><br />
                <asp:ImageButton ID="imbTerceraObv" runat="server" OnClick="imbTerceraObv_Click" ImageUrl="~/images/botones/tercera-obv.png" /><asp:ImageButton ID="imbCorreccionObv" runat="server" OnClick="imbCorreccionObv_Click" ImageUrl="~/images/botones/correccion.png" /><asp:ImageButton ID="imbEnviarComision" runat="server" OnClick="imbEnviarComision_Click" ImageUrl="~/images/botones/comision.png" /></span></strong></div>
          <br />
          <br />
            </div>
  
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <telerik:RadFileExplorer ID="FileExplorerObrasParticulares" runat="server" Height="256px"
        meta:resourcekey="FileExplorerObrasParticularesResource1"  Skin="Sunset" VisibleControls="TreeView, Grid, Toolbar, AddressBox, ContextMenus"
        Width="1200px" Language="es-ES" LocalizationPath="~/App_GlobalResources/" style="font-family: Helvetica" EnableTheming="True" OnClientFileOpen="OnClientFileOpen" OnClientLoad="ClientLoad" OnClientMove="ClientLoad">
        <Configuration SearchPatterns="*.*" UploadPaths="~/-" ViewPaths="~/-"  />
    </telerik:RadFileExplorer>
    <script type="text/javascript">    
function
ClientLoad
(explorer, args) {
        
explorer.get_fileList().get_grid().add_rowDragStarted(
RowDragStarted
)
    
}
    
function
RowDragStarted
(grid, args) {
        
args.set_cancel(true);
    
}
</script>
    <asp:SqlDataSource ID="SqlDataSourcePlanoDigital" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT &#13;&#10;                         tigre.Cuenta, tigre.Nomenclatura_Completa, tigre.Inmueble_Contribuyente, CAST(eCuenta.numero AS NVARCHAR(8)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(8)) &#13;&#10;                         AS Expediente, tigre.Deuda_Importe,&#13;&#10;                             (SELECT        apellido + ' ' + nombre AS Expr1&#13;&#10;                               FROM            Personas&#13;&#10;                               WHERE        (nroDocumento = ProfesionalXcuenta_1.nroDocumentoProfesional)) AS [Profesional Asociado],&#13;&#10;                             (SELECT        apellido + ' ' + nombre AS Expr1&#13;&#10;                               FROM            Personas AS Personas_1&#13;&#10;                               WHERE        (nroDocumento = MunicipalxCuenta.nroDocumentoMunicipio)) AS [Verificador Asociado], estadosMajor.sidop AS Estado, &#13;&#10;                         UltimoEstadoCuentas.fecha AS [Fecha Estado], DATEDIFF(day, UltimoEstadoCuentas.fecha, GETDATE()) AS [Dias trascurridos]&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre LEFT OUTER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta INNER JOIN&#13;&#10;                         Carpetas AS Carpetas_1 ON Carpetas_1.idCarpeta = tigre.Cuenta INNER JOIN&#13;&#10;                         UltimoEstadoCuentas ON Carpetas_1.idCarpeta = UltimoEstadoCuentas.idCarpeta INNER JOIN&#13;&#10;                         estadosMajor ON UltimoEstadoCuentas.estado = estadosMajor.codigo LEFT OUTER JOIN&#13;&#10;                         ProfesionalXcuenta AS ProfesionalXcuenta_1 ON tigre.Cuenta = ProfesionalXcuenta_1.nroCuenta LEFT OUTER JOIN&#13;&#10;                         MunicipalxCuenta ON tigre.Cuenta = MunicipalxCuenta.nroCuenta&#13;&#10;ORDER BY Estado, tigre.Cuenta, [Fecha Estado]">
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
