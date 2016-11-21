<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="HistorialCorreoGeneral.aspx.cs" Inherits="HistorialCorreoGeneral" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
         <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >CORRESPONDENCIA
             DE TODAS LAS CUENTA.<br />
    </span></strong>
          <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br /></span>
    &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp;<div style="text-align: center;">
    <telerik:RadGrid ID="rGCorreos" runat="server" DataSourceID="SqlDataSourceCorreos"
        GridLines="None" AllowFilteringByColumn="True" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica" AllowSorting="True">
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceCorreos">
            <Columns>
                <telerik:GridBoundColumn DataField="Cuenta" HeaderText="Cuenta" ReadOnly="True" SortExpression="Cuenta"
                    UniqueName="Cuenta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura Completa" HeaderText="Nomenclatura Completa"
                    ReadOnly="True" SortExpression="Nomenclatura Completa" UniqueName="Nomenclatura Completa" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Contribuyente" HeaderText="Contribuyente" ReadOnly="True"
                    SortExpression="Contribuyente" UniqueName="Contribuyente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="E-Mail de Origen" HeaderText="E-Mail de Origen"
                    SortExpression="E-Mail de Origen" UniqueName="E-Mail de Origen" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="E-Mail de Destino" HeaderText="E-Mail de Destino"
                    SortExpression="E-Mail de Destino" UniqueName="E-Mail de Destino" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Asunto del mensaje" HeaderText="Asunto del mensaje"
                    SortExpression="Asunto del mensaje" UniqueName="Asunto del mensaje" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha del mensaje" DataType="System.DateTime"
                    HeaderText="Fecha del mensaje" SortExpression="Fecha del mensaje" UniqueName="Fecha del mensaje" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Mensaje" HeaderText="Mensaje" SortExpression="Mensaje"
                    UniqueName="Mensaje" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid><br /></div>
    <asp:ImageButton ID="imgVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imgVolver_Click" /><br />
    <asp:SqlDataSource ID="SqlDataSourceCorreos" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta, CAST(eCuenta.numero AS NVARCHAR(7)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(7)) AS Expediente, Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Nomenclatura_Completa AS [Nomenclatura Completa], Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Inmueble_Contribuyente AS Contribuyente, HistorialCorreo.origen AS [E-Mail de Origen], HistorialCorreo.destino AS [E-Mail de Destino], HistorialCorreo.asunto AS [Asunto del mensaje], HistorialCorreo.fecha AS [Fecha del mensaje], HistorialCorreo.mensaje AS Mensaje FROM Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles INNER JOIN HistorialCorreo ON Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = HistorialCorreo.nrocuenta LEFT JOIN expedientesxCuenta AS eCuenta ON Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = eCuenta.nroCuenta ORDER BY Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta, [Fecha del mensaje]">
    </asp:SqlDataSource>
    <br />
    

</asp:Content>
