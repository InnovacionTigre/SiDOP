<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Entrar.aspx.vb" Inherits="Entrar" MasterPageFile="~/design/MasterPage.master"%>
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
    <asp:Panel ID="Panel1" runat="server" Height="150px" >
        <p><span style="color: #7d0506; font-size: 26px;"><b> SR. PROPIETARIO INGRESE AL SISTEMA</b></span><br />
        <SPAN> PARA OPERAR EL SISTEMA DEBE SER USUARIO REGISTRADO </SPAN> </P>
        <p><span style="color: #7d0506; font-size: 16px;"><b> EL NUMERO DE CUENTA CONSTA DE 8 DIGITOS, SI SU CUENTA ES MÁS ACOTADA COMPLETARLA CON CEROS (0) A LA IZQUIERDA</b></span><br />
        
        <p>
            <span></span>&nbsp;</p>
        <table style="left: 504px; top: 776px; align: center; margin: 0 auto; width:400px;">
            <tr>
                <td colspan="1" rowspan="4">
                    <asp:Image ID="Image1" runat="server" Height="144px" ImageUrl="~/img/propietario.jpg"
                        Width="128px" /></td>
                <td style="width: 75px">
                    <asp:Label ID="lblNroCuenta" runat="server" Text="Nro Cuenta:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNroCuenta" runat="server"></asp:TextBox></td>
                <td style="width: 933px" rowspan="3">
                    </td>
            </tr>
            <tr>
                <td style="width: 75px">
                    <asp:Label ID="lblClaveWeb" runat="server" Text="Clave Web:"></asp:Label></td>
                <td style="width: 800px">
                    <asp:TextBox ID="txtClaveWeb" runat="server" TextMode="Password" style="vertical-align: middle" TabIndex="1"></asp:TextBox><asp:Image ID="imgAyuda" runat="server" ImageUrl="~/images/boton-ayuda.png" style="vertical-align: middle" TabIndex="4" />&nbsp;
                    <telerik:RadToolTip ID="ToolPass" runat="server" Skin="Sunset" TargetControlID="imgAyuda" Text="La clave web se encuentra en el recibo municipal de ABL">
            </telerik:RadToolTip>
                    </td>
            </tr>
            <tr>
                <td style="width: 75px">
                </td>
                <td style="width: 100px; text-align: center;">
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/ingresar.png" TabIndex="3" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblMensaje" runat="server" Font-Size="Large" ForeColor="DarkRed" Text="Label"
                        Visible="False"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
    <br />

</div>
    

</asp:Content>

