<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ActivarProfesionales.aspx.cs" Inherits="ActivarProfesionales" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br /></span>
    <br />
        <div style="text-align: center; padding-left:200px;">
        <span style="float:right;margin-right:250px;margin-top:-20px;"><asp:ImageButton ID="imbExportar" runat="server" ImageUrl="~/images/export_excel.png"
            OnClick="imbExportar_Click" ToolTip="Exportar a Excel" /></span><br />
          <telerik:RadGrid ID="rGProfesionales" runat="server" AllowSorting="True"  DataSourceID="SqlDataSourcePlanoDigital"
        GridLines="None"  AllowFilteringByColumn="True"  OnItemCommand="rGProfesionales_RowCommand" Height="500px" OnNeedDataSource="rGProfesionales_NeedDataSource" Width="883px" PageSize="15" Skin="Sunset" AllowPaging="True" Font-Names="Helvetica"  >
        <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourcePlanoDigital" PageSize="10">
            <Columns>
                <telerik:GridBoundColumn  DataField="apellido" HeaderText="Apellido/s" SortExpression="apellido"
                    UniqueName="apellido" FilterControlWidth="60px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                    <HeaderStyle Width="75px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nombre" HeaderText="Nombre/s" SortExpression="nombre"
                    UniqueName="nombre" FilterControlWidth="60px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                    <HeaderStyle Width="75px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nroDocumento" HeaderText="Nro de Documento" SortExpression="nroDocumento"
                    UniqueName="nroDocumento" FilterControlWidth="60px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                    <HeaderStyle Width="75px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mail" HeaderText="E-Mail" SortExpression="mail"
                    UniqueName="mail" FilterControlWidth="60px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                    <HeaderStyle Width="75px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="telefono" HeaderText="Telefono" SortExpression="telefono"
                    UniqueName="telefono" FilterControlWidth="60px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                    <HeaderStyle Width="75px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nroRegistroProfesional" HeaderText="Nro Registro Profesional"
                    SortExpression="nroRegistroProfesional" UniqueName="nroRegistroProfesional" FilterControlWidth="60px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                    <HeaderStyle Width="60px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado"
                    UniqueName="Estado" FilterControlWidth="30px" CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                    <HeaderStyle Width="60px" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn CommandName="Cambiar" Text="Cambiar Estado" UniqueName="column1">
                    <HeaderStyle Width="50px" />
                </telerik:GridButtonColumn>
                <telerik:GridButtonColumn CommandName="password" HeaderText="Contrase&#241;as" Text="Restablecer Contrase&#241;a"
                    UniqueName="column">
                </telerik:GridButtonColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
              <FilterMenu Width="30px">
              </FilterMenu>
              <FooterStyle Font-Names="Helvetica" />
              <HeaderStyle Font-Names="Helvetica" />
              <ExportSettings FileName="Profesionales" IgnorePaging="True" OpenInNewWindow="True">
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
        SelectCommand="SELECT     Personas.apellido, Personas.nombre, Personas.nroDocumento, Personas.mail, Personas.telefono, Profesionales.nroRegistroProfesional, &#13;&#10;                      CASE WHEN Usuarios.activo = 'True' THEN 'Activo' ELSE 'Inactivo' END AS Estado&#13;&#10;FROM         Personas INNER JOIN&#13;&#10;                      Profesionales ON Personas.nroDocumento = Profesionales.nroDocumento INNER JOIN&#13;&#10;                      Usuarios ON Profesionales.nroDocumento = Usuarios.nrodocumento">
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
