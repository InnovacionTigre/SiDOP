<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AsociarExpedienteGeneral.aspx.vb" Inherits="AsociarExpedienteGeneral" MasterPageFile="~/design/MasterPage.master"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenu" Src="DefaultMenu.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
    

<script runat="server">

    'protected void Page_Load(object sender, EventArgs e)
    '{

    '    cargar();
    '}
</script>

<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenu ID="DefaultMenuContent" runat="server" Visible="false" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >ASOCIAR EXPEDIENTES.<br />
    </span></strong>
 <span style="font-family: Helvetica; font-size: 19px">
 Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br /></span> 
<div style="padding-left:225Px; text-align:center;">
    <asp:Panel ID="Panel1" runat="server" Height="350px" Width="864px">
        &nbsp;&nbsp;
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1" HorizontalAlign="NotSet">
            &nbsp;
             <div style="text-align: center;">
            <table style="border-left-color: #000000; border-bottom-color: #000000; border-top-style: groove;
            border-top-color: #000000; border-right-style: groove; border-left-style: groove;
            border-right-color: #000000; border-bottom-style: groove; font-family: Helvetica;">
            <tr>
                <td colspan="3">
                    Asociar Expediente</td>
            </tr>
            <tr>
                <td style="height: 21px; width: 115px;">
                    Cuenta Municipal</td>
                <td style="height: 21px; width: 587px;">
                    &nbsp;
                    <asp:TextBox ID="lblNroCuenta" runat="server"></asp:TextBox></td>
                <td style="height: 21px; width: 143px;">
                    </td>
            </tr>
            <tr>
                <td style="width: 115px; height: 24px">
                    Nro Expediente</td>
                <td style="width: 587px; height: 24px">
                    <asp:TextBox ID="txtMatricula" runat="server" Width="48px">4112</asp:TextBox>
                    <asp:TextBox ID="txtEjercicio" runat="server" Width="48px"></asp:TextBox>
                    <asp:TextBox ID="txtNro" runat="server" Width="48px"></asp:TextBox>
                    <asp:TextBox ID="txtLetra" runat="server" Width="56px" ForeColor="Silver"></asp:TextBox>
                    <asp:DropDownList ID="ddlProvincia" runat="server">
                        <asp:ListItem Value="0">Buenos Aires</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddpTipo" runat="server">
                        <asp:ListItem Value="0">Expediente</asp:ListItem>
                        <asp:ListItem Value="2">Anexo</asp:ListItem>
                    </asp:DropDownList>&nbsp;
                    <asp:TextBox ID="txtSubNro" runat="server" Width="72px"></asp:TextBox></td>
                <td style="width: 143px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 115px; height: 26px">
                </td>
                <td style="width: 587px; height: 26px">
                    &nbsp;<asp:Label ID="Label1" runat="server" Text="MATR." Width="48px"></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label2" runat="server" Text="EJER." Width="40px"></asp:Label>
                    &nbsp; &nbsp;
                    <asp:Label ID="Label3" runat="server" Text="NRO" Width="40px"></asp:Label>
                    &nbsp; &nbsp;
                    <asp:Label ID="Label4" runat="server" Text="LETRA" Width="48px"></asp:Label>
                    &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label5" runat="server" Text="PROV." Width="64px"></asp:Label>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="TIPO" Width="48px"></asp:Label>
                    &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label7" runat="server" Text="SUB.NRO" Width="72px"></asp:Label></td>
                <td style="width: 143px; height: 26px">
                </td>
            </tr>
            <tr>
                <td style="height: 26px; width: 115px;">
                </td>
                <td style="height: 26px; vertical-align: middle; width: 587px; text-align: center;">
                    <asp:Button ID="btnEnviar" runat="server" Text="Relacionar Expediente" Width="200px" Font-Names="Helvetica" /></td>
                <td style="height: 26px; width: 143px;">
                </td>
            </tr>
                <tr>
                    <td colspan="3" style="height: 26px">
                        <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#C00000"
                            Visible="False" Font-Names="Helvetica"></asp:Label></td>
                </tr>
        </table>
        </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateDeleteColumn="True" AllowFilteringByColumn="True" AllowSorting="True"
            DataSourceID="SqlDataSourceExpedientes" GridLines="None" AllowAutomaticDeletes="True" Width="784px" Skin="Sunset" Font-Names="Helvetica">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="nroCuenta,matricula,ejecicio,numero,provincia,tipo,subNumero"
                DataSourceID="SqlDataSourceExpedientes" >
           
                <Columns>
                    <telerik:GridBoundColumn DataField="nroCuenta" HeaderText="nroCuenta" ReadOnly="True"
                        SortExpression="nroCuenta" UniqueName="nroCuenta" CurrentFilterFunction="Contains"
                        ShowFilterIcon="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="matricula" DataType="System.Int16" HeaderText="Matricula"
                        ReadOnly="True" SortExpression="matricula" UniqueName="matricula" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                        ShowFilterIcon="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ejecicio" DataType="System.Int16" HeaderText="Ejecicio"
                        ReadOnly="True" SortExpression="ejecicio" UniqueName="ejecicio" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                        ShowFilterIcon="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="numero" DataType="System.Int32" HeaderText="Numero"
                        ReadOnly="True" SortExpression="numero" UniqueName="numero" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                        ShowFilterIcon="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="letra" HeaderText="Letra" SortExpression="letra"
                        UniqueName="letra" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                        ShowFilterIcon="False" FilterControlWidth="25px" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="provincia" DataType="System.Int16" HeaderText="Provincia"
                        ReadOnly="True" SortExpression="provincia" UniqueName="provincia" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                        ShowFilterIcon="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tipo" HeaderText="Tipo" ReadOnly="True" SortExpression="tipo"
                        UniqueName="tipo" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                        ShowFilterIcon="False" FilterControlWidth="25px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="subNumero" DataType="System.Int16" HeaderText="subNumero"
                        ReadOnly="True" SortExpression="subNumero" UniqueName="subNumero" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains"
                        ShowFilterIcon="False"  FilterControlWidth="25px">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <FooterStyle Font-Names="Helvetica" />
            <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
        </telerik:RadGrid></telerik:RadAjaxPanel>
        &nbsp;
        <asp:SqlDataSource ID="SqlDataSourceExpedientes" runat="server"
            ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>" SelectCommand="SELECT * FROM [expedientesxCuenta] WHERE ([nroCuenta] = @nroCuenta)" DeleteCommand="DELETE FROM [expedientesxCuenta] WHERE [nroCuenta] = @nroCuenta AND [matricula] = @matricula AND [ejecicio] = @ejecicio AND [numero] = @numero AND [provincia] = @provincia AND [tipo] = @tipo AND [subNumero] = @subNumero" InsertCommand="INSERT INTO [expedientesxCuenta] ([nroCuenta], [matricula], [ejecicio], [numero], [letra], [provincia], [tipo], [subNumero]) VALUES (@nroCuenta, @matricula, @ejecicio, @numero, @letra, @provincia, @tipo, @subNumero)" UpdateCommand="UPDATE [expedientesxCuenta] SET [letra] = @letra WHERE [nroCuenta] = @nroCuenta AND [matricula] = @matricula AND [ejecicio] = @ejecicio AND [numero] = @numero AND [provincia] = @provincia AND [tipo] = @tipo AND [subNumero] = @subNumero">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblNroCuenta" Name="nroCuenta" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="nroCuenta" Type="String" />
                <asp:Parameter Name="matricula" Type="Int16" />
                <asp:Parameter Name="ejecicio" Type="Int16" />
                <asp:Parameter Name="numero" Type="Int32" />
                <asp:Parameter Name="provincia" Type="Int16" />
                <asp:Parameter Name="tipo" Type="String" />
                <asp:Parameter Name="subNumero" Type="Int16" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="letra" Type="String" />
                <asp:Parameter Name="nroCuenta" Type="String" />
                <asp:Parameter Name="matricula" Type="Int16" />
                <asp:Parameter Name="ejecicio" Type="Int16" />
                <asp:Parameter Name="numero" Type="Int32" />
                <asp:Parameter Name="provincia" Type="Int16" />
                <asp:Parameter Name="tipo" Type="String" />
                <asp:Parameter Name="subNumero" Type="Int16" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="nroCuenta" Type="String" />
                <asp:Parameter Name="matricula" Type="Int16" />
                <asp:Parameter Name="ejecicio" Type="Int16" />
                <asp:Parameter Name="numero" Type="Int32" />
                <asp:Parameter Name="letra" Type="String" />
                <asp:Parameter Name="provincia" Type="Int16" />
                <asp:Parameter Name="tipo" Type="String" />
                <asp:Parameter Name="subNumero" Type="Int16" />
            </InsertParameters>
        </asp:SqlDataSource>
    </asp:Panel>
     <br />
     </div>
    <asp:ImageButton id="imbVolver" onclick="imbVolver_Click" runat="server" ImageUrl="~/images/volver.png"></asp:ImageButton><br />

</asp:Content>

