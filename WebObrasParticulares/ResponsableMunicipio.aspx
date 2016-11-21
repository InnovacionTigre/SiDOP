<%@ Page Language="C#" MasterPageFile="~/design/MasterPageMunicipio.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ResponsableMunicipio.aspx.cs" Inherits="ResponsableMunicipio" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenuMunicipio2" Src="DefaultMenuMunicipio2.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        borrarCondiciones();
        botones();
    }
</script>

<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuMunicipio2 ID="DefaultMenuContentMunicipio" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
            <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >MUNICIPIO - PRINCIPAL.<br />
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
    &nbsp;<telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" DataSourceID="SqlDataSourcePlanoDigital" OnItemDataBound="RadGrid1_ItemDataBound"
        GridLines="None" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnItemCommand="RadGrid1_RowCommand" AllowFilteringByColumn="True"  AllowPaging="True" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourcePlanoDigital">
            <Columns>
                <telerik:GridBoundColumn DataField="Nro de Cuenta Municipal" HeaderText="Nro de Cuenta Municipal"
                    SortExpression="Nro de Cuenta Municipal" UniqueName="Nro de Cuenta Municipal" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Tasas" HeaderText="Tasas" SortExpression="Tasas"
                    UniqueName="Tasas" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nro de Documento de Profesional" HeaderText="Nro de Documento de Profesional"
                    SortExpression="Nro de Documento de Profesional" UniqueName="Nro de Documento de Profesional" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Apellido del Profesional" HeaderText="Apellido del Profesional"
                    SortExpression="Apellido del Profesional" UniqueName="Apellido del Profesional" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nombre del Profesional" HeaderText="Nombre del Profesional"
                    SortExpression="Nombre del Profesional" UniqueName="Nombre del Profesional" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="E-Mail del Profesional" HeaderText="E-Mail del Profesional"
                    SortExpression="E-Mail del Profesional" UniqueName="E-Mail del Profesional" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" SortExpression="Estado"
                    UniqueName="Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha del estado" DataType="System.DateTime"
                    HeaderText="Fecha del estado" SortExpression="Fecha del estado" UniqueName="Fecha del estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Dias trascurridos" DataType="System.Int32" HeaderText="Dias trascurridos"
                    ReadOnly="True" SortExpression="Dias trascurridos" UniqueName="Dias trascurridos" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Completa" HeaderText="Nomenclatura_Completa"
                    ReadOnly="True" SortExpression="Nomenclatura_Completa" UniqueName="Nomenclatura_Completa" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inmueble_Contribuyente" HeaderText="Inmueble_Contribuyente"
                    ReadOnly="True" SortExpression="Inmueble_Contribuyente" UniqueName="Inmueble_Contribuyente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inmueble_Calle" HeaderText="Inmueble_Calle" ReadOnly="True"
                    SortExpression="Inmueble_Calle" UniqueName="Inmueble_Calle" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inmueble_Altura" DataType="System.Int32" HeaderText="Inmueble_Altura"
                    ReadOnly="True" SortExpression="Inmueble_Altura" UniqueName="Inmueble_Altura" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inmueble_Localidad" HeaderText="Inmueble_Localidad"
                    ReadOnly="True" SortExpression="Inmueble_Localidad" UniqueName="Inmueble_Localidad" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inmueble_Barrio" HeaderText="Inmueble_Barrio"
                    SortExpression="Inmueble_Barrio" UniqueName="Inmueble_Barrio" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid><br /></div>
    <asp:GridView ID="gvwCuentas" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSourcePlanoDigital"  OnSelectedIndexChanged="gvwCuentas_SelectedIndexChanged" Visible="False" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="Nro de Cuenta Municipal" HeaderText="Nro de Cuenta Municipal"
                SortExpression="Nro de Cuenta Municipal" />
            <asp:BoundField DataField="Expediente" HeaderText="Expediente" ReadOnly="True" SortExpression="Expediente" />
            <asp:BoundField DataField="Tasas" HeaderText="Tasas" SortExpression="Tasas" />
            <asp:BoundField DataField="Nro de Documento de Profesional" HeaderText="Nro de Documento de Profesional"
                SortExpression="Nro de Documento de Profesional" />
            <asp:BoundField DataField="Apellido del Profesional" HeaderText="Apellido del Profesional"
                SortExpression="Apellido del Profesional" />
            <asp:BoundField DataField="Nombre del Profesional" HeaderText="Nombre del Profesional"
                SortExpression="Nombre del Profesional" />
            <asp:BoundField DataField="E-Mail del Profesional" HeaderText="E-Mail del Profesional"
                SortExpression="E-Mail del Profesional" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
            <asp:BoundField DataField="Fecha del estado" HeaderText="Fecha del estado" SortExpression="Fecha del estado" />
            <asp:BoundField DataField="Dias trascurridos" HeaderText="Dias trascurridos" ReadOnly="True"
                SortExpression="Dias trascurridos" />
            <asp:BoundField DataField="Nomenclatura_Completa" HeaderText="Nomenclatura_Completa"
                ReadOnly="True" SortExpression="Nomenclatura_Completa" />
            <asp:BoundField DataField="Inmueble_Contribuyente" HeaderText="Inmueble_Contribuyente"
                ReadOnly="True" SortExpression="Inmueble_Contribuyente" />
            <asp:BoundField DataField="Inmueble_Calle" HeaderText="Inmueble_Calle" ReadOnly="True"
                SortExpression="Inmueble_Calle" />
            <asp:BoundField DataField="Inmueble_Altura" HeaderText="Inmueble_Altura" ReadOnly="True"
                SortExpression="Inmueble_Altura" />
            <asp:BoundField DataField="Inmueble_Localidad" HeaderText="Inmueble_Localidad" ReadOnly="True"
                SortExpression="Inmueble_Localidad" />
            <asp:BoundField DataField="Inmueble_Barrio" HeaderText="Inmueble_Barrio" SortExpression="Inmueble_Barrio" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblSelec" runat="server" Font-Bold="True" Font-Size="Large" Text="-"></asp:Label><br />
    <br />
    <div>
      <div style="float:left; text-align:center;">  <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
          <asp:Image ID="imgConsulta" runat="server" ImageUrl="~/images/botones/consulta-titulos.png" /><br />
          <asp:ImageButton ID="imbPlanchetaCatastral" runat="server" Enabled="False" ImageUrl="~/images/botones/plancheta-catastral.png"
              OnClick="imbPlanchetaCatastral_Click" /><asp:ImageButton ID="imbExplorar" runat="server"  ImageUrl="~/images/botones/explorar.png" OnClick="imbExplorar_Click" Enabled="False" EnableTheming="True" /><asp:ImageButton ID="imgConstanciaQR" runat="server" Enabled="False" ImageUrl="~/images/botones/cartel-de-obra.png"
              OnClick="imgConstanciaQR_Click" /><asp:ImageButton ID="imbHistorialCorreo" runat="server" Enabled="False" ImageUrl="~/images/botones/historial-correo-rojo.png"
              OnClick="imbHistorialCorreo_Click" /><br />
          <asp:ImageButton ID="imgHistorialArchivos" runat="server" ImageUrl="~/images/botones/historial-de-archivos.png"
              OnClick="imgHistorialArchivos_Click" Visible="False" />
          <asp:ImageButton ID="imgHistoriaGralCorreo" runat="server" ImageUrl="~/images/botones/historial-correo-rojo.png"
              OnClick="imgHistoriaGralCorreo_Click" Visible="False" />
          <asp:ImageButton ID="imgEstadoDemoras" runat="server" ImageUrl="~/images/NUEVOS-BOTONES/demora-de-estados.png"
              OnClick="imgEstadoDemoras_Click" Visible="False" /></span></strong></div>
            <div style="text-align:center;">
            <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
                <asp:Image ID="imgOperacion" runat="server" ImageUrl="~/images/botones/operaciones-titulo.png" /><br />
    <asp:ImageButton ID="ImbSubirArchivo" runat="server"  ImageUrl="~/images/botones/subir-archivo.png" OnClick="ImbSubirArchivo_Click" Enabled="False" /><asp:ImageButton ID="imgExpedientes" runat="server"  ImageUrl="~/images/botones/vincular-expediente.png" OnClick="ImbExpedientes_Click" Enabled="False" /><asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" ImageUrl="~/images/botones/contactar.png" Enabled="False" /><asp:ImageButton ID="imgCargadoTasas" runat="server" OnClick="imgCargadoTasas_Click" ImageUrl="~/images/botones/registro-en-tasas.png" Enabled="False" /></span></strong></div>
            </div>
    &nbsp; &nbsp; &nbsp;&nbsp;
    <br />
    <br />
    <br />
    <br />
    <telerik:RadFileExplorer ID="FileExplorerObrasParticulares" runat="server" Height="256px"
        meta:resourcekey="FileExplorerObrasParticularesResource1" Skin="Sunset" VisibleControls="TreeView, Grid, Toolbar, AddressBox, ContextMenus"
        Width="1200px" Language="es-ES" LocalizationPath="~/App_GlobalResources/" style="font-family: Helvetica" Font-Names="Helvetica" OnClientLoad="ClientLoad">
        <Configuration SearchPatterns="*.*" UploadPaths="~/-" ViewPaths="~/-" DeletePaths="~/-" />
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
        SelectCommand="SELECT DISTINCT Carpetas.idCarpeta AS [Nro de Cuenta Municipal], CAST(expedientesxCuenta.numero AS NVARCHAR(8)) + '-' + CAST(expedientesxCuenta.ejecicio AS NVARCHAR(8)) AS Expediente, cuentaXTasas.estadoTasas AS Tasas, ProfesionalXcuenta.nroDocumentoProfesional AS [Nro de Documento de Profesional], Personas.apellido AS [Apellido del Profesional], Personas.nombre AS [Nombre del Profesional], Personas.mail AS [E-Mail del Profesional], estadosMajor.sidop AS Estado, UltimoEstadoCuentas.fecha AS [Fecha del estado], DATEDIFF(day, UltimoEstadoCuentas.fecha, GETDATE()) AS [Dias trascurridos], tigre.Nomenclatura_Completa, tigre.Inmueble_Contribuyente, tigre.Inmueble_Calle, tigre.Inmueble_Altura, tigre.Inmueble_Localidad, tigre.Inmueble_Barrio FROM Carpetas INNER JOIN Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre ON tigre.Cuenta = Carpetas.idCarpeta LEFT OUTER JOIN cuentaXTasas ON Carpetas.idCarpeta = cuentaXTasas.idCuenta LEFT OUTER JOIN ProfesionalXcuenta ON Carpetas.idCarpeta = ProfesionalXcuenta.nroCuenta LEFT OUTER JOIN Personas ON ProfesionalXcuenta.nroDocumentoProfesional = Personas.nroDocumento LEFT OUTER JOIN UltimoEstadoCuentas ON Carpetas.idCarpeta = UltimoEstadoCuentas.idCarpeta LEFT OUTER JOIN estadosMajor ON UltimoEstadoCuentas.estado = estadosMajor.codigo LEFT OUTER JOIN expedientesxCuenta ON ProfesionalXcuenta.nroCuenta = expedientesxCuenta.nroCuenta ORDER BY [Nro de Cuenta Municipal]">
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
