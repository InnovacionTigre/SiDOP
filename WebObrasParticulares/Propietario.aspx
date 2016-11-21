<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Propietario.aspx.cs" Inherits="Propietario" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenu" Src="DefaultMenu.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
iniciar();
    }
</script>


<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenu ID="DefaultMenuContent" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
  
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
function OnClientFolderChange(sender, args) {
     //LogEvent("Tree folder change: " + args.get_item().get_name());
     if((args.get_item().get_name()=="Plano a Registrar")||(args.get_item().get_name()=="Arbolado Urbano")||(args.get_item().get_name()=="Plano Verificado")||(args.get_item().get_name()=="Inspeccion")){
     alert("Usted no tiene permisos para visualizar la carpeta " + args.get_item().get_name());
     var oExplorer = $find("<%=FileExplorerObrasParticulares.ClientID%>");
     oExplorer.refresh();
     } 
     
     
}
function OnClientItemSelected(sender, args) {
     //LogEvent("Tree folder change: " + args.get_item().get_name());
     if((args.get_item().get_name()=="Plano a Registrar")||(args.get_item().get_name()=="Arbolado Urbano")||(args.get_item().get_name()=="Plano Verificado")||(args.get_item().get_name()=="Inspeccion")){
     alert("Usted no tiene permisos para visualizar la carpeta " + args.get_item().get_name());
     
     } 
       
}

</script>
<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
       <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >PROPIETARIO - EXPEDIENTE DIGITAL.<br />
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True"
               AllowSorting="True" DataSourceID="SqlDataSource1" Font-Names="Helvetica" GridLines="None"
                             Skin="Sunset">
               <FooterStyle Font-Names="Helvetica" />
               <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                   <Columns>
                       <telerik:GridBoundColumn DataField="Cuenta" HeaderText="Cuenta" ReadOnly="True" SortExpression="Cuenta"
                           UniqueName="Cuenta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="Nomenclatura_Completa" HeaderText="Nomenclatura Completa"
                           ReadOnly="True" SortExpression="Nomenclatura_Completa" UniqueName="Nomenclatura_Completa" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="Inmueble_Contribuyente" HeaderText="Contribuyente"
                           ReadOnly="True" SortExpression="Inmueble_Contribuyente" UniqueName="Inmueble_Contribuyente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                           SortExpression="Expediente" UniqueName="Expediente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="Deuda_Importe" DataType="System.Decimal" HeaderText="Importe de Deuda"
                           SortExpression="Deuda_Importe" UniqueName="Deuda_Importe" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="Profesional Asociado" HeaderText="Profesional Asociado"
                           ReadOnly="True" SortExpression="Profesional Asociado" UniqueName="Profesional Asociado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="Verificador Asociado" HeaderText="Verificador Asociado"
                           ReadOnly="True" SortExpression="Verificador Asociado" UniqueName="Verificador Asociado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="Fecha del Estado" DataType="System.DateTime"
                           HeaderText="Fecha del Estado" SortExpression="Fecha del Estado" UniqueName="Fecha del Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" SortExpression="Estado"
                           UniqueName="Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                       </telerik:GridBoundColumn>
                   </Columns>
               </MasterTableView>
               <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
               <ClientSettings EnablePostBackOnRowClick="True">
                   <Selecting AllowRowSelect="True" />
               </ClientSettings>
           </telerik:RadGrid><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
               SelectCommand="SELECT        tigre.Cuenta, tigre.Nomenclatura_Completa, tigre.Inmueble_Contribuyente, CAST(eCuenta.numero AS NVARCHAR(8)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(8)) &#13;&#10;                         AS Expediente, tigre.Deuda_Importe,&#13;&#10;                             (SELECT        apellido + ' ' + nombre AS Expr1&#13;&#10;                               FROM            Personas&#13;&#10;                               WHERE        (nroDocumento = ProfesionalXcuenta_1.nroDocumentoProfesional)) AS [Profesional Asociado],&#13;&#10;                             (SELECT        apellido + ' ' + nombre AS Expr1&#13;&#10;                               FROM            Personas AS Personas_1&#13;&#10;                               WHERE        (nroDocumento = MunicipalxCuenta.nroDocumentoMunicipio)) AS [Verificador Asociado], Carpetas_1.fecha AS [Fecha del Estado], &#13;&#10;                         estadosMajor.sidop AS Estado&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre LEFT OUTER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON tigre.Cuenta = eCuenta.nroCuenta INNER JOIN&#13;&#10;                         Carpetas AS Carpetas_1 ON Carpetas_1.idCarpeta = tigre.Cuenta INNER JOIN&#13;&#10;                         estadosMajor ON Carpetas_1.Estado = estadosMajor.codigo LEFT OUTER JOIN&#13;&#10;                         ProfesionalXcuenta AS ProfesionalXcuenta_1 ON tigre.Cuenta = ProfesionalXcuenta_1.nroCuenta LEFT OUTER JOIN&#13;&#10;                         MunicipalxCuenta ON tigre.Cuenta = MunicipalxCuenta.nroCuenta&#13;&#10;WHERE        (tigre.Cuenta = @cuenta)&#13;&#10;ORDER BY [Fecha del Estado]">
               <SelectParameters>
                   <asp:SessionParameter Name="cuenta" SessionField="nroCuenta" />
               </SelectParameters>
           </asp:SqlDataSource>
           <br />
           <br />
    </span></strong>
    &nbsp;
    <telerik:RadFileExplorer ID="FileExplorerObrasParticulares" OnClientItemSelected="OnClientItemSelected" OnClientFolderChange="OnClientFolderChange" runat="server" Height="256px"
        meta:resourcekey="FileExplorerObrasParticularesResource1" Skin="Sunset" VisibleControls="TreeView, Grid, Toolbar, AddressBox, ContextMenus"
        Width="1200px" Language="es-ES" LocalizationPath="~/App_GlobalResources/" DisplayUpFolderItem="True"  EnableCreateNewFolder="False" style="font-family: Helvetica" OnClientLoad="ClientLoad" >
        <Configuration SearchPatterns="*.*" UploadPaths="~/Inicio" ViewPaths="~/Inicio" MaxUploadFileSize="20048" DeletePaths="~/Inicio" />
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
        SelectCommand="SELECT * FROM [ProfesionalXcuenta] WHERE ([nroDocumentoProfesional] = @nroDocumentoProfesional)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="nroDocumentoProfesional" SessionField="nroDocumentoProfesional"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceMuni1" runat="server" ConnectionString="<%$ ConnectionStrings:Bd_Munic1ConnectionString %>"
            SelectCommand="SELECT  * FROM [WEBOP_V_AUT_Inmuebles] where Cuenta=@nrocuenta">
        <SelectParameters>
            <asp:SessionParameter Name="nrocuenta" SessionField="nrocuenta" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    &nbsp;
    

</asp:Content>
