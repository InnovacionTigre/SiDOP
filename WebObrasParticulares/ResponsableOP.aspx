<%@ Page Language="C#" MasterPageFile="~/design/MasterPageMunicipio.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ResponsableOP.aspx.cs" Inherits="ResponsableOP" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
    <art:DefaultMenuMunicipio ID="DefaultMenuContentMunicipio" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
         <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >RESPONSABLE DE OBRAS PARTICULARES - PRINCIPAL.<br />
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
        GridLines="None" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnItemCommand="RadGrid1_RowCommand" AllowFilteringByColumn="True" OnNeedDataSource="RadGrid1_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="Nro de Documento del Profesional,Nro de Cuenta"
            DataSourceID="SqlDataSourcePlanoDigital">
            <Columns>
                <telerik:GridBoundColumn DataField="Nro de Documento del Profesional" HeaderText="Nro de Documento del Profesional"
                    ReadOnly="True" SortExpression="Nro de Documento del Profesional" UniqueName="Nro de Documento del Profesional" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Profesional" HeaderText="Profesional" ReadOnly="True"
                    SortExpression="Profesional" UniqueName="Profesional" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nro de Cuenta" HeaderText="Nro de Cuenta" ReadOnly="True"
                    SortExpression="Nro de Cuenta" UniqueName="Nro de Cuenta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nombreclatura Completa" HeaderText="Nombreclatura Completa"
                    ReadOnly="True" SortExpression="Nombreclatura Completa" UniqueName="Nombreclatura Completa" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Contribuyente" HeaderText="Contribuyente" ReadOnly="True"
                    SortExpression="Contribuyente" UniqueName="Contribuyente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Importe de Deuda" DataType="System.Decimal" HeaderText="Importe de Deuda"
                    SortExpression="Importe de Deuda" UniqueName="Importe de Deuda" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" SortExpression="Estado"
                    UniqueName="Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha del Estado" DataType="System.DateTime"
                    HeaderText="Fecha del Estado" SortExpression="Fecha del Estado" UniqueName="Fecha del Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True" AllowColumnsReorder="True" AllowRowHide="True" AllowRowsDragDrop="True" ReorderColumnsOnClient="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid><br /></div>
         <div style="text-align: center;">
    <telerik:RadGrid ID="RadGrid2" runat="server" AllowSorting="True" DataSourceID="SqlDataSourceCuentasTigre"
        GridLines="None" Height="100px" Visible="False" Skin="Sunset" style="font-family: Helvetica" Font-Names="Helvetica" >
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceCuentasTigre">
            <Columns>
                <telerik:GridBoundColumn DataField="Inmueble_Contribuyente" HeaderText="Inmueble_Contribuyente"
                    ReadOnly="True" SortExpression="Inmueble_Contribuyente" UniqueName="Inmueble_Contribuyente">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Cuenta" HeaderText="Cuenta" ReadOnly="True" SortExpression="Cuenta"
                    UniqueName="Cuenta">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Deuda_Importe" DataType="System.Decimal" HeaderText="Deuda_Importe"
                    ReadOnly="True" SortExpression="Deuda_Importe" UniqueName="Deuda_Importe">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Circunscripcion" HeaderText="Nomenclatura_Circunscripcion"
                    ReadOnly="True" SortExpression="Nomenclatura_Circunscripcion" UniqueName="Nomenclatura_Circunscripcion">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Seccion" HeaderText="Nomenclatura_Seccion"
                    SortExpression="Nomenclatura_Seccion" UniqueName="Nomenclatura_Seccion">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_CodigoAmanzanamiento" HeaderText="Nomenclatura_CodigoAmanzanamiento"
                    ReadOnly="True" SortExpression="Nomenclatura_CodigoAmanzanamiento" UniqueName="Nomenclatura_CodigoAmanzanamiento">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Chacra" DataType="System.Int32"
                    HeaderText="Nomenclatura_Chacra" SortExpression="Nomenclatura_Chacra" UniqueName="Nomenclatura_Chacra">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_LetraChacra" HeaderText="Nomenclatura_LetraChacra"
                    SortExpression="Nomenclatura_LetraChacra" UniqueName="Nomenclatura_LetraChacra">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Quinta" DataType="System.Int32"
                    HeaderText="Nomenclatura_Quinta" SortExpression="Nomenclatura_Quinta" UniqueName="Nomenclatura_Quinta">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_LetraQuinta" HeaderText="Nomenclatura_LetraQuinta"
                    SortExpression="Nomenclatura_LetraQuinta" UniqueName="Nomenclatura_LetraQuinta">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Fraccion" DataType="System.Int32"
                    HeaderText="Nomenclatura_Fraccion" SortExpression="Nomenclatura_Fraccion" UniqueName="Nomenclatura_Fraccion">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_LetraFraccion" HeaderText="Nomenclatura_LetraFraccion"
                    SortExpression="Nomenclatura_LetraFraccion" UniqueName="Nomenclatura_LetraFraccion">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Manzana" DataType="System.Int32"
                    HeaderText="Nomenclatura_Manzana" SortExpression="Nomenclatura_Manzana" UniqueName="Nomenclatura_Manzana">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_LetraManzana" HeaderText="Nomenclatura_LetraManzana"
                    SortExpression="Nomenclatura_LetraManzana" UniqueName="Nomenclatura_LetraManzana">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Parcela" DataType="System.Int32"
                    HeaderText="Nomenclatura_Parcela" SortExpression="Nomenclatura_Parcela" UniqueName="Nomenclatura_Parcela">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_LetraParcela" HeaderText="Nomenclatura_LetraParcela"
                    SortExpression="Nomenclatura_LetraParcela" UniqueName="Nomenclatura_LetraParcela">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_UFuncional" HeaderText="Nomenclatura_UFuncional"
                    ReadOnly="True" SortExpression="Nomenclatura_UFuncional" UniqueName="Nomenclatura_UFuncional">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_UComplementaria" HeaderText="Nomenclatura_UComplementaria"
                    ReadOnly="True" SortExpression="Nomenclatura_UComplementaria" UniqueName="Nomenclatura_UComplementaria">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True">
            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid></div><asp:SqlDataSource ID="SqlDataSourceCuentasTigre" runat="server"
        ConnectionString="<%$ ConnectionStrings:Bd_Munic1ConnectionString %>" SelectCommand="SELECT [Inmueble_Contribuyente],[Cuenta],[Deuda_Importe] ,[Nomenclatura_Circunscripcion], [Nomenclatura_Seccion], [Nomenclatura_CodigoAmanzanamiento], [Nomenclatura_Chacra], [Nomenclatura_LetraChacra], [Nomenclatura_Quinta], [Nomenclatura_LetraQuinta], [Nomenclatura_Fraccion], [Nomenclatura_LetraFraccion], [Nomenclatura_Manzana], [Nomenclatura_LetraManzana], [Nomenclatura_Parcela], [Nomenclatura_LetraParcela], [Nomenclatura_UFuncional], [Nomenclatura_UComplementaria] FROM [WEBOP_V_AUT_Inmuebles] WHERE ([Cuenta] = @Cuenta)">
        <SelectParameters>
            <asp:SessionParameter Name="Cuenta" SessionField="cuenta" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;
    <asp:GridView ID="gvwCuentas" runat="server" AutoGenerateColumns="False" DataKeyNames="Nro de Documento del Profesional,Nro de Cuenta"
        DataSourceID="SqlDataSourcePlanoDigital"  OnSelectedIndexChanged="gvwCuentas_SelectedIndexChanged" Visible="False">
        <Columns>
            <asp:BoundField DataField="Nro de Documento del Profesional" HeaderText="Nro de Documento del Profesional"
                ReadOnly="True" SortExpression="Nro de Documento del Profesional" />
            <asp:BoundField DataField="Profesional" HeaderText="Profesional" ReadOnly="True"
                SortExpression="Profesional" />
            <asp:BoundField DataField="Nro de Cuenta" HeaderText="Nro de Cuenta" ReadOnly="True"
                SortExpression="Nro de Cuenta" />
            <asp:BoundField DataField="Expediente" HeaderText="Expediente" ReadOnly="True" SortExpression="Expediente" />
            <asp:BoundField DataField="Nombreclatura Completa" HeaderText="Nombreclatura Completa"
                ReadOnly="True" SortExpression="Nombreclatura Completa" />
            <asp:BoundField DataField="Contribuyente" HeaderText="Contribuyente" ReadOnly="True"
                SortExpression="Contribuyente" />
            <asp:BoundField DataField="Importe de Deuda" HeaderText="Importe de Deuda" SortExpression="Importe de Deuda" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
            <asp:BoundField DataField="Fecha del Estado" HeaderText="Fecha del Estado" SortExpression="Fecha del Estado" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="lblSelec" runat="server" Font-Bold="True" Font-Size="Large" Text="-"></asp:Label><br />
    <br />
   <div>
      <div style="float:left; text-align:center;">  <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
          <asp:Image ID="imgConsulta" runat="server" ImageUrl="~/images/botones/consulta-titulos.png" /><br />
          <asp:ImageButton ID="imbDatosCuenta" runat="server"  ImageUrl="~/images/botones/datos-cuenta.png" OnClick="imbDatosCuenta_Click" Enabled="False" /><asp:ImageButton ID="imbPlanchetaCatastral" runat="server"  ImageUrl="~/images/botones/plancheta-catastral.png" OnClick="imbPlanchetaCatastral_Click" Enabled="False" /><asp:ImageButton ID="imbExplorar" runat="server"  ImageUrl="~/images/botones/explorar.png" OnClick="imbExplorar_Click" Enabled="False" /><asp:ImageButton ID="imgConstanciaQR" runat="server" OnClick="imgConstanciaQR_Click" ImageUrl="~/images/botones/cartel-de-obra.png" Enabled="False" /><br />
            </span></strong><asp:ImageButton ID="imbHistorialCorreo" runat="server" OnClick="imbHistorialCorreo_Click" ImageUrl="~/images/botones/historial-correo-rojo.png" Enabled="False" /><asp:ImageButton ID="imbCorreosCuentas" runat="server" OnClick="imbCorreosCuentas_Click" ImageUrl="~/images/botones/correos-de-la-cuenta.png" Enabled="False" /><asp:ImageButton ID="imbArchivosCuenta" runat="server" OnClick="imbArchivosCuenta_Click" ImageUrl="~/images/botones/archivos-de-la-cuenta.png" Enabled="False" /><asp:ImageButton ID="imbDerechosConstruccion" runat="server" OnClick="imbDerechosConstruccion_Click" ImageUrl="~/images/botones/derechos-de-construccion.png" Enabled="False" /><br /><asp:ImageButton ID="imbCopiaFielPlano" runat="server" OnClick="imbCopiaFielPlano_Click" ImageUrl="~/images/botones/copias-fiel-plano-rojo.png" Enabled="False" /><asp:ImageButton
              ID="btnimgArchivosVisador" runat="server" ImageUrl="~/images/NUEVOS-BOTONES/archivosxvisador.png"
              OnClick="ArchivosVisador_Click" /><br />
            </div>
            <div style="text-align:center;">
            <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
                <asp:Image ID="imgOperacion" runat="server" ImageUrl="~/images/botones/operaciones-titulo.png" /><br />
                <asp:ImageButton ID="imbDeclaracionJurada" runat="server"  ImageUrl="~/images/botones/declaracion-jurada.png" OnClick="imbDeclaracionJurada_Click" /><asp:ImageButton ID="imbPlanillaObservacion" runat="server" OnClick="imbPlanillaObservacion_Click" ImageUrl="~/images/botones/planilla-observacion.png" /><asp:ImageButton ID="ImbSubirArchivo" runat="server"  ImageUrl="~/images/botones/subir-archivo.png" OnClick="ImbSubirArchivo_Click" Enabled="False" /><asp:ImageButton ID="imbGenerarQr" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/images/botones/generar-qr.png" Enabled="False" /><br />
                <asp:ImageButton ID="imbVincularVerificador" runat="server"  ImageUrl="~/images/botones/vincular-verif.png" OnClick="imbVincularVerificador_Click" Enabled="False" /><asp:ImageButton ID="imbVincularProfesional" runat="server"  ImageUrl="~/images/botones/vincular-prof.png" OnClick="imbVincularProfesional_Click" Enabled="False" /><asp:ImageButton ID="imgExpedientes" runat="server"  ImageUrl="~/images/botones/vincular-expediente.png" OnClick="ImbExpedientes_Click" Enabled="False" /><asp:ImageButton ID="imbGenerarCuenta" runat="server" OnClick="imbGenerarCuenta_Click" ImageUrl="~/images/botones/generar-cuenta.png" />
                <br />
                <asp:ImageButton ID="imbEnviarInspeccion" runat="server" OnClick="imbEnviarInspeccion_Click" ImageUrl="~/images/botones/enviar-insp.png" Visible="False" /><asp:ImageButton ID="imbRecibirInspeccion" runat="server" OnClick="imbRecibirInspeccion_Click" ImageUrl="~/images/botones/recibir-insp.png" Visible="False" /><asp:ImageButton ID="imbClausurar" runat="server" OnClick="imbClausurar_Click" ImageUrl="~/images/botones/clausurado.png" Visible="False" /><asp:ImageButton ID="imbActivarProfesionales" runat="server" OnClick="imbActivarProfesionales_Click" ImageUrl="~/images/botones/activar-profesional.png" /><asp:ImageButton ID="imbPermisoAutomatico" runat="server" OnClick="imbPermisoAutomatico_Click" ImageUrl="~/images/botones/permiso-obra.png" Visible="False" /><asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" ImageUrl="~/images/botones/contactar.png" Enabled="False" /></span></strong>&nbsp;</div>
            </div>
    &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <asp:Label ID="lblCartel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#C00000"
        Text="-" Visible="False"></asp:Label><br />
    <telerik:RadFileExplorer ID="FileExplorerObrasParticulares" runat="server" Height="256px"
        meta:resourcekey="FileExplorerObrasParticularesResource1" Skin="Sunset" VisibleControls="TreeView, Grid, Toolbar, AddressBox, ContextMenus"
        Width="1200px" Language="es-ES" LocalizationPath="~/App_GlobalResources/" style="font-family: Helvetica" Font-Names="Helvetica" OnClientFileOpen="OnClientFileOpen" OnClientLoad="ClientLoad">
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
        SelectCommand="SELECT        ProfesionalXcuenta.nroDocumentoProfesional AS [Nro de Documento del Profesional], Personas.nombre + ' ' + Personas.apellido AS Profesional, &#13;&#10;                         ProfesionalXcuenta.nroCuenta AS [Nro de Cuenta], CAST(expedientesxCuenta.numero AS NVARCHAR(8)) + '-' + CAST(expedientesxCuenta.ejecicio AS NVARCHAR(5)) &#13;&#10;                         AS Expediente, Muni.Nomenclatura_Completa AS [Nombreclatura Completa], Muni.Inmueble_Contribuyente AS Contribuyente, &#13;&#10;                         Muni.Deuda_Importe AS [Importe de Deuda], estadosMajor.sidop AS Estado, UltimoEstadoCuentas.fecha AS [Fecha del Estado]&#13;&#10;FROM            ProfesionalXcuenta INNER JOIN&#13;&#10;                         MunicipalxCuenta ON ProfesionalXcuenta.nroCuenta = MunicipalxCuenta.nroCuenta INNER JOIN&#13;&#10;                         Personas ON ProfesionalXcuenta.nroDocumentoProfesional = Personas.nroDocumento INNER JOIN&#13;&#10;                         Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS Muni ON Muni.Cuenta = ProfesionalXcuenta.nroCuenta INNER JOIN&#13;&#10;                         UltimoEstadoCuentas ON ProfesionalXcuenta.nroCuenta = UltimoEstadoCuentas.idCarpeta INNER JOIN&#13;&#10;                         estadosMajor ON UltimoEstadoCuentas.estado = estadosMajor.codigo LEFT OUTER JOIN&#13;&#10;                         expedientesxCuenta ON ProfesionalXcuenta.nroCuenta = expedientesxCuenta.nroCuenta&#13;&#10;WHERE        (MunicipalxCuenta.nroDocumentoMunicipio = @nroDoc) AND (UltimoEstadoCuentas.estado <> 'REGISTRADO') AND (UltimoEstadoCuentas.estado <> '1316')">
        <SelectParameters>
            <asp:SessionParameter Name="nroDoc" SessionField="nroDocumentoMunicipio" />
        </SelectParameters>
    </asp:SqlDataSource><asp:SqlDataSource ID="SqlDataSourcePlanoDigitalEspecial" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT ProfesionalXcuenta.nroDocumentoProfesional AS [Nro de Documento del Profesional], Personas.nombre + ' ' + Personas.apellido AS Profesional, ProfesionalXcuenta.nroCuenta AS [Nro de Cuenta], CAST(expedientesxCuenta.numero AS NVARCHAR(8)) + '-' + CAST(expedientesxCuenta.ejecicio AS NVARCHAR(5)) AS Expediente, Muni.Nomenclatura_Completa AS [Nombreclatura Completa], Muni.Inmueble_Contribuyente AS Contribuyente, Muni.Deuda_Importe AS [Importe de Deuda], estadosMajor.sidop AS Estado, UltimoEstadoCuentas.fecha AS [Fecha del Estado] FROM ProfesionalXcuenta INNER JOIN MunicipalxCuenta ON ProfesionalXcuenta.nroCuenta = MunicipalxCuenta.nroCuenta INNER JOIN Personas ON ProfesionalXcuenta.nroDocumentoProfesional = Personas.nroDocumento INNER JOIN Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS Muni ON Muni.Cuenta = ProfesionalXcuenta.nroCuenta INNER JOIN UltimoEstadoCuentas ON ProfesionalXcuenta.nroCuenta = UltimoEstadoCuentas.idCarpeta INNER JOIN estadosMajor ON UltimoEstadoCuentas.estado = estadosMajor.codigo LEFT OUTER JOIN expedientesxCuenta ON ProfesionalXcuenta.nroCuenta = expedientesxCuenta.nroCuenta WHERE (UltimoEstadoCuentas.estado <> 'REGISTRADO') AND (UltimoEstadoCuentas.estado <> '1316')">
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
