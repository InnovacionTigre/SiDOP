<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="CorreoProfesional.aspx.cs" Inherits="CorreoProfesional" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
         <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >CORRESPONDENCIA.<br />
    </span></strong>
          <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br /></span>
    &nbsp; &nbsp;&nbsp;&nbsp;<br />
    <script type="text/javascript">

   
function otroTag(url){
    window.open(url,'');
   // window.open(url);
    return false;
}


</script>

    &nbsp;<br />
    &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton
        ID="imbRecibidos" runat="server" ImageUrl="~/images/recibidos.png" OnClick="imbRecibidos_Click" />
    <asp:ImageButton ID="imbEnviados" runat="server" ImageUrl="~/images/enviados.png" OnClick="imbEnviados_Click" /><br />
    &nbsp;
     <div style="text-align: center;">
    <telerik:RadGrid ID="rGCorreos" runat="server" DataSourceID="SqlDataSourceCorreos"
        GridLines="None" AllowFilteringByColumn="True" AllowPaging="True" Skin="Sunset" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="Nro de Cuenta,Fecha del Mensaje" DataSourceID="SqlDataSourceCorreos">
            <Columns>
                <telerik:GridBoundColumn DataField="Nro de Cuenta" HeaderText="Nro de Cuenta" ReadOnly="True"
                    SortExpression="Nro de Cuenta" UniqueName="Nro de Cuenta" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Expediente" HeaderText="Expediente" ReadOnly="True"
                    SortExpression="Expediente" UniqueName="Expediente" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Origen" HeaderText="Origen" SortExpression="Origen"
                    UniqueName="Origen" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Destino" HeaderText="Destino" SortExpression="Destino"
                    UniqueName="Destino" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Asunto" HeaderText="Asunto" SortExpression="Asunto"
                    UniqueName="Asunto" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Mensaje" HeaderText="Mensaje" SortExpression="Mensaje"
                    UniqueName="Mensaje" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha del Mensaje" DataType="System.DateTime"
                    HeaderText="Fecha del Mensaje" ReadOnly="True" SortExpression="Fecha del Mensaje"
                    UniqueName="Fecha del Mensaje" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <FooterStyle Font-Names="Helvetica" />
        <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid><br /></div>
    <asp:ImageButton ID="imgVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imgVolver_Click" /><br />
    <asp:SqlDataSource ID="SqlDataSourceCorreos" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT HistorialCorreo.nrocuenta AS [Nro de Cuenta], CAST(eCuenta.numero AS NVARCHAR(7)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(7)) AS Expediente, HistorialCorreo.origen AS Origen, HistorialCorreo.destino AS Destino, HistorialCorreo.asunto AS Asunto, HistorialCorreo.mensaje AS Mensaje, HistorialCorreo.fecha AS [Fecha del Mensaje] FROM HistorialCorreo left JOIN expedientesxCuenta AS eCuenta ON HistorialCorreo.nrocuenta = eCuenta.nroCuenta WHERE (HistorialCorreo.destino = @destino)">
        <SelectParameters>
            <asp:SessionParameter Name="destino" SessionField="correo" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceCorreoSaliente" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT HistorialCorreo.nrocuenta AS [Nro de Cuenta], CAST(eCuenta.numero AS NVARCHAR(7)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(7)) AS Expediente, HistorialCorreo.origen AS Origen, HistorialCorreo.destino AS Destino, HistorialCorreo.asunto AS Asunto, HistorialCorreo.mensaje AS Mensaje, HistorialCorreo.fecha AS [Fecha del Mensaje] FROM HistorialCorreo LEFT OUTER JOIN expedientesxCuenta AS eCuenta ON HistorialCorreo.nrocuenta = eCuenta.nroCuenta WHERE (HistorialCorreo.origen = @origen)">
        <SelectParameters>
            <asp:SessionParameter Name="origen" SessionField="correo" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceCorreoCompleto" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT        HistorialCorreo.nrocuenta AS [Nro de Cuenta], CAST(eCuenta.numero AS NVARCHAR(7)) + '-' + CAST(eCuenta.ejecicio AS NVARCHAR(7)) AS Expediente, &#13;&#10;                         HistorialCorreo.origen AS Origen, HistorialCorreo.destino AS Destino, HistorialCorreo.asunto AS Asunto, HistorialCorreo.mensaje AS Mensaje, &#13;&#10;                         HistorialCorreo.fecha AS [Fecha del Mensaje]&#13;&#10;FROM            HistorialCorreo LEFT OUTER JOIN&#13;&#10;                         expedientesxCuenta AS eCuenta ON HistorialCorreo.nrocuenta = eCuenta.nroCuenta&#13;&#10;WHERE        (HistorialCorreo.origen = @origen) OR&#13;&#10;                         (HistorialCorreo.destino = @origen)&#13;&#10;ORDER BY [Fecha del Mensaje] DESC">
        <SelectParameters>
            <asp:SessionParameter Name="origen" SessionField="correo" />
        </SelectParameters>
    </asp:SqlDataSource>
    

</asp:Content>
