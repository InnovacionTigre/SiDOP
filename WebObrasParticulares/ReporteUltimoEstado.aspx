<%@ Page Language="C#" MasterPageFile="~/design/MasterPageMunicipio.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ReporteUltimoEstado.aspx.cs" Inherits="ReporteUltimoEstado" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
     if ((fileDownloadMode == true) && (fileExtension == "jpg" || fileExtension == "gif" || fileExtension == "pdf" || fileExtension == "dwg" || fileExtension == "doc" || fileExtension == "docx" || fileExtension == "xls" || fileExtension == "xlsx")) {// Download the file
          // File is a image document, do not open a new window
          args.set_cancel(true);
           
          // Tell browser to open file directly
          //var requestImage = "Handler.ashx?path=" + item.get_url();
          var requestImage =  item.get_url();
          if(fileExtension == "dwg"){
          document.location.href="file://10.70.132.21"+ requestImage;}
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
              OnClick="imgbDemoraEstado_Click" /></span></strong></div>
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
                    OnClick="imbPlanillaObservacion_Click" /><asp:ImageButton ID="imbGenerarQr" runat="server"
                        Enabled="False" ImageUrl="~/images/botones/generar-qr.png" OnClick="imbGenerarQr_Click" /><asp:ImageButton
                            ID="imbActivarProfesionales" runat="server" ImageUrl="~/images/botones/activar-profesional.png"
                            OnClick="imbActivarProfesionales_Click" /></span></strong></div>
            </div>
    &nbsp; &nbsp;
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
        meta:resourcekey="FileExplorerObrasParticularesResource1" Skin="Sunset" VisibleControls="TreeView, Grid, Toolbar, AddressBox, ContextMenus"
        Width="100%" Language="es-ES" LocalizationPath="~/App_GlobalResources/" style="font-family: Helvetica">
        <Configuration SearchPatterns="*.*" UploadPaths="~/-" ViewPaths="~/-" />
    </telerik:RadFileExplorer>
    <asp:SqlDataSource ID="SqlDataSourcePlanoDigital" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT tigre.Cuenta, tigre.Nomenclatura_Completa, tigre.Inmueble_Contribuyente, CAST(eCuenta.numero AS NVARCHAR(7)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(7)) AS Expediente, tigre.Deuda_Importe, (SELECT apellido + ' ' + nombre AS Expr1 FROM Personas WHERE (nroDocumento = ProfesionalXcuenta_1.nroDocumentoProfesional)) AS [Profesional Asociado], (SELECT apellido + ' ' + nombre AS Expr1 FROM Personas AS Personas_1 WHERE (nroDocumento = MunicipalxCuenta.nroDocumentoMunicipio)) AS [Verificador Asociado], estadosMajor.sidop AS Estado, UltimoEstadoCuentas.fecha AS [Fecha Estado] FROM Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre LEFT OUTER JOIN expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta INNER JOIN Carpetas AS Carpetas_1 ON Carpetas_1.idCarpeta = tigre.Cuenta INNER JOIN UltimoEstadoCuentas ON Carpetas_1.idCarpeta = UltimoEstadoCuentas.idCarpeta INNER JOIN estadosMajor ON UltimoEstadoCuentas.estado = estadosMajor.codigo LEFT OUTER JOIN ProfesionalXcuenta AS ProfesionalXcuenta_1 ON tigre.Cuenta = ProfesionalXcuenta_1.nroCuenta LEFT OUTER JOIN MunicipalxCuenta ON tigre.Cuenta = MunicipalxCuenta.nroCuenta ORDER BY Estado, tigre.Cuenta, [Fecha Estado]">
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
