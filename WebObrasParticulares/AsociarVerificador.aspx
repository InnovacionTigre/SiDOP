<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="AsociarVerificador.aspx.cs" Inherits="AsociarProfesional" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
          <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >ASOCIAR VERIFICADORES.<br />
    </span></strong>
          <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br /></span>
    <br />
    <span style="font-size: 15pt; color: #7d0506;font-family: Helvetica" >
    VERIFICADORES ASOCIADOS A CUENTAS MUNICIPALES<br /></span>
    <br />
     <div style="text-align: center;">
    <telerik:RadGrid ID="RdVerificadoresXcuenta" runat="server" AllowFilteringByColumn="True"
        AllowPaging="True" DataSourceID="SqlDataSourceVerificadoresAsociados" GridLines="None" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceVerificadoresAsociados">
            <Columns>
                <telerik:GridBoundColumn DataField="nroCuenta" HeaderText="Nro de Cuenta" SortExpression="nroCuenta"
                    UniqueName="nroCuenta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nroDocumento" HeaderText="Nro de Documento" SortExpression="nroDocumento"
                    UniqueName="nroDocumento" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nombre" HeaderText="Nombre" SortExpression="nombre"
                    UniqueName="nombre" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="apellido" HeaderText="Apellido" SortExpression="apellido"
                    UniqueName="apellido" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mail" HeaderText="E-mail" SortExpression="mail"
                    UniqueName="mail" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid></div><asp:SqlDataSource ID="SqlDataSourceVerificadoresAsociados" runat="server"
        ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>" SelectCommand="SELECT MunicipalxCuenta.nroCuenta, Personas.nroDocumento, Personas.nombre, Personas.apellido, Personas.mail FROM MunicipalxCuenta INNER JOIN Personas ON MunicipalxCuenta.nroDocumentoMunicipio = Personas.nroDocumento ORDER BY MunicipalxCuenta.nroCuenta">
    </asp:SqlDataSource>
    <asp:ImageButton ID="ImbDesvincular" runat="server" ImageUrl="~/images/desvincular.png"
        OnClick="ImbDesvincular_Click" /><br />
    <span style="font-size: 15pt; color: #7d0506;font-family: Helvetica" >
    + ASOCIAR NUEVOS VERIFICADORES<br /></span>
    <br />
   <span style="font-size: 15pt; color: #7d0506;font-family: Helvetica" >
    Verificadores de Obras Particulares<br /></span>
     <div style="text-align: center;">
    <telerik:RadGrid ID="RadGrid1" runat="server" Width="688px" DataSourceID="SqlDataSourceVerificadores" GridLines="None" AllowFilteringByColumn="True" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceVerificadores">
            <Columns>
                <telerik:GridBoundColumn DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre"
                    UniqueName="Nombre" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido"
                    UniqueName="Apellido" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NroDocumento" HeaderText="Nro de Documento" SortExpression="NroDocumento"
                    UniqueName="NroDocumento" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mail" HeaderText="E-mail" SortExpression="mail"
                    UniqueName="mail" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid></div><asp:SqlDataSource ID="SqlDataSourceVerificadores" runat="server"
        ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>" SelectCommand="Select Personas.Nombre, Personas.Apellido, Personas.NroDocumento, Personas.mail from Personas where Personas.tipo=1&#13;&#10;Order by Personas.nombre">
    </asp:SqlDataSource>
    <br />
    <span style="font-size: 15pt; color: #7d0506;font-family: Helvetica" >
    Cuentas Municipales Activas en Plano Digital&nbsp;</span>
     <div style="text-align: center;">
    <telerik:RadGrid ID="RadGrid2" runat="server" Width="696px" DataSourceID="SqlDataSourceCuentasAbiertas" GridLines="None" AllowFilteringByColumn="True" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView DataSourceID="SqlDataSourceCuentasAbiertas" AutoGenerateColumns="False" DataKeyNames="idCarpeta,Estado,fecha">
            <Columns>
                <telerik:GridBoundColumn DataField="idCarpeta" HeaderText="idCarpeta" ReadOnly="True"
                    SortExpression="idCarpeta" UniqueName="idCarpeta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado"
                    UniqueName="Estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion"
                    UniqueName="Observacion" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fecha" DataType="System.DateTime" HeaderText="Fecha"
                    ReadOnly="True" SortExpression="fecha" UniqueName="fecha" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid></div><asp:SqlDataSource ID="SqlDataSourceCuentasAbiertas" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>" SelectCommand="SELECT * FROM [Carpetas] WHERE (([Estado] = @Estado) or ([Estado] = '1280'))">
        <SelectParameters>
            <asp:Parameter DefaultValue="Activo" Name="Estado" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;<br />
    <asp:Button ID="btnAsociar" runat="server" OnClick="btnAsociar_Click" Text="Vincular a la cuenta" />
    &nbsp; &nbsp;
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<br />
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click" /><br />
    
    &nbsp;
    

</asp:Content>
