<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GenerarCarpetas.aspx.vb" Inherits="GenerarCarpetas" MasterPageFile="~/design/MasterPage.master"%>
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
    <asp:Panel ID="Panel1" runat="server" Height="150px" style="text-align: center" >
        <p><span style="color: #7d0506; font-size: 26px;"><b> Creación de cuentas Manual</b></span><SPAN> </SPAN> </P>
        <table style="left: 504px; top: 776px; align: center; margin: 0 auto;">
            <tr>
                <td colspan="1" rowspan="6">
                    <asp:Image ID="Image1" runat="server" Height="144px" ImageUrl="~/img/propietario.jpg"
                        Width="128px" /></td>
                <td style="width: 100px">
                    <asp:Label ID="lblNroCuenta" runat="server" Text="Nro Cuenta:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNroCuenta" runat="server"></asp:TextBox></td>
                <td style="width: 100px" rowspan="5">
                    </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="Label1" runat="server" Text="Nro Documento Propietario:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNroDocumento" runat="server" MaxLength="8"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre Propietario:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido Propietario:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px; text-align: center;">
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/generar-carpeta.png" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    </td>
            </tr>
        </table>
                    <asp:Label ID="lblMensaje" runat="server" Font-Size="Large" ForeColor="DarkRed" Text="Label"
                        Visible="False"></asp:Label></asp:Panel>
    <br />
    </div>
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click"
        Style="text-align: left" />
    
      <script type="text/javascript">
    
   function Numeros() 
   {
        var key = window.event.keyCode;
        if (key<48||key > 57) 
        {
            window.event.keyCode = 0;
        }
   }

    
</script>  
</asp:Content>

