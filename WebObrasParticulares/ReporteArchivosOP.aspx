<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ReporteArchivosOP.aspx.cs" Inherits="ReporteArchivosOP" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
        pagina();
    }
</script>

<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuMunicipio ID="DefaultMenuContent" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
    <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >PROFESIONALES.<br />
    </span></strong>
    <br />
    <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br />
        </span>
    <br />
        <div style="text-align: center; padding-left:200px;">
        <span style="float:right;margin-right:250px;margin-top:-20px;"><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/export_excel.png"
            OnClick="ImageButton2_Click" ToolTip="Exportar a Excel" /></span><br />
          <telerik:RadGrid ID="rGProfesionales" runat="server" AllowSorting="True"  DataSourceID="SqlDataSourcePlanoDigital"
        GridLines="None"  AllowFilteringByColumn="True"  OnItemCommand="rGProfesionales_RowCommand" Height="500px" OnNeedDataSource="rGProfesionales_NeedDataSource" Width="883px" PageSize="20" Skin="Sunset" AllowPaging="True" Font-Names="Helvetica"  >
        <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourcePlanoDigital" PageSize="10" DataKeyNames="nroDocumentoMunicipio">
            <Columns>
                <telerik:GridBoundColumn DataField="fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha del dia"
                    UniqueName="fecha" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Cantidad de archivos subidos" DataType="System.Int32"
                    HeaderText="Cantidad de archivos subidos" ReadOnly="True" SortExpression="Cantidad de archivos subidos"
                    UniqueName="Cantidad de archivos subidos" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nroDocumentoMunicipio" HeaderText="Nro Documento Municipal"
                    ReadOnly="True" SortExpression="Nro DocumentoMunicipal" UniqueName="nroDocumentoMunicipio" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nombre" HeaderText="Nombre" SortExpression="Nombre"
                    UniqueName="nombre" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="apellido" HeaderText="Apellido" SortExpression="Apellido"
                    UniqueName="apellido" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn >
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
              <FilterMenu Width="30px">
              </FilterMenu>
              <FooterStyle Font-Names="Helvetica" />
              <HeaderStyle Font-Names="Helvetica" />
              <ExportSettings ExportOnlyData="True" FileName="Listado de Archivos por Visador"
                  HideStructureColumns="True" OpenInNewWindow="True">
              </ExportSettings>
    </telerik:RadGrid>
            <br />
            <br />
    <asp:Label ID="lblMensaje" runat="server" Font-Size="Large" ForeColor="DarkRed" Text="Label"
        Visible="False"></asp:Label><br />
    </div>
    
    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/images/boton-verificar.png" Visible="False" />&nbsp;
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click" />
    
    <asp:SqlDataSource ID="SqlDataSourcePlanoDigital" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT CONVERT (VARCHAR(10), registroArchivos.fecha, 103) AS fecha, COUNT(*) AS [Cantidad de archivos subidos], MunicipalxCuenta.nroDocumentoMunicipio, Personas.nombre, Personas.apellido FROM registroArchivos INNER JOIN MunicipalxCuenta ON registroArchivos.nrocuenta = MunicipalxCuenta.nroCuenta INNER JOIN Personas ON MunicipalxCuenta.nroDocumentoMunicipio = Personas.nroDocumento WHERE (registroArchivos.subCarpeta = 'Declaración Jurada') AND (MunicipalxCuenta.nroDocumentoMunicipio <> '44') GROUP BY CONVERT (VARCHAR(10), registroArchivos.fecha, 103), MunicipalxCuenta.nroDocumentoMunicipio, Personas.nombre, Personas.apellido ORDER BY SUBSTRING(CONVERT(VARCHAR(10), registroArchivos.fecha, 103), 4, 10)">
    </asp:SqlDataSource>
    &nbsp;<br />
    &nbsp;
     <script type="text/javascript">

    function OpenAlert(text)
    {
     radalert("<p><strong>" + text +"</strong>!</p>", 500, 200, "Importarte");
   }
   function  OpenConfirm(text)
    {
       return   radconfirm("<p><strong>" + text +"</strong>!</p>", 500, 200, "Confirmación");      
   }
   function CallBackFn(arg)  
        {  
           OpenAlert(arg);
        }  
    
</script>
</asp:Content>
