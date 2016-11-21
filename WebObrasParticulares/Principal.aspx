<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Principal.aspx.cs" Inherits="Principal" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenuProfesional" Src="DefaultMenuProfesional.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        borrarCondiciones();
        cargarProfesional();
        
    }
</script>


<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuProfesional ID="DefaultMenuContent" runat="server"/>
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
  

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
            <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >PROFESIONALES - PRINCIPAL.<br />
    </span></strong>
    <span style="font-family: Helvetica; font-size: 19px">
    Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; - Antes de ejecutar una acción debe seleccionar una cuenta.<br />
   <br />
    &nbsp; USTED INGRESO COMO :
        <asp:Label ID="lblProfesional" runat="server" Text="-"></asp:Label><br />
        <br />
       </span><telerik:RadGrid ID="rgCuentaProfesional"  OnSelectedIndexChanged="rgCuentaProfesional_SelectedIndexChanged" runat="server" AllowSorting="True" DataSourceID="SqlDataSourceTigre_MUNI"
         GridLines="None" Skin="Sunset" style="font-family: Helvetica;" Font-Names="Helvetica" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgCuentaProfesional_NeedDataSource" >
           <FooterStyle Font-Names="Helvetica" />
           <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceTigre_MUNI"  >
               <Columns>
                   <telerik:GridBoundColumn DataField="Nro de cuenta municipal" HeaderText="Nro de cuenta municipal"
                       SortExpression="Nro de cuenta municipal" UniqueName="Nro de cuenta municipal" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                   </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="Nomenclatura Completa" HeaderText="Nomenclatura Completa"
                       ReadOnly="True" SortExpression="Nomenclatura Completa" UniqueName="Nomenclatura Completa" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                   </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="Unidad Funcional" HeaderText="Unidad Funcional"
                       ReadOnly="True" SortExpression="Unidad Funcional" UniqueName="Unidad Funcional" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                   </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="Datos del contribuyente" HeaderText="Datos del contribuyente"
                       ReadOnly="True" SortExpression="Datos del contribuyente" UniqueName="Datos del contribuyente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                   </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="Importe de la deuda" DataType="System.Decimal"
                       HeaderText="Importe de la deuda" SortExpression="Importe de la deuda" UniqueName="Importe de la deuda" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                   </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" SortExpression="Estado"
                       UniqueName="Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                   </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="Fecha del Estado" DataType="System.DateTime"
                       HeaderText="Fecha del Estado" SortExpression="Fecha del Estado" UniqueName="Fecha del Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                   </telerik:GridBoundColumn>
               </Columns>
               <PagerStyle NextPageText="Siguiente" PrevPageText="Anterior" />
           </MasterTableView>
           <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
           <ClientSettings EnablePostBackOnRowClick="True">
               <Selecting AllowRowSelect="True" />
               <Scrolling AllowScroll="True" UseStaticHeaders="True" />
           </ClientSettings>
       </telerik:RadGrid><asp:SqlDataSource ID="SqlDataSourceTigre_MUNI" runat="server"
           ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>" SelectCommand="SELECT        dbplanos.nroCuenta AS [Nro de cuenta municipal], dbtigre.Nomenclatura_Completa AS [Nomenclatura Completa], &#13;&#10;                         dbtigre.Nomenclatura_UFuncional AS [Unidad Funcional], dbtigre.Inmueble_Contribuyente AS [Datos del contribuyente], &#13;&#10;                         dbtigre.Deuda_Importe AS [Importe de la deuda], estadosMajor.sidop AS Estado, UltimoEstadoCuentas.fecha AS [Fecha del Estado]&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS dbtigre INNER JOIN&#13;&#10;                         ProfesionalXcuenta AS dbplanos ON dbtigre.Cuenta = dbplanos.nroCuenta INNER JOIN&#13;&#10;                         UltimoEstadoCuentas ON dbtigre.Cuenta = UltimoEstadoCuentas.idCarpeta INNER JOIN&#13;&#10;                         estadosMajor ON UltimoEstadoCuentas.estado = estadosMajor.codigo&#13;&#10;WHERE        (dbplanos.nroDocumentoProfesional = @nroDocumentoProfesional)">
           <SelectParameters>
               <asp:SessionParameter Name="nroDocumentoProfesional" SessionField="NroDocumentoProfesional" />
           </SelectParameters>
       </asp:SqlDataSource>
        <br />
       <div style="text-align: center;">
    <asp:GridView ID="gvwCuentas" runat="server" AutoGenerateColumns="False" DataKeyNames="nroDocumentoProfesional,nroCuenta"
        DataSourceID="SqlDataSourcePlanoDigital" OnSelectedIndexChanged="gvwCuentas_SelectedIndexChanged" OnRowCommand="gvwCuentas_RowCommand" AllowPaging="True" style="table-layout: auto; padding-right: 2px; padding-left: 2px; padding-bottom: 2px; margin: 2px; padding-top: 2px; border-collapse: separate; border-top-width: thin; border-left-width: thin; border-left-color: #7d0506; border-bottom-width: thin; border-bottom-color: #7d0506; border-top-color: #7d0506; border-right-width: thin; border-right-color: #7d0506; font-family: Helvetica;" CellPadding="10" ForeColor="#333333" GridLines="None" Width="100%" Visible="False">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="nroDocumentoProfesional" HeaderText="Nro Documento Profesional"
                ReadOnly="True" SortExpression="nroDocumentoProfesional" />
            <asp:BoundField DataField="nroCuenta" HeaderText="Nro de Cuenta Municipal" ReadOnly="True" SortExpression="nroCuenta" />
            <asp:ButtonField CommandName="DJ" Text="Leer.." AccessibleHeaderText="Mas Info.." HeaderText="Mas Info.." />
            <asp:ButtonField Text="Descargar" CommandName="Plancheta" AccessibleHeaderText="Plancheta Catastral" HeaderText="Plancheta Catastral"/>
            <asp:ButtonField CommandName="declaracion" Text="Descargar DJ"  AccessibleHeaderText="Declaracion Jurada" HeaderText="Declaracion Jurada" />
            <asp:ButtonField CommandName="Derechos" Text="Liquidar Derechos" AccessibleHeaderText="Liq. Derechos de Construccion" HeaderText="Liq. Derechos de Construccion" />
            <asp:ButtonField AccessibleHeaderText="Plano Registrado" CommandName="constancia"
                HeaderText="Plano Registrado" Text="Ver Constancia" />
        </Columns>
        <SelectedRowStyle BorderColor="#FFC080" BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#7D0506" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#7D0506" BorderColor="DimGray" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView></div>
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
            var oExplorer = $find("<%=FileExplorerObrasParticulares.ClientID%>");      
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
     /*if((args.get_item().get_name()=="Plano Verificado")||(args.get_item().get_name()=="Arbolado Urbano")){
     alert("Usted no tiene permisos para visualizar la carpeta " + args.get_item().get_name());
     var oExplorer = $find("<%=FileExplorerObrasParticulares.ClientID%>");
     oExplorer.refresh();
     } 
     
     if((args.get_item().get_name()=="Inspeccion")||(args.get_item().get_name()=="Inspeccion")){
     alert("Usted no tiene permisos para visualizar la carpeta " + args.get_item().get_name());
     var oExplorer = $find("<%=FileExplorerObrasParticulares.ClientID%>");
     oExplorer.refresh();
     }*/
}
function OnClientItemSelected(sender, args) {
     //LogEvent("Tree folder change: " + args.get_item().get_name());
     if((args.get_item().get_name()=="Plano a Registrar")||(args.get_item().get_name()=="Arbolado Urbano")||(args.get_item().get_name()=="Plano Verificado")||(args.get_item().get_name()=="Inspeccion")){
     alert("Usted no tiene permisos para visualizar la carpeta " + args.get_item().get_name());
     
     } 
     /*if((args.get_item().get_name()=="Plano Verificado")||(args.get_item().get_name()=="Arbolado Urbano")){
     alert("Usted no tiene permisos para visualizar la carpeta " + args.get_item().get_name());
     
     } */
       
}
     function alerta(texto) {
     //LogEvent("Tree folder change: " + args.get_item().get_name());
    
     alert(texto);
     
}
    </script>

    <asp:Label ID="lblSelec" runat="server" Font-Bold="True" Font-Size="Large" Text="-"></asp:Label><br />
    &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
    <div>
      <div style="float:left; text-align:center;">  <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
          <asp:Image ID="imgConsulta" runat="server" ImageUrl="~/images/botones/consulta-titulos.png" /><br />
    <asp:ImageButton ID="imbDatosCuenta" runat="server"  ImageUrl="~/images/botones/datos-cuenta.png" OnClick="imbDatosCuenta_Click" Enabled="False" /><asp:ImageButton ID="imbPlancheta" runat="server"  ImageUrl="~/images/botones/plancheta-catastral.png" OnClick="imbPlancheta_Click" Enabled="False" /><asp:ImageButton ID="imbExplorar" runat="server"  ImageUrl="~/images/botones/explorar.png" OnClick="imbExplorar_Click" Enabled="False" /><asp:ImageButton ID="imbCartelObra" runat="server"  ImageUrl="~/images/botones/cartel-de-obra.png" OnClick="imbCartelObra_Click" Enabled="False" /><br />
          <asp:ImageButton ID="imbConstanciaInscripcion" runat="server"  ImageUrl="~/images/botones/constancia-de-inscripcion.png" OnClick="imbConstanciaInscripcion_Click" />
          <asp:ImageButton ID="imgHistorialCorreo" runat="server"  ImageUrl="~/images/botones/historial-correo-rojo.png" OnClick="imgHistorialCorreo_Click" />
          <br />
            </span></strong>
            <br />
            </div>
            <div style="text-align:center;">
            <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >
                <asp:Image ID="imgOperacion" runat="server" ImageUrl="~/images/botones/operaciones-titulo.png" /><br />
            <asp:ImageButton ID="imbDeclaracionJurada" runat="server"  ImageUrl="~/images/botones/declaracion-jurada.png" OnClick="imbDeclaracionJurada_Click" Enabled="False" /><asp:ImageButton ID="imbLiquidarDerechos" runat="server"  ImageUrl="~/images/botones/liquidar-derechos.png" OnClick="ImbLiquidarDerechos_Click" Enabled="False" /><asp:ImageButton ID="imbLiquidarSellado" runat="server"  ImageUrl="~/images/botones/liquidar-sellado.png" OnClick="imbLiquidarSellado_Click" Enabled="False" /><asp:ImageButton ID="imbDatosObra" runat="server"  ImageUrl="~/images/botones/datos-estado-obra.png" OnClick="imbDatosObra_Click" Enabled="False" /><br />
                <asp:ImageButton ID="ImbSubirArchivo" runat="server"  ImageUrl="~/images/botones/subir-archivos.png" OnClick="ImbSubirArchivo_Click" Enabled="False" />
                <asp:ImageButton ID="ImbAvisoInicioObra" runat="server"  ImageUrl="~/images/botones/aviso-obra.png" OnClick="ImbAvisoInicioObra_Click" Enabled="True" /><asp:ImageButton ID="ImbSolicitudInspeccion" runat="server"  ImageUrl="~/images/botones/solicitud-inspeccion.png" OnClick="ImbSolicitudInspeccion_Click" Enabled="True" /><asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/images/botones/contactar.png" Enabled="False" /></span></strong>
             </div>
            </div>
    <br />
    <br />
    <br />
    <br />
        <br />
     <div style="text-align: center;">
         &nbsp;<telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" DataSourceID="SqlDataSourceCuentasTigre"
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceMuni1" Visible="False">
        <Columns>
            <asp:BoundField DataField="Cuenta" HeaderText="Cuenta" ReadOnly="True" SortExpression="Cuenta" />
            <asp:BoundField DataField="Nomenclatura_Completa" HeaderText="Nomenclatura_Completa"
                ReadOnly="True" SortExpression="Nomenclatura_Completa" />
            <asp:BoundField DataField="Nomenclatura_Circunscripcion" HeaderText="Nomenclatura_Circunscripcion"
                ReadOnly="True" SortExpression="Nomenclatura_Circunscripcion" />
            <asp:BoundField DataField="Nomenclatura_Seccion" HeaderText="Nomenclatura_Seccion"
                SortExpression="Nomenclatura_Seccion" />
            <asp:BoundField DataField="Nomenclatura_CodigoAmanzanamiento" HeaderText="Nomenclatura_CodigoAmanzanamiento"
                ReadOnly="True" SortExpression="Nomenclatura_CodigoAmanzanamiento" />
            <asp:BoundField DataField="Nomenclatura_Chacra" HeaderText="Nomenclatura_Chacra"
                SortExpression="Nomenclatura_Chacra" />
            <asp:BoundField DataField="Nomenclatura_LetraChacra" HeaderText="Nomenclatura_LetraChacra"
                SortExpression="Nomenclatura_LetraChacra" />
            <asp:BoundField DataField="Nomenclatura_Quinta" HeaderText="Nomenclatura_Quinta"
                SortExpression="Nomenclatura_Quinta" />
            <asp:BoundField DataField="Nomenclatura_LetraQuinta" HeaderText="Nomenclatura_LetraQuinta"
                SortExpression="Nomenclatura_LetraQuinta" />
            <asp:BoundField DataField="Nomenclatura_Fraccion" HeaderText="Nomenclatura_Fraccion"
                SortExpression="Nomenclatura_Fraccion" />
            <asp:BoundField DataField="Nomenclatura_LetraFraccion" HeaderText="Nomenclatura_LetraFraccion"
                SortExpression="Nomenclatura_LetraFraccion" />
            <asp:BoundField DataField="Nomenclatura_Manzana" HeaderText="Nomenclatura_Manzana"
                SortExpression="Nomenclatura_Manzana" />
            <asp:BoundField DataField="Nomenclatura_LetraManzana" HeaderText="Nomenclatura_LetraManzana"
                SortExpression="Nomenclatura_LetraManzana" />
            <asp:BoundField DataField="Nomenclatura_Parcela" HeaderText="Nomenclatura_Parcela"
                SortExpression="Nomenclatura_Parcela" />
            <asp:BoundField DataField="Nomenclatura_LetraParcela" HeaderText="Nomenclatura_LetraParcela"
                SortExpression="Nomenclatura_LetraParcela" />
            <asp:BoundField DataField="Nomenclatura_UFuncional" HeaderText="Nomenclatura_UFuncional"
                ReadOnly="True" SortExpression="Nomenclatura_UFuncional" />
            <asp:BoundField DataField="Nomenclatura_UComplementaria" HeaderText="Nomenclatura_UComplementaria"
                ReadOnly="True" SortExpression="Nomenclatura_UComplementaria" />
            <asp:BoundField DataField="Inmueble_ClaveWeb" HeaderText="Inmueble_ClaveWeb" SortExpression="Inmueble_ClaveWeb" />
            <asp:BoundField DataField="Inmueble_Contribuyente" HeaderText="Inmueble_Contribuyente"
                ReadOnly="True" SortExpression="Inmueble_Contribuyente" />
            <asp:BoundField DataField="Inmueble_Calle" HeaderText="Inmueble_Calle" ReadOnly="True"
                SortExpression="Inmueble_Calle" />
            <asp:BoundField DataField="Inmueble_Altura" HeaderText="Inmueble_Altura" ReadOnly="True"
                SortExpression="Inmueble_Altura" />
            <asp:BoundField DataField="Inmueble_Piso" HeaderText="Inmueble_Piso" ReadOnly="True"
                SortExpression="Inmueble_Piso" />
            <asp:BoundField DataField="Inmueble_Depto" HeaderText="Inmueble_Depto" ReadOnly="True"
                SortExpression="Inmueble_Depto" />
            <asp:BoundField DataField="Inmueble_Localidad" HeaderText="Inmueble_Localidad" ReadOnly="True"
                SortExpression="Inmueble_Localidad" />
            <asp:BoundField DataField="Inmueble_Barrio" HeaderText="Inmueble_Barrio" SortExpression="Inmueble_Barrio" />
            <asp:BoundField DataField="Deuda_Importe" HeaderText="Deuda_Importe" ReadOnly="True"
                SortExpression="Deuda_Importe" />
        </Columns>
    </asp:GridView>
    <asp:HiddenField ID="ctlHiddenField" runat="server" />
    &nbsp;
    <telerik:RadFileExplorer ID="FileExplorerObrasParticulares" OnClientItemSelected="OnClientItemSelected" OnClientFolderChange="OnClientFolderChange" runat="server" Height="256px"
        meta:resourcekey="FileExplorerObrasParticularesResource1"  EnableOpenFile="False" Skin="Sunset" VisibleControls="TreeView, Grid, Toolbar, AddressBox, ContextMenus"
        Width="1200px" Language="es-ES" LocalizationPath="~/App_GlobalResources/" DisplayUpFolderItem="True" OnClientFileOpen="OnClientFileOpen" EnableCreateNewFolder="False"  style="font-family: Helvetica" OnClientLoad="ClientLoad" OnClientMove="ClientLoad">
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
    &nbsp;&nbsp;&nbsp;&nbsp;<br />
    &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Visible="False" />
    

</asp:Content>
