<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="HistorialArchivosCuenta.aspx.cs" Inherits="HistorialArchivosCuenta" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
             DE ARCHIVOS DEL EXPEDIENTE DE LA CUENTA
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
                <telerik:GridBoundColumn DataField="Generador de archivo" HeaderText="Generador de archivo"
                    ReadOnly="True" SortExpression="Generador de archivo" UniqueName="Generador de archivo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha de subida" DataType="System.DateTime" HeaderText="Fecha de subida"
                    SortExpression="Fecha de subida" UniqueName="Fecha de subida" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Oficina de Destino" HeaderText="Oficina de Destino"
                    SortExpression="Oficina de Destino" UniqueName="Oficina de Destino" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Sub Carpeta" HeaderText="Sub Carpeta" SortExpression="Sub Carpeta"
                    UniqueName="Sub Carpeta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nombre del Archivo" HeaderText="Nombre del Archivo"
                    SortExpression="Nombre del Archivo" UniqueName="Nombre del Archivo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nro de Archivo" DataType="System.Int32" HeaderText="Nro de Archivo"
                    SortExpression="Nro de Archivo" UniqueName="Nro de Archivo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="IP subida" HeaderText="IP subida" SortExpression="IP subida"
                    UniqueName="IP subida" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid><br /></div>
    <asp:ImageButton ID="imgVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imgVolver_Click" /><br />
    <asp:SqlDataSource ID="SqlDataSourceCorreos" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta, CAST(eCuenta.numero AS NVARCHAR(8)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(8)) AS Expediente, Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Nomenclatura_Completa AS [Nomenclatura Completa], Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Inmueble_Contribuyente AS Contribuyente, Personas.apellido + ' ' + Personas.nombre AS [Generador de archivo], registroArchivos.fecha AS [Fecha de subida], registroArchivos.oficinaDestino AS [Oficina de Destino], registroArchivos.subCarpeta AS [Sub Carpeta], registroArchivos.nombreArchivo AS [Nombre del Archivo], registroArchivos.nro_archivo AS [Nro de Archivo], registroArchivos.ip AS [IP subida] FROM Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles INNER JOIN registroArchivos ON Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = registroArchivos.nrocuenta INNER JOIN Personas ON registroArchivos.nroDocumentoProfesional = Personas.nroDocumento left JOIN expedientesxCuenta AS eCuenta ON Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = eCuenta.nroCuenta WHERE (Bd_Munic1.dbo.WEBOP_V_AUT_Inmuebles.Cuenta = @cuenta) ORDER BY [Fecha de subida]">
        <SelectParameters>
            <asp:SessionParameter Name="cuenta" SessionField="cuenta" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    

</asp:Content>
