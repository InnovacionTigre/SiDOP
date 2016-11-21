<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="HistorialEstadosCuenta.aspx.cs" Inherits="HistorialEstadosCuenta" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
             DE ESTADOS DEL EXPEDIENTE DE LA CUENTA
             <asp:Label ID="lblCuenta" runat="server" Text="-"></asp:Label>.<br />
    </span></strong>
          <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br /></span>
    &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp;<div style="text-align: center;">
    <telerik:RadGrid ID="rGCorreos" runat="server" DataSourceID="SqlDataSourceEstados"
        GridLines="None" AllowFilteringByColumn="True" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica" AllowSorting="True">
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceEstados">
            <Columns>
                <telerik:GridBoundColumn DataField="Cuenta" HeaderText="Cuenta" SortExpression="Cuenta"
                    UniqueName="Cuenta">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" SortExpression="Estado"
                    UniqueName="Estado">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha" DataType="System.DateTime" HeaderText="Fecha"
                    SortExpression="Fecha" UniqueName="Fecha">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre"
                    UniqueName="Nombre">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido"
                    UniqueName="Apellido">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid><asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <br /></div>
    <asp:ImageButton ID="imgVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imgVolver_Click" /><br />
    <asp:SqlDataSource ID="SqlDataSourceEstados" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT        Carpetas.idCarpeta AS Cuenta, CAST(eCuenta.numero AS NVARCHAR(8)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(8)) AS Expediente, &#13;&#10;                         estadosMajor.sidop AS Estado, Carpetas.fecha AS Fecha, Personas.nombre AS Nombre, Personas.apellido AS Apellido&#13;&#10;FROM            Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles INNER JOIN&#13;&#10;                         Carpetas ON Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = Carpetas.idCarpeta INNER JOIN&#13;&#10;                         estadosMajor ON Carpetas.Estado = estadosMajor.codigo INNER JOIN&#13;&#10;                         Personas ON Carpetas.Observacion = Personas.nroDocumento LEFT OUTER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = eCuenta.nroCuenta&#13;&#10;WHERE        (Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = @cuenta)&#13;&#10;ORDER BY Fecha">
        <SelectParameters>
            <asp:SessionParameter Name="cuenta" SessionField="cuenta" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    

</asp:Content>
