<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ReportePeriodico.aspx.cs" Inherits="ReportePeriodico" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
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
    <strong><span style="font-size: 20pt; color: #7d0506; font-family: Helvetica">REPORTE
        PERIODICO</span></strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" ><strong><br />
        </strong>
    </span>
    <br />
    <span style="font-family: Helvetica; font-size: 19px">
         útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br />
        </span>
    <br />
        <div style="text-align: center; padding-left:200px;">
            FECHA DESDE: &nbsp;<asp:TextBox ID="txtDesde" runat="server">2016-01-01</asp:TextBox>
            FECHA HASTA:&nbsp;
            <asp:TextBox ID="txtHasta" runat="server">2016-05-31</asp:TextBox>
            (aaaa-mm-dd)&nbsp;
            <asp:Button ID="btnAplicar" runat="server" OnClick="btnAplicar_Click" Text="Aplicar" /><br />
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/export_excel.png"
            OnClick="ImageButton2_Click" ToolTip="Exportar a Excel" /><br />
          <div>
          <telerik:RadGrid ID="rGProfesionales" runat="server" AllowSorting="True"  DataSourceID="SqlDataSourcePlanoDigital"
        GridLines="None"  AllowFilteringByColumn="True"  OnItemCommand="rGProfesionales_RowCommand"  OnNeedDataSource="rGProfesionales_NeedDataSource" Width="883px" PageSize="20" Skin="Sunset" AllowPaging="True" Font-Names="Helvetica"  >
        <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourcePlanoDigital" PageSize="10" DataKeyNames="Estado">
            <Columns>
                <telerik:GridBoundColumn DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado"
                    UniqueName="Estado">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sidop" HeaderText="sidop" SortExpression="sidop"
                    UniqueName="sidop">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Cuantos" DataType="System.Int32" HeaderText="Cuantos"
                    ReadOnly="True" SortExpression="Cuantos" UniqueName="Cuantos">
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
              <ExportSettings ExportOnlyData="True" FileName="Variacion de Tiempo"
                  HideStructureColumns="True" OpenInNewWindow="True" IgnorePaging="True">
              </ExportSettings>
    </telerik:RadGrid>
    </div>
             <br />
            <br />
            &nbsp;<br />
            <asp:SqlDataSource ID="SqlDataSourceDemoraVerificado" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
                SelectCommand="SELECT [Cantidad de verificados en menos de 15 dias] AS Cantidad_de_verificados_en_menos_de_15_dias, [Cantidad de verificados con demora entre 15 y 30 dias] AS Cantidad_de_verificados_con_demora_entre_15_y_30_dias, [Cantidad de verificados con demora entre 30 y 45 dias] AS Cantidad_de_verificados_con_demora_entre_30_y_45_dias, [Cantidad de verificados fuera de parametros] AS Cantidad_de_verificados_fuera_de_parametros, [Cantidad de registrados en menos de 15 dias] AS Cantidad_de_registrados_en_menos_de_15_dias, [Cantidad de registrados con demora entre 15 y 30 dias] AS Cantidad_de_registrados_con_demora_entre_15_y_30_dias, [Cantidad de registrado con demora entre 30 y 45 dias] AS Cantidad_de_registrado_con_demora_entre_30_y_45_dias, [Cantidad de registrados fuera de parametros] AS Cantidad_de_registrados_fuera_de_parametros FROM [ViewDemoraEstadistica]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceExpedientesIngresadosVSregistrados" runat="server"
                ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>" SelectCommand="SELECT * FROM [ViewTotalExpedientesXRegistrosUnpivot]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1DemoraUNPIVOT" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
                SelectCommand="SELECT * FROM [ViewDemoraEstadisticaConUNPivot]"></asp:SqlDataSource>
            <br />
    <asp:Label ID="lblMensaje" runat="server" Font-Size="Large" ForeColor="DarkRed" Text="Label"
        Visible="False"></asp:Label><br />
    </div>
    
    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/images/boton-verificar.png" Visible="False" />&nbsp;
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click" />
    
    <asp:SqlDataSource ID="SqlDataSourcePlanoDigital" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT     Carpetas.Estado, estadosMajor.sidop, COUNT(*) AS Cuantos&#13;&#10;FROM            Carpetas INNER JOIN&#13;&#10;                         estadosMajor ON Carpetas.Estado = estadosMajor.codigo&#13;&#10;WHERE        (Carpetas.fecha BETWEEN '2016-05-01 00:00' AND '2016-05-31 23:59') AND (Carpetas.idCarpeta <> '88888888')&#13;&#10;GROUP BY Carpetas.Estado, estadosMajor.sidop&#13;&#10;ORDER BY estadosMajor.sidop">
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
