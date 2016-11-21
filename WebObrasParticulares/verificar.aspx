<%@ Page Language="VB" AutoEventWireup="false" CodeFile="verificar.aspx.vb" Inherits="verificar" MasterPageFile="~/design/MasterPage.master"%>
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
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">

<div style="padding-left:200Px;">
    <asp:Panel ID="Panel1" runat="server" Height="112px" Width="500px">
        <asp:Label ID="lblTexto" runat="server" Text="La siguiente obra NO SE ENCUENTRA APROBADA por el MUNICIPIO DE TIGRE"></asp:Label>
        <br />
        <asp:HyperLink ID="hplQR" runat="server" Font-Bold="True" ForeColor="Black">CLICK AQUI PARA VER EL PLANO</asp:HyperLink>
        <br />
        <br />
        <asp:ListBox ID="ListaArchivos" runat="server" Width="448px"></asp:ListBox>
        <br />
        Ingrese su clave para descargar el Plano:
        <asp:TextBox ID="txtClave" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" /><br />
        <asp:Button ID="Button1" runat="server" Text="Descargar Plano" Visible="False" /></asp:Panel>
</div>
    

</asp:Content>

