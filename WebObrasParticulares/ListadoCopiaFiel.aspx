<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ListadoCopiaFiel.aspx.cs" Inherits="ListadoCopiaFiel" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
          <telerik:RadGrid ID="rGProfesionales" runat="server" AllowSorting="True"  DataSourceID="SqlDataSourcePlanoDigital"
        GridLines="None"  AllowFilteringByColumn="True"  OnItemCommand="rGProfesionales_RowCommand" Height="500px" OnNeedDataSource="rGProfesionales_NeedDataSource" Width="883px" PageSize="15" Skin="Sunset" AllowPaging="True" Font-Names="Helvetica"  >
        <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourcePlanoDigital" PageSize="10" DataKeyNames="fechaPedido">
            <Columns>
                <telerik:GridBoundColumn DataField="Cuenta" HeaderText="Cuenta" ReadOnly="True" SortExpression="Cuenta"
                    UniqueName="Cuenta">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nomenclatura_Completa" HeaderText="Nomenclatura_Completa"
                    ReadOnly="True" SortExpression="Nomenclatura_Completa" UniqueName="Nomenclatura_Completa">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Inmueble_Contribuyente" HeaderText="Inmueble_Contribuyente"
                    ReadOnly="True" SortExpression="Inmueble_Contribuyente" UniqueName="Inmueble_Contribuyente">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fechaPedido" DataType="System.DateTime" HeaderText="fechaPedido"
                    ReadOnly="True" SortExpression="fechaPedido" UniqueName="fechaPedido">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Deuda_Importe" DataType="System.Decimal" HeaderText="Deuda_Importe"
                    ReadOnly="True" SortExpression="Deuda_Importe" UniqueName="Deuda_Importe">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="estado" HeaderText="estado" SortExpression="estado"
                    UniqueName="estado">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="cambiar" HeaderText="Cambiar Estado" SortExpression="Cambiar"
                    UniqueName="column">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnablePostBackOnRowClick="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
              <FilterMenu Width="30px">
              </FilterMenu>
              <FooterStyle Font-Names="Helvetica" />
              <HeaderStyle Font-Names="Helvetica" />
    </telerik:RadGrid>
    </div>
    <br />
    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/images/boton-verificar.png" Visible="False" />&nbsp;
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click" />
    
    <asp:SqlDataSource ID="SqlDataSourcePlanoDigital" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT distinct tigre.Cuenta, tigre.Nomenclatura_Completa, tigre.Inmueble_Contribuyente,CAST(eCuenta.numero AS NVARCHAR(5)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(5)) &#13;&#10; AS Expediente, pCopia.fechaPedido, tigre.Deuda_Importe, pCopia.estado&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles AS tigre INNER JOIN&#13;&#10;                         PedidoCopiaFiel AS pCopia ON tigre.Cuenta = pCopia.nroCuenta LEFT OUTER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON pCopia.nroCuenta = eCuenta.nroCuenta">
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
