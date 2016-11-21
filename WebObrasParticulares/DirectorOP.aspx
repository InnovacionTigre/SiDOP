<%@ Page Language="C#" MasterPageFile="~/design/MasterPageMunicipio.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="DirectorOP.aspx.cs" Inherits="DirectorOP" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
        <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >DIRECCIÓN DE OBRAS PARTICULARES - CUENTAS VERIFICADAS.<br />
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
     if ((fileDownloadMode == true) && (fileExtension == "jpg" || fileExtension == "gif"  || fileExtension == "pdf" || fileExtension == "dwg" || fileExtension == "doc" || fileExtension == "docx" || fileExtension == "xls" || fileExtension == "xlsx")) {// Download the file
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
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" DataSourceID="SqlDataSourcePlanoDigital"
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
                <telerik:GridBoundColumn DataField="Fecha del Estado" DataType="System.DateTime"
                    HeaderText="Fecha del Estado" SortExpression="Fecha del Estado" UniqueName="Fecha del Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True" AllowRowHide="True" AllowRowsDragDrop="True" ReorderColumnsOnClient="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
        <ExportSettings ExportOnlyData="True" OpenInNewWindow="True">
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
            <asp:BoundField DataField="Fecha del Estado" HeaderText="Fecha del Estado" SortExpression="Fecha del Estado" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblSelec" runat="server" Font-Bold="True" Font-Size="Large" Text="-"></asp:Label>
    <br />
    <br />
    
      <div>
      <div style="float:left; text-align:center;">  <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
          <asp:Image ID="imgConsulta" runat="server" ImageUrl="~/images/botones/consulta-titulos.png" /><br />
          <asp:ImageButton ID="imbPlanchetaCatastral" runat="server" Enabled="False" ImageUrl="~/images/botones/plancheta-catastral.png"
              OnClick="imbPlanchetaCatastral_Click" /><asp:ImageButton ID="imbVerDedechos" runat="server" ImageUrl="~/images/botones/derechos-de-construccion.png"
              OnClick="imbVerDedechos_Click" /><asp:ImageButton ID="imbExplorar" runat="server"  ImageUrl="~/images/botones/explorar.png" OnClick="imbExplorar_Click" Enabled="False" /><asp:ImageButton ID="imgConstanciaQR" runat="server" Enabled="False" ImageUrl="~/images/botones/cartel-de-obra.png"
              OnClick="imgConstanciaQR_Click" /><br />
          <asp:ImageButton ID="imbMovimientosExpedientes" runat="server" ImageUrl="~/images/botones/movimiento-de-expedientes.png"
              OnClick="imbMovimientosExpedientes_Click" /><asp:ImageButton ID="imbHistorialArchivos" runat="server" Enabled="False" ImageUrl="~/images/botones/historial-de-archivos.png"
              OnClick="imbHistorialArchivos_Click" Visible="False" /><asp:ImageButton ID="imbHistorialCorreo" runat="server" Enabled="False" ImageUrl="~/images/botones/historial-correo-rojo.png"
              OnClick="imbHistorialCorreo_Click" Visible="False" /></span></strong></div>
            <div style="text-align:center;">
            <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
                <asp:Image ID="imgOperacion" runat="server" ImageUrl="~/images/botones/operaciones-titulo.png" /><br />
    <asp:ImageButton ID="ImbSubirArchivo" runat="server"  ImageUrl="~/images/botones/subir-archivo.png" OnClick="ImbSubirArchivo_Click" Enabled="False" /><asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/images/botones/registrar.png" Enabled="False" /><asp:ImageButton ID="imbRechazar" runat="server" OnClick="imbRechazar_Click" ImageUrl="~/images/botones/rechazar-plano.png" Enabled="False" /><asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" ImageUrl="~/images/botones/contactar.png" Enabled="False" /><br />
                <asp:ImageButton ID="imbDeclaracionJurada" runat="server" ImageUrl="~/images/botones/declaracion-jurada.png"
                    OnClick="imbDeclaracionJurada_Click" Visible="False" /><asp:ImageButton ID="imbPlanillaObservacion"
                        runat="server" ImageUrl="~/images/botones/planilla-observacion.png" OnClick="imbPlanillaObservacion_Click" Visible="False" /><asp:ImageButton
                            ID="imbGenerarQr" runat="server" Enabled="False" ImageUrl="~/images/botones/generar-qr.png"
                            OnClick="imbGenerarQr_Click" Visible="False" /><asp:ImageButton ID="imbActivarProfesionales" runat="server"
                                ImageUrl="~/images/botones/activar-profesional.png" OnClick="imbActivarProfesionales_Click" Visible="False" />
            </span></strong>
             </div>
            </div>
    &nbsp; &nbsp;&nbsp;
    <br />
    <br />
    <br />
    <asp:Label ID="lblCartel" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#FF8000"
        Text="-" Visible="False"></asp:Label><br />
    <telerik:RadFileExplorer ID="FileExplorerObrasParticulares" runat="server" Height="256px"
        meta:resourcekey="FileExplorerObrasParticularesResource1" OnClientLoad="ClientLoad" Skin="Sunset" VisibleControls="TreeView, Grid, Toolbar, AddressBox, ContextMenus"
        Width="1200px" Language="es-ES" LocalizationPath="~/App_GlobalResources/" style="font-family: Helvetica" OnClientFileOpen="OnClientFileOpen">
        <Configuration SearchPatterns="*.*" UploadPaths="~/-" ViewPaths="~/-" />
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
        SelectCommand="SELECT        tigre.Cuenta, tigre.Nomenclatura_Completa, tigre.Inmueble_Contribuyente, CAST(eCuenta.numero AS NVARCHAR(8)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(8)) &#13;&#10;                         AS Expediente, tigre.Deuda_Importe,&#13;&#10;                             (SELECT        apellido + ' ' + nombre AS Expr1&#13;&#10;                               FROM            Personas&#13;&#10;                               WHERE        (nroDocumento = ProfesionalXcuenta_1.nroDocumentoProfesional)) AS [Profesional Asociado],&#13;&#10;                             (SELECT        apellido + ' ' + nombre AS Expr1&#13;&#10;                               FROM            Personas AS Personas_1&#13;&#10;                               WHERE        (nroDocumento = MunicipalxCuenta.nroDocumentoMunicipio)) AS [Verificador Asociado], estadosMajor.sidop AS Estado, &#13;&#10;                         UltimoEstadoCuentas.fecha AS [Fecha del Estado]&#13;&#10;FROM            ProfesionalXcuenta AS ProfesionalXcuenta_1 RIGHT OUTER JOIN&#13;&#10;                         estadosMajor INNER JOIN&#13;&#10;                         UltimoEstadoCuentas INNER JOIN&#13;&#10;                         Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre ON UltimoEstadoCuentas.idCarpeta = tigre.Cuenta ON &#13;&#10;                         estadosMajor.codigo = UltimoEstadoCuentas.estado LEFT OUTER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta ON ProfesionalXcuenta_1.nroCuenta = tigre.Cuenta LEFT OUTER JOIN&#13;&#10;                         MunicipalxCuenta ON tigre.Cuenta = MunicipalxCuenta.nroCuenta&#13;&#10;ORDER BY tigre.Cuenta, [Fecha del Estado]">
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
