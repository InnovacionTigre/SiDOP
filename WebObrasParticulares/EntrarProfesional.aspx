<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EntrarProfesional.aspx.vb" Inherits="EntrarProfesional" MasterPageFile="~/design/MasterPage.master"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenu" Src="DefaultMenuInicio.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script runat="server">

    'protected void Page_Load(object sender, EventArgs e)
    '{

    '}
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
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>

<div style="text-align:center">
    <asp:Panel ID="Panel1" runat="server" Height="150px">
        <p><span style="color: #7d0506; font-size: 26px;"><b> SR. PROFESIONAL INGRESE AL SISTEMA</b></span><br />
        <SPAN> PARA OPERAR EL SISTEMA DEBE SER USUARIO REGISTRADO </SPAN> </P>
        <table style="left: 504px; top: 776px; align: center; margin: 0 auto;">
            <tr>
                <td rowspan="4" style="width: 100px">
                    <asp:Image ID="Image1" runat="server" Height="176px" ImageUrl="~/img/profesional.jpg"
                        Width="152px" /></td>
                <td style="width: 100px">
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtUsuario" runat="server" TabIndex="1"></asp:TextBox></td>
                <td style="width: 0px" rowspan="3">
                    <asp:ImageButton ID="imgBAyuda" runat="server" ImageUrl="~/images/boton-ayuda.png"
                        TabIndex="4" /></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 26px;">
                    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label></td>
                <td style="width: 180px; height: 26px;">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" TabIndex="2"></asp:TextBox>&nbsp;
                    <telerik:RadToolTip ID="ToolPass" runat="server" Skin="Sunset" TargetControlID="imgBAyuda"
                        Text="Olvido su password de Ingreso, Recuperela haciendo clic aquí" TabIndex="5">
                    </telerik:RadToolTip>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px; text-align: center;">
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/ingresar.png" TabIndex="3" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblMensaje" runat="server" Font-Size="Large" ForeColor="DarkRed" Text="Label"
                        Visible="False" TabIndex="6"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
    <br />
</div>
    

</asp:Content>

