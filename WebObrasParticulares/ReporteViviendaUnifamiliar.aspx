<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ReporteViviendaUnifamiliar.aspx.cs" Inherits="ReporteViviendaUnifamiliar" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
    &nbsp;<strong><span style="font-size: 20pt; color: #7d0506; font-family: Helvetica">REPORTE
        VIVIENDAS UNIFAMILIAR</span></strong><span><strong> </strong>
             <asp:Label ID="lblCuenta" runat="server" Text="-"></asp:Label><strong>.<br />
            </strong>
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/export_excel.png"
                OnClick="ImageButton2_Click" ToolTip="Exportar a Excel" /><br />
        </span>&nbsp; &nbsp; &nbsp; &nbsp;<br />
    <div style="text-align: center;">
    <telerik:RadGrid ID="rGCorreos" runat="server" DataSourceID="SqlDataSourceCorreos"
        GridLines="None" AllowFilteringByColumn="True" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica" AllowSorting="True" PageSize="20" ShowFooter="True">
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceCorreos">
            <Columns>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="idCarpeta" HeaderText="Nro Cuenta" SortExpression="idCarpeta"
                    UniqueName="idCarpeta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fecha" DataType="System.DateTime" HeaderText="Fecha del &#250;ltimo estado"
                    SortExpression="fecha" UniqueName="fecha" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="estado" HeaderText="Cod &#218;ltimo Estado" ReadOnly="True" SortExpression="estado"
                    UniqueName="estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sidop" HeaderText="&#218;ltimo Estado" SortExpression="sidop"
                    UniqueName="sidop" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="destino" HeaderText="Destino" SortExpression="destino"
                    UniqueName="destino" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
        <ExportSettings IgnorePaging="True">
        </ExportSettings>
    </telerik:RadGrid><br /></div>
    <asp:ImageButton ID="imgVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imgVolver_Click" /><br />
    <asp:SqlDataSource ID="SqlDataSourceCorreos" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT DISTINCT CAST(eCuenta.numero AS NVARCHAR(8)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(8)) AS Expediente, Carpetas.idCarpeta, UltimoEstadoCuentas.fecha, UltimoEstadoCuentas.estado, estadosMajor.sidop, Destino.destino FROM estadosMajor INNER JOIN UltimoEstadoCuentas INNER JOIN Carpetas ON UltimoEstadoCuentas.idCarpeta = Carpetas.idCarpeta LEFT OUTER JOIN expedientesxCuenta AS eCuenta ON Carpetas.idCarpeta = eCuenta.nroCuenta ON estadosMajor.codigo = UltimoEstadoCuentas.estado INNER JOIN Estadistica ON Carpetas.idCarpeta = Estadistica.nrocuenta INNER JOIN Destino ON Estadistica.destino = Destino.id_destino WHERE (Estadistica.destino = 13) AND (UltimoEstadoCuentas.estado <> '1316') AND (UltimoEstadoCuentas.estado <> '0003') AND (UltimoEstadoCuentas.estado <> 'Registrado') ORDER BY Carpetas.idCarpeta">
    </asp:SqlDataSource>
    <br />
    

</asp:Content>
