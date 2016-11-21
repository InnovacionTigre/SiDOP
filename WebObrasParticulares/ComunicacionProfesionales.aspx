<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ComunicacionProfesionales.aspx.vb" Inherits="ComunicacionProfesionales" MasterPageFile="~/design/MasterPage.master"%>
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
 <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >COMUNICACIONES.<br />
    </span></strong>
<div style="text-align: center;">
    <asp:Panel ID="Panel1" runat="server" Height="350px" Width="900px" style="text-align:center;">
        &nbsp;&nbsp;
        <table style="border-left-color: #000000; border-bottom-color: #000000; border-top-style: groove;
            border-top-color: #000000; border-right-style: groove; border-left-style: groove;
            border-right-color: #000000; border-bottom-style: groove; font-family: Helvetica; width: 896px; height: 400px;">
            <tr>
                <td colspan="3">
                    <span style="font-size: 15pt; color: #7d0506;font-family: Helvetica" >CONTACTO CON PROFESIONALES.</span></td>
            </tr>
            <tr>
                <td style="height: 21px">
                    Origen:</td>
                <td style="height: 21px; width: 209px;">
                    &nbsp;<asp:TextBox ID="lblOrigen" runat="server" Enabled="False" Width="632px"></asp:TextBox></td>
                <td style="height: 21px">
                    </td>
            </tr>
            <tr>
                <td>
                    Asunto:</td>
                <td style="width: 209px">
                    &nbsp;<asp:TextBox ID="txtAsunto" runat="server" Width="632px"></asp:TextBox></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 106px;">
                    Mensaje:</td>
                <td style="height: 106px;" colspan="2">
                    <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" Height="216px" Width="752px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 26px">
                </td>
                <td style="height: 26px; width: 209px; text-align: center;">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Width="240px" /></td>
                <td style="height: 26px">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 26px">
                    <asp:Label ID="lblCartel" runat="server" ForeColor="Maroon" Text="Label" Visible="False"></asp:Label></td>
                <td style="height: 26px">
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <br />
    <br />
    <br />
     <br />
     </div>
    <asp:ImageButton id="imbVolver" onclick="imbVolver_Click" runat="server" ImageUrl="~/images/volver.png"></asp:ImageButton>&nbsp;
    <br />

</asp:Content>

