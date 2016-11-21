<%@ Page Language="VB" AutoEventWireup="false" CodeFile="olvidoPassword.aspx.vb" Inherits="EntrarProfesional" MasterPageFile="~/design/MasterPage.master"%>
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

<div style="text-align:center">
    <asp:Panel ID="Panel1" runat="server" Height="150px" >
        <p><span style="color: #7d0506; font-size: 26px;"><b> SR. PROFESIONAL COMPLETE EL FORMULARIO
            PARA RECUPERAR SU CLAVE</b></span><br />
        <SPAN> Se le enviará por mail la nueva password para el ingreso, una vez dentro del sistema
            proceder a su cambio&nbsp;</SPAN></P>
        <table style="left: 504px; top: 776px; align: center ; margin: 0 auto;">
            <tr>
                <td rowspan="4" style="width: 100px">
                    <asp:Image ID="Image1" runat="server" Height="176px" ImageUrl="~/img/profesional.jpg"
                        Width="152px" /></td>
                <td style="width: 100px">
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox></td>
                <td style="width: 0px" rowspan="3">
                    </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 26px;">
                    <asp:Label ID="lblMail" runat="server" Text="Dirección de E-Mail:"></asp:Label></td>
                <td style="width: 100px; height: 26px;">
                    <asp:TextBox ID="txtMail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px; text-align: center;">
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/password.png" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblMensaje" runat="server" Font-Size="Large" ForeColor="DarkRed" Text="Label"
                        Visible="False"></asp:Label>
                    </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
</div>
    

</asp:Content>

