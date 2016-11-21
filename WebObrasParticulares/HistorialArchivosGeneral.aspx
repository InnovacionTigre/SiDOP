<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="HistorialArchivosGeneral.aspx.cs" Inherits="HistorialArchivosGeneral" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
        cargarVariables();
    }
</script>


<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuProfesional ID="DefaultMenuContent" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
  

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
         <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >MOVIMIENTOS
             DE ARCHIVOS DEL EXPEDIENTE DE TODAS LA CUENTAS .<br />
    </span></strong>
          <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br /></span>
    &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp;<div style="text-align: center;">
    <span style="float:right;margin-right:250px;margin-top:-20px;"><asp:ImageButton ID="imbExportar" runat="server" ImageUrl="~/images/export_excel.png"
            OnClick="imbExportar_Click" ToolTip="Exportar a Excel" /></span><br />
    <telerik:RadGrid ID="rGCorreos" runat="server" DataSourceID="SqlDataSourceCorreos"
        GridLines="None" AllowFilteringByColumn="True" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica" AllowSorting="True">
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceCorreos">
            <Columns>
                <telerik:GridBoundColumn DataField="Cuenta" HeaderText="Cuenta Municipal" ReadOnly="True" SortExpression="Cuenta"
                    UniqueName="Cuenta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Completa" HeaderText="Nomenclatura"
                    ReadOnly="True" SortExpression="Nomenclatura_Completa" UniqueName="Nomenclatura_Completa" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inmueble_Contribuyente" HeaderText="Propietario"
                    ReadOnly="True" SortExpression="Inmueble_Contribuyente" UniqueName="Inmueble_Contribuyente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Generador de archivo" HeaderText="Generador de archivo"
                    ReadOnly="True" SortExpression="Generador de archivo" UniqueName="Generador de archivo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fecha" DataType="System.DateTime" HeaderText="Fecha"
                    SortExpression="fecha" UniqueName="fecha" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="oficinaDestino" HeaderText="Oficina de Destino" SortExpression="oficinaDestino"
                    UniqueName="oficinaDestino" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="subCarpeta" HeaderText="Sub Carpeta" SortExpression="subCarpeta"
                    UniqueName="subCarpeta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nombreArchivo" HeaderText="Nombre del Archivo" SortExpression="nombreArchivo"
                    UniqueName="nombreArchivo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nro_archivo" DataType="System.Int32" HeaderText="Nro de archivo"
                    SortExpression="nro_archivo" UniqueName="nro_archivo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
        <ExportSettings FileName="Movimiento de archivo de expedientes" IgnorePaging="True">
        </ExportSettings>
    </telerik:RadGrid><br /></div>
    <asp:ImageButton ID="imgVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imgVolver_Click" /><br />
    <asp:SqlDataSource ID="SqlDataSourceCorreos" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta, Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Nomenclatura_Completa, Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Inmueble_Contribuyente, Personas.apellido + ' ' + Personas.nombre AS [Generador de archivo], registroArchivos.fecha, registroArchivos.oficinaDestino, registroArchivos.subCarpeta, registroArchivos.nombreArchivo, registroArchivos.nro_archivo, CAST(eCuenta.numero AS NVARCHAR(8)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(8)) AS Expediente FROM Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles INNER JOIN registroArchivos ON Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = registroArchivos.nrocuenta INNER JOIN Personas ON registroArchivos.nroDocumentoProfesional = Personas.nroDocumento LEFT JOIN expedientesxCuenta AS eCuenta ON Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = eCuenta.nroCuenta ORDER BY Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta, registroArchivos.fecha">
    </asp:SqlDataSource>
    <br />
    

</asp:Content>
