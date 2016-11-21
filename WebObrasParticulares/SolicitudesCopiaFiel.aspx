<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="SolicitudesCopiaFiel.aspx.cs" Inherits="SolicitudesCopiaFiel" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
    &nbsp;<strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >SOLICITUDES
             DE LA COPIA FIEL DE PLANO .<br />
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
                <telerik:GridBoundColumn DataField="Nomenclatura_Completa" HeaderText="Nomenclatura Completa"
                    ReadOnly="True" SortExpression="Nomenclatura_Completa" UniqueName="Nomenclatura_Completa" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inmueble_Contribuyente" HeaderText="Contribuyente"
                    ReadOnly="True" SortExpression="Inmueble_Contribuyente" UniqueName="Inmueble_Contribuyente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nroPedido" DataType="System.Int32" HeaderText="Nro de Pedido"
                    SortExpression="nroPedido" UniqueName="nroPedido" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fechaPedido" DataType="System.DateTime" HeaderText="Fecha"
                    SortExpression="fechaPedido" UniqueName="fechaPedido" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False"> 
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="estado" HeaderText="Estado del Pedido" SortExpression="estado"
                    UniqueName="estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tipo" HeaderText="Tipo de Copia" SortExpression="tipo"
                    UniqueName="tipo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
    </telerik:RadGrid><br /></div>
    <strong><span style="font-size: 20pt; color: #7d0506; font-family: Helvetica">Cambiar estado de pedido<br />
    </span></strong><asp:ImageButton ID="imbConfeccionando" runat="server" ImageUrl="~/images/botones/procesando.png" OnClick="imbConfeccionando_Click" />
    <asp:ImageButton ID="imbParaRetirar" runat="server" ImageUrl="~/images/botones/retirar.png" OnClick="imbParaRetirar_Click" />
    <asp:ImageButton ID="imbNoHayPlano" runat="server" ImageUrl="~/images/botones/nohayplano.png" OnClick="imbNoHayPlano_Click" />
    <asp:ImageButton ID="imbFinalizado" runat="server" ImageUrl="~/images/botones/finalizado2.png" OnClick="imbFinalizado_Click" />
    <asp:ImageButton ID="imbEntregado" runat="server" ImageUrl="~/images/botones/entregado2.png" OnClick="imbEntregado_Click" Visible="False" /><br />
    <asp:Label ID="lblcartel" runat="server" Font-Size="Large" ForeColor="#FF8000" Text="-"
        Visible="False"></asp:Label><br />
    <asp:ImageButton ID="imgVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imgVolver_Click" /><br />
    <asp:SqlDataSource ID="SqlDataSourceCorreos" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT        Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta, Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Nomenclatura_Completa, &#13;&#10;                         Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Inmueble_Contribuyente, PedidoCopiaFiel.nroPedido, PedidoCopiaFiel.fechaPedido, PedidoCopiaFiel.tipo, &#13;&#10;                         PedidoCopiaFiel.estado&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles INNER JOIN&#13;&#10;                         PedidoCopiaFiel ON Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = PedidoCopiaFiel.nroCuenta&#13;&#10;order by Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta,PedidoCopiaFiel.nroPedido">
    </asp:SqlDataSource>
    <br />
    

</asp:Content>
