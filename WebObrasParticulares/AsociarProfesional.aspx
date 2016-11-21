<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="AsociarProfesional.aspx.cs" Inherits="AsociarProfesional" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
cargaDeuda();
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

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
         <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >ASOCIAR PROFESIONALES.<br />
    </span></strong>
         <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br /></span>
    <br /><span style="font-size: 15pt; color: #7d0506;font-family: Helvetica" >
    <asp:Label ID="lblDeuda" runat="server" Text="Label" Visible="False"></asp:Label><br />
        <br />  </span>
    <span style="font-size: 15pt; color: #7d0506;font-family: Helvetica" >
    PROFESIONALES A SOCIADOS A MI CUENTA MUNICIPAL<br />
    </span>
     <div style="text-align: center;">
    <telerik:RadGrid ID="RdProfesionalesxcuenta" runat="server" DataSourceID="SqlDataSourceProfesionalesxCuenta"
        GridLines="None" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceProfesionalesxCuenta">
            <Columns>
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
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceProfesionalesxCuenta" runat="server"
        ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>" SelectCommand="SELECT Personas.nroDocumento, Personas.nombre, Personas.apellido, Personas.mail FROM ProfesionalXcuenta INNER JOIN Personas ON ProfesionalXcuenta.nroDocumentoProfesional = Personas.nroDocumento WHERE (ProfesionalXcuenta.nroCuenta = @variable)">
        <SelectParameters>
            <asp:SessionParameter Name="variable" SessionField="nroCuenta" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ImageButton ID="ImbDesvincular" runat="server" ImageUrl="~/images/desvincular.png"
        OnClick="ImbDesvincular_Click" /><br />
    <br />
        <span style="font-size: 15pt; color: #7d0506;font-family: Helvetica" >
    ASOCIAR NUEVO PROFESIONAL.<br /></span>
     <div style="text-align: center;">
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" DataSourceID="SqlDataSourcePlanoDigital"
        GridLines="None" Width="100%" Skin="Sunset" Font-Names="Helvetica" AllowPaging="True">
        <MasterTableView DataSourceID="SqlDataSourcePlanoDigital" AutoGenerateColumns="False" DataKeyNames="nroDocumento">
            <Columns>
                <telerik:GridBoundColumn DataField="nombre" HeaderText="Nombre" SortExpression="nombre"
                    UniqueName="nombre" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="apellido" HeaderText="Apellido" SortExpression="apellido"
                    UniqueName="apellido" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mail" HeaderText="E-mail" SortExpression="mail"
                    UniqueName="mail" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tipoDocumento" HeaderText="Tipo de Documento"
                    SortExpression="tipoDocumento" UniqueName="tipoDocumento" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nroDocumento" HeaderText="Nro de Documento" ReadOnly="True"
                    SortExpression="nroDocumento" UniqueName="nroDocumento" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nroRegistroProfesional" HeaderText="Nro de Registro Profesional"
                    SortExpression="nroRegistroProfesional" UniqueName="nroRegistroProfesional" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <FilterMenu AutoScrollMinimumWidth="20" Width="15px" Skin="Vista">
        </FilterMenu>
        <FooterStyle Font-Names="Helvetica" />
        <PagerStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid>
    </div>
    <asp:GridView ID="gvwProfesionales" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="nroDocumento"
        DataSourceID="SqlDataSourcePlanoDigital" ForeColor="Black" GridLines="Horizontal" Visible="False">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre"  />
            <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
            <asp:BoundField DataField="mail" HeaderText="E-Mail" SortExpression="mail" />
            <asp:BoundField DataField="tipoDocumento" HeaderText="Tipo de Documento" SortExpression="tipoDocumento" />
            <asp:BoundField DataField="nroDocumento" HeaderText="Nro Documento" ReadOnly="True"
                SortExpression="nroDocumento" />
            <asp:BoundField DataField="nroRegistroProfesional" HeaderText="Nro de Matricula"
                SortExpression="nroRegistroProfesional" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSourcePlanoDigital" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT Personas.nombre, Personas.apellido, Personas.mail, Profesionales.tipoDocumento, Profesionales.nroDocumento, Profesionales.nroRegistroProfesional FROM Personas INNER JOIN Profesionales ON Personas.nroDocumento = Profesionales.nroDocumento&#13;&#10;order by Personas.apellido">
    </asp:SqlDataSource>
    <asp:Button ID="btnAsociar" runat="server" OnClick="btnAsociar_Click" Text="Vincular a mi cuenta" />
    
    <asp:UpdatePanel id="UpdatePanel1" runat="server" >
        <contenttemplate>
<DIV>&nbsp;<BR /> </DIV>
</contenttemplate>
    </asp:UpdatePanel>
    &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<br />
   
    <br />
    
    &nbsp;
    

</asp:Content>
