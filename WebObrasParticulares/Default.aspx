<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" MasterPageFile="~/design/MasterPage.master"%>
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
    <art:DefaultMenu ID="DefaultMenuContent" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">

<div style="padding-left:12px; padding-right: 12px; padding-bottom: 12px; padding-top: 12px;">
    <br />
    <p>
    BIENVENIDOS AL SISTEMA WEB DE PRESENTACIÓN DE PLANOS. PARA PODER OPERAR DEBE SER
    USUARIO REGISTRADO, PARA MAS INFORMACIÓN PUEDE DIRIGIRSE EN EL MENU SUPERIOR A LA
    PARTE DE AYUDA.<br /></p>
    <br />
   <p>MUCHAS GRACIAS<br /></p>
    <br />
    <p>TIGRE MUNICIPIO.</p></div>
    

</asp:Content>

