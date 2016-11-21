<%@ Page Language="C#" MasterPageFile="~/design/MasterPageMunicipio.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ResponsableArboladoPublico.aspx.cs" Inherits="ResponsableMunicipio" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
    &nbsp;<telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" DataSourceID="SqlDataSourcePlanoDigital"
        GridLines="None" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnItemCommand="RadGrid1_RowCommand" AllowFilteringByColumn="True"  AllowPaging="True" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourcePlanoDigital" DataKeyNames="Nro de Cuenta Municipal,Nro de Documento de Profesional">
            <Columns>
                <telerik:GridBoundColumn DataField="Nro de Cuenta Municipal" HeaderText="Nro de Cuenta Municipal"
                    ReadOnly="True" SortExpression="Nro de Cuenta Municipal" UniqueName="Nro de Cuenta Municipal" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nro de Documento de Profesional" HeaderText="Nro de Documento de Profesional"
                    ReadOnly="True" SortExpression="Nro de Documento de Profesional" UniqueName="Nro de Documento de Profesional" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
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
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid><br /></div>
    <asp:GridView ID="gvwCuentas" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSourcePlanoDigital"  OnSelectedIndexChanged="gvwCuentas_SelectedIndexChanged" Visible="False" AllowPaging="True" AllowSorting="True" DataKeyNames="Nro de Cuenta Municipal,Nro de Documento de Profesional">
        <Columns>
            <asp:BoundField DataField="Nro de Cuenta Municipal" HeaderText="Nro de Cuenta Municipal"
                ReadOnly="True" SortExpression="Nro de Cuenta Municipal" />
            <asp:BoundField DataField="Expediente" HeaderText="Expediente" ReadOnly="True" SortExpression="Expediente" />
            <asp:BoundField DataField="Nro de Documento de Profesional" HeaderText="Nro de Documento de Profesional"
                ReadOnly="True" SortExpression="Nro de Documento de Profesional" />
            <asp:BoundField DataField="Apellido del Profesional" HeaderText="Apellido del Profesional"
                SortExpression="Apellido del Profesional" />
            <asp:BoundField DataField="Nombre del Profesional" HeaderText="Nombre del Profesional"
                SortExpression="Nombre del Profesional" />
            <asp:BoundField DataField="E-Mail del Profesional" HeaderText="E-Mail del Profesional"
                SortExpression="E-Mail del Profesional" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
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
              OnClick="imbHistorialCorreo_Click" /></span></strong></div>
            <div style="text-align:center;">
            <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
                <asp:Image ID="imgOperacion" runat="server" ImageUrl="~/images/botones/operaciones-titulo.png" /><br />
    <asp:ImageButton ID="ImbSubirArchivo" runat="server"  ImageUrl="~/images/botones/subir-archivo.png" OnClick="ImbSubirArchivo_Click" Enabled="False" /><asp:ImageButton ID="imgExpedientes" runat="server"  ImageUrl="~/images/botones/vincular-expediente.png" OnClick="ImbExpedientes_Click" Enabled="False" /><asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" ImageUrl="~/images/botones/contactar.png" Enabled="False" /></span></strong></div>
            </div>
    &nbsp; &nbsp; &nbsp;&nbsp;
    <telerik:RadFileExplorer ID="FileExplorerObrasParticulares" runat="server" Height="256px"
        meta:resourcekey="FileExplorerObrasParticularesResource1" Skin="Sunset" VisibleControls="TreeView, Grid, Toolbar, AddressBox, ContextMenus"
        Width="100%" Language="es-ES" LocalizationPath="~/App_GlobalResources/" style="font-family: Helvetica" Font-Names="Helvetica">
        <Configuration SearchPatterns="*.*" UploadPaths="~/-" ViewPaths="~/-" DeletePaths="~/-" />
    </telerik:RadFileExplorer>
    
    <asp:SqlDataSource ID="SqlDataSourcePlanoDigital" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT &#13;&#10;                         Carpetas.idCarpeta AS [Nro de Cuenta Municipal], CAST(expedientesxCuenta.numero AS NVARCHAR(8)) + '-' + CAST(expedientesxCuenta.ejecicio AS NVARCHAR(8)) &#13;&#10;                         AS Expediente, ProfesionalXcuenta.nroDocumentoProfesional AS [Nro de Documento de Profesional], Personas.apellido AS [Apellido del Profesional], &#13;&#10;                         Personas.nombre AS [Nombre del Profesional], Personas.mail AS [E-Mail del Profesional], estadosMajor.sidop as [Estado]&#13;&#10;FROM            Carpetas INNER JOIN&#13;&#10;                         ProfesionalXcuenta ON Carpetas.idCarpeta = ProfesionalXcuenta.nroCuenta INNER JOIN&#13;&#10;                         Personas ON ProfesionalXcuenta.nroDocumentoProfesional = Personas.nroDocumento INNER JOIN&#13;&#10;                         UltimoEstadoCuentas ON Carpetas.idCarpeta = UltimoEstadoCuentas.idCarpeta INNER JOIN&#13;&#10;                         estadosMajor ON UltimoEstadoCuentas.estado = estadosMajor.codigo INNER JOIN&#13;&#10;                         expedientesxCuenta ON ProfesionalXcuenta.nroCuenta = expedientesxCuenta.nroCuenta&#13;&#10;ORDER BY [Nro de Cuenta Municipal]">
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
