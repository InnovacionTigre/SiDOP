<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="DatosPropietario.aspx.cs" Inherits="DatosPropietario" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenu" Src="DefaultMenu.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
iniciar();
    }
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
  

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
       <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >PROPIETARIO - DATOS PERSONALES.<br />
           &nbsp;</span></strong>&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
<div style="text-align:center; margin-left:0px;">
    <asp:Panel ID="Panel1" runat="server" Height="150px" Style="text-align: center">
        <p>
            <span style="font-size: 26px; color: #7d0506"><b>Datos de contribuyente</b></span><span>&nbsp;</span></p>
        <table style="margin-left:20px;left: 804px; margin: 0px auto; top: 776px; align: center">
            <tr>
                <td colspan="1" rowspan="7" style="width: 244px">
                    <asp:Image ID="Image1" runat="server" Height="144px" ImageUrl="~/img/propietario.jpg"
                        Width="128px" /></td>
                <td style="width: 260px; height: 40px">
                    <asp:Label ID="lblNroCuenta" runat="server" Text="Nro Cuenta:"></asp:Label></td>
                <td style="width: 100px; height: 40px">
                    <asp:TextBox ID="txtNroCuenta" runat="server" Enabled="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 260px">
                    <asp:Label ID="Label1" runat="server" Text="Nro Documento Propietario:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNroDocumento" runat="server" MaxLength="8"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 260px">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre Propietario:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 260px; height: 40px;">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido Propietario:"></asp:Label></td>
                <td style="width: 100px; height: 40px;">
                    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 260px; height: 40px">
                    <asp:Label ID="Label2" runat="server" Text="E-Mail:"></asp:Label></td>
                <td style="width: 100px; height: 40px">
                    <asp:TextBox ID="txtMail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 260px">
                </td>
                <td style="width: 100px; text-align: center"><asp:ImageButton ID="imbContinuar" runat="server" ImageUrl="~/images/continuar.png" OnClick="imbContinuar_Click" Visible="False" />
                    &nbsp;<asp:ImageButton ID="imbActualizarDatos" runat="server" ImageUrl="~/images/actualizar-datos.png" OnClick="imbActualizarDatos_Click" /></td>
            </tr>
            <tr>
                <td colspan="3">
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMensaje" runat="server" Font-Size="Large" ForeColor="DarkRed" Text="Label"
            Visible="False"></asp:Label></asp:Panel>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</div>

</asp:Content>
