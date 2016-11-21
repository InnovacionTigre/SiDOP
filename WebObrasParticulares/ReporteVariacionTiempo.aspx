<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ReporteVariacionTiempo.aspx.cs" Inherits="ReporteVariacionTiempo" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

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
    <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >PROFESIONALES.<br />
    </span></strong>
    <br />
    <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br />
        </span>
    <br />
        <div style="text-align: center; padding-left:200px;">
        <span style="float:right;margin-right:250px;margin-top:-20px;"><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/export_excel.png"
            OnClick="ImageButton2_Click" ToolTip="Exportar a Excel" /></span><br />
          <div>
          <telerik:RadGrid ID="rGProfesionales" runat="server" AllowSorting="True"  DataSourceID="SqlDataSourcePlanoDigital"
        GridLines="None"  AllowFilteringByColumn="True"  OnItemCommand="rGProfesionales_RowCommand"  OnNeedDataSource="rGProfesionales_NeedDataSource" Width="883px" PageSize="20" Skin="Sunset" AllowPaging="True" Font-Names="Helvetica"  >
        <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourcePlanoDigital" PageSize="10" DataKeyNames="C">
            <Columns>
                <telerik:GridBoundColumn DataField="C" HeaderText="Cuenta Municipal" ReadOnly="True"
                    SortExpression="C" UniqueName="C" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha de alta en SiDOP" DataType="System.DateTime"
                    HeaderText="Fecha de alta en SiDOP" ReadOnly="True" SortExpression="Fecha de alta en SiDOP"
                    UniqueName="Fecha de alta en SiDOP" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha de Verificacion en SiDOP" DataType="System.DateTime"
                    HeaderText="Fecha de Verificacion en SiDOP" ReadOnly="True" SortExpression="Fecha de Verificacion en SiDOP"
                    UniqueName="Fecha de Verificacion en SiDOP" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Diferencia en dias a verificado" DataType="System.Int32"
                    HeaderText="Diferencia en dias a verificado" ReadOnly="True" SortExpression="Diferencia en dias a verificado"
                    UniqueName="Diferencia en dias a verificado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha de registro" DataType="System.DateTime"
                    HeaderText="Fecha de registro" ReadOnly="True" SortExpression="Fecha de registro"
                    UniqueName="Fecha de registro" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Diferencia en dias a Registrado" DataType="System.Int32"
                    HeaderText="Diferencia en dias a Registrado" ReadOnly="True" SortExpression="Diferencia en dias a Registrado"
                    UniqueName="Diferencia en dias a Registrado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Ultimo estado" HeaderText="Ultimo estado" SortExpression="Ultimo estado"
                    UniqueName="Ultimo estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fecha del ultimo estado" DataType="System.DateTime"
                    HeaderText="Fecha del ultimo estado" SortExpression="Fecha del ultimo estado"
                    UniqueName="Fecha del ultimo estado" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Diferencia en dias desde el inicio" DataType="System.Int32"
                    HeaderText="Diferencia en dias desde el inicio" ReadOnly="True" SortExpression="Diferencia en dias desde el inicio"
                    UniqueName="Diferencia en dias desde el inicio" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
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
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True"  DataSourceID="SqlDataSourceDemoraVerificado"
        GridLines="None"  OnItemCommand="rGProfesionales_RowCommand" Height="100px" OnNeedDataSource="rGProfesionales_NeedDataSource" Width="883px" PageSize="20" Skin="Sunset" Font-Names="Helvetica"  >
                <ExportSettings ExportOnlyData="True" FileName="Listado de Archivos por Visador"
                  HideStructureColumns="True" OpenInNewWindow="True">
                </ExportSettings>
                <FooterStyle Font-Names="Helvetica" />
                <MasterTableView AutoGenerateColumns="False"
            DataSourceID="SqlDataSourceDemoraVerificado" PageSize="1">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Cantidad_de_verificados_en_menos_de_15_dias"
                            DataType="System.Int32" HeaderText="Cantidad de verificados en menos de 15 dias"
                            SortExpression="Cantidad_de_verificados_en_menos_de_15_dias" UniqueName="Cantidad_de_verificados_en_menos_de_15_dias">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Cantidad_de_verificados_con_demora_entre_15_y_30_dias"
                            DataType="System.Int32" HeaderText="Cantidad de verificados con demora entre 15 y 30 dias"
                            SortExpression="Cantidad_de_verificados_con_demora_entre_15_y_30_dias" UniqueName="Cantidad_de_verificados_con_demora_entre_15_y_30_dias">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Cantidad_de_verificados_con_demora_entre_30_y_45_dias"
                            DataType="System.Int32" HeaderText="Cantidad de verificados con demora entre 30 y 45 dias"
                            SortExpression="Cantidad_de_verificados_con_demora_entre_30_y_45_dias" UniqueName="Cantidad_de_verificados_con_demora_entre_30_y_45_dias">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Cantidad_de_verificados_fuera_de_parametros"
                            DataType="System.Int32" HeaderText="Cantidad de verificados fuera de parametros"
                            SortExpression="Cantidad_de_verificados_fuera_de_parametros" UniqueName="Cantidad_de_verificados_fuera_de_parametros">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Cantidad_de_registrados_en_menos_de_15_dias"
                            DataType="System.Int32" HeaderText="Cantidad de registrados en menos de 15 dias"
                            SortExpression="Cantidad_de_registrados_en_menos_de_15_dias" UniqueName="Cantidad_de_registrados_en_menos_de_15_dias">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Cantidad_de_registrados_con_demora_entre_15_y_30_dias"
                            DataType="System.Int32" HeaderText="Cantidad de registrados con demora entre 15 y 30 dias"
                            SortExpression="Cantidad_de_registrados_con_demora_entre_15_y_30_dias" UniqueName="Cantidad_de_registrados_con_demora_entre_15_y_30_dias">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Cantidad_de_registrado_con_demora_entre_30_y_45_dias"
                            DataType="System.Int32" HeaderText="Cantidad de registrado con demora entre 30 y 45 dias"
                            SortExpression="Cantidad_de_registrado_con_demora_entre_30_y_45_dias" UniqueName="Cantidad_de_registrado_con_demora_entre_30_y_45_dias">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Cantidad_de_registrados_fuera_de_parametros"
                            DataType="System.Int32" HeaderText="Cantidad de registrados fuera de parametros"
                            SortExpression="Cantidad_de_registrados_fuera_de_parametros" UniqueName="Cantidad_de_registrados_fuera_de_parametros">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                <HeaderStyle Font-Names="Helvetica" />
                <ClientSettings EnablePostBackOnRowClick="True">
                </ClientSettings>
                <FilterMenu Width="30px">
                </FilterMenu>
            </telerik:RadGrid><br />
            <telerik:RadChart ID="graficoRegistrados" runat="server" DataSourceID="SqlDataSource1DemoraUNPIVOT"
                DefaultType="Gantt" SeriesOrientation="Horizontal" Skin="DeepRed" Width="900px" Height="500px">
                <Series>
                    <telerik:ChartSeries DataLabelsColumn="Tipo" DataYColumn="cantidad" Name="cantidad"
                        Type="Pie">
                        <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="True">
                            <FillStyle FillType="ComplexGradient" MainColor="Silver">
                                <FillSettings>
                                    <ComplexGradient>
                                        <telerik:GradientElement Color="213, 247, 255" />
                                        <telerik:GradientElement Color="193, 239, 252" Position="0.5" />
                                        <telerik:GradientElement Color="157, 217, 238" Position="1" />
                                    </ComplexGradient>
                                </FillSettings>
                            </FillStyle>
                            <LabelAppearance LabelConnectorStyle-Color="LightGray" Position-AlignedPosition="Left">
                            </LabelAppearance>
                            <PointMark Visible="True">
                            </PointMark>
                            <TextAppearance AutoTextWrap="True" TextProperties-Color="White">
                            </TextAppearance>
                        </Appearance>
                    </telerik:ChartSeries>
                </Series>
                <PlotArea>
                    <XAxis AutoScale="False" DataLabelsColumn="Tipo" MaxValue="7" MinValue="1" Step="1">
                        <Appearance Color="76, 255, 255, 255" MajorTick-Color="179, 255, 255, 255">
                            <MajorGridLines Color="179, 255, 255, 255" Width="0" />
                            <TextAppearance TextProperties-Color="White">
                            </TextAppearance>
                        </Appearance>
                        <AxisLabel>
                            <Appearance RotationAngle="270" Dimensions-Paddings="1px, 1px, 10%, 1px">
                            </Appearance>
                            <TextBlock>
                                <Appearance TextProperties-Color="254, 178, 112">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                        <Items>
                            <telerik:ChartAxisItem Value="1">
                                <TextBlock Text="Cantidad de verificados en menos de 15 dias">
                                </TextBlock>
                                <ActiveRegion Tooltip="Cantidad de verificados en menos de 15 dias" />
                            </telerik:ChartAxisItem>
                            <telerik:ChartAxisItem Value="2">
                                <TextBlock Text="Cantidad de verificados con demora entre 15 y 30 dias">
                                </TextBlock>
                                <ActiveRegion Tooltip="Cantidad de verificados con demora entre 15 y 30 dias" />
                            </telerik:ChartAxisItem>
                            <telerik:ChartAxisItem Value="3">
                                <TextBlock Text="Cantidad de verificados con demora entre 30 y 45 dias">
                                </TextBlock>
                                <ActiveRegion Tooltip="Cantidad de verificados con demora entre 30 y 45 dias" />
                            </telerik:ChartAxisItem>
                            <telerik:ChartAxisItem Value="4">
                                <TextBlock Text="Cantidad de verificados fuera de parametros">
                                </TextBlock>
                                <ActiveRegion Tooltip="Cantidad de verificados fuera de parametros" />
                            </telerik:ChartAxisItem>
                            <telerik:ChartAxisItem Value="5">
                                <TextBlock Text="Cantidad de registrados en menos de 15 dias">
                                </TextBlock>
                                <ActiveRegion Tooltip="Cantidad de registrados en menos de 15 dias" />
                            </telerik:ChartAxisItem>
                            <telerik:ChartAxisItem Value="6">
                                <TextBlock Text="Cantidad de registrados con demora entre 15 y 30 dias">
                                </TextBlock>
                                <ActiveRegion Tooltip="Cantidad de registrados con demora entre 15 y 30 dias" />
                            </telerik:ChartAxisItem>
                            <telerik:ChartAxisItem Value="7">
                                <TextBlock Text="Cantidad de registrado con demora entre 30 y 45 dias">
                                </TextBlock>
                                <ActiveRegion Tooltip="Cantidad de registrado con demora entre 30 y 45 dias" />
                            </telerik:ChartAxisItem>
                        </Items>
                    </XAxis>
                    <YAxis>
                        <Appearance Color="76, 255, 255, 255" MajorTick-Color="179, 255, 255, 255" MinorTick-Color="179, 255, 255, 255">
                            <MajorGridLines Color="179, 255, 255, 255" />
                            <MinorGridLines Color="179, 255, 255, 255" Width="0" />
                            <TextAppearance TextProperties-Color="White">
                            </TextAppearance>
                        </Appearance>
                        <AxisLabel>
                            <Appearance RotationAngle="0">
                            </Appearance>
                            <TextBlock>
                                <Appearance TextProperties-Color="220, 158, 119">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                    </YAxis>
                    <YAxis2>
                        <AxisLabel>
                            <Appearance RotationAngle="0">
                            </Appearance>
                        </AxisLabel>
                    </YAxis2>
                    <Appearance Dimensions-Margins="19%, 90px, 12%, 9%">
                        <FillStyle MainColor="50, 255, 255, 255" SecondColor="Transparent">
                        </FillStyle>
                        <Border Color="76, 255, 255, 255" />
                    </Appearance>
                </PlotArea>
                <Appearance>
                    <FillStyle FillType="ComplexGradient">
                        <FillSettings>
                            <ComplexGradient>
                                <telerik:GradientElement Color="179, 37, 26" />
                                <telerik:GradientElement Color="253, 153, 66" Position="0.5" />
                                <telerik:GradientElement Color="179, 37, 26" Position="1" />
                            </ComplexGradient>
                        </FillSettings>
                    </FillStyle>
                    <Border Color="141, 50, 0" Width="5" />
                </Appearance>
                <ChartTitle>
                    <Appearance Dimensions-Margins="4%, 10px, 14px, 6%">
                        <FillStyle MainColor="">
                        </FillStyle>
                    </Appearance>
                    <TextBlock Text="Gr&#225;fico de dispersi&#243;n de demora">
                        <Appearance TextProperties-Color="White" TextProperties-Font="Verdana, 14pt">
                        </Appearance>
                    </TextBlock>
                </ChartTitle>
                <Legend Visible="False">
                    <Appearance Dimensions-Margins="1px, 2%, 12%, 1px" Visible="False">
                        <ItemTextAppearance TextProperties-Color="White">
                        </ItemTextAppearance>
                        <FillStyle MainColor="37, 255, 255, 255">
                        </FillStyle>
                        <Border Color="76, 255, 255, 255" />
                    </Appearance>
                    <TextBlock>
                        <Appearance Position-AlignedPosition="Top" TextProperties-Color="220, 158, 119">
                        </Appearance>
                    </TextBlock>
                </Legend>
            </telerik:RadChart>
             <br />
            <telerik:RadChart ID="RadChart1" runat="server" DataSourceID="SqlDataSourceExpedientesIngresadosVSregistrados"
                DefaultType="Pie" SeriesOrientation="Horizontal" Skin="DeepRed" Width="632px" Height="424px" AutoLayout="True" AutoTextWrap="True" >
                <Series>
                    <telerik:ChartSeries DataYColumn="Cantidad" Name="Cantidad" Type="Pie">
                        <Appearance LegendDisplayMode="ItemLabels">
                            <FillStyle FillType="ComplexGradient" MainColor="213, 247, 255">
                                <FillSettings>
                                    <ComplexGradient>
                                        <telerik:GradientElement Color="213, 247, 255" />
                                        <telerik:GradientElement Color="193, 239, 252" Position="0.5" />
                                        <telerik:GradientElement Color="157, 217, 238" Position="1" />
                                    </ComplexGradient>
                                </FillSettings>
                            </FillStyle>
                            <TextAppearance TextProperties-Color="White">
                            </TextAppearance>
                        </Appearance>
                    </telerik:ChartSeries>
                </Series>
                <PlotArea>
                    <XAxis>
                        <Appearance Color="76, 255, 255, 255" MajorTick-Color="179, 255, 255, 255">
                            <MajorGridLines Color="179, 255, 255, 255" Width="0" />
                            <TextAppearance TextProperties-Color="White">
                            </TextAppearance>
                        </Appearance>
                        <AxisLabel>
                            <Appearance RotationAngle="270" Dimensions-Paddings="1px, 1px, 10%, 1px">
                            </Appearance>
                            <TextBlock>
                                <Appearance TextProperties-Color="254, 178, 112">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                    </XAxis>
                    <YAxis>
                        <Appearance Color="76, 255, 255, 255" MajorTick-Color="179, 255, 255, 255" MinorTick-Color="179, 255, 255, 255">
                            <MajorGridLines Color="179, 255, 255, 255" />
                            <MinorGridLines Color="179, 255, 255, 255" Width="0" />
                            <TextAppearance TextProperties-Color="White">
                            </TextAppearance>
                        </Appearance>
                        <AxisLabel>
                            <Appearance RotationAngle="0">
                            </Appearance>
                            <TextBlock>
                                <Appearance TextProperties-Color="220, 158, 119">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                    </YAxis>
                    <YAxis2>
                        <AxisLabel>
                            <Appearance RotationAngle="0">
                            </Appearance>
                        </AxisLabel>
                    </YAxis2>
                    <Appearance Dimensions-Margins="19%, 90px, 12%, 9%">
                        <FillStyle MainColor="50, 255, 255, 255" SecondColor="Transparent">
                        </FillStyle>
                        <Border Color="76, 255, 255, 255" />
                    </Appearance>
                    <DataTable>
                        <Appearance Dimensions-AutoSize="False" Dimensions-Height="32px" Dimensions-Width="111px"
                            RenderType="TableFixedSize">
                        </Appearance>
                    </DataTable>
                </PlotArea>
                <Appearance>
                    <FillStyle FillType="ComplexGradient">
                        <FillSettings>
                            <ComplexGradient>
                                <telerik:GradientElement Color="179, 37, 26" />
                                <telerik:GradientElement Color="253, 153, 66" Position="0.5" />
                                <telerik:GradientElement Color="179, 37, 26" Position="1" />
                            </ComplexGradient>
                        </FillSettings>
                    </FillStyle>
                    <Border Color="141, 50, 0" Width="5" />
                </Appearance>
                <ChartTitle>
                    <Appearance Dimensions-Margins="4%, 10px, 14px, 6%">
                        <FillStyle MainColor="">
                        </FillStyle>
                    </Appearance>
                    <TextBlock Text="Gr&#225;fico de totales de expedientes">
                        <Appearance TextProperties-Color="White" TextProperties-Font="Verdana, 14pt">
                        </Appearance>
                    </TextBlock>
                </ChartTitle>
                <Legend>
                    <Appearance Dimensions-Margins="1px, 2%, 12%, 1px">
                        <ItemTextAppearance TextProperties-Color="White">
                        </ItemTextAppearance>
                        <FillStyle MainColor="37, 255, 255, 255">
                        </FillStyle>
                        <Border Color="76, 255, 255, 255" />
                        <ItemMarkerAppearance Figure="Rectangle">
                        </ItemMarkerAppearance>
                    </Appearance>
                    <TextBlock>
                        <Appearance Position-AlignedPosition="Top" TextProperties-Color="220, 158, 119">
                        </Appearance>
                    </TextBlock>
                </Legend>
            </telerik:RadChart>
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
        SelectCommand="SELECT * FROM [Estadistica1]">
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
