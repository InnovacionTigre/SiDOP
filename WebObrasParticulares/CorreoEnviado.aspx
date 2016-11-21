<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="CorreoEnviado.aspx.cs" Inherits="CorreoEnviado" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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

<div style="padding-left:100Px; padding-top:50px; padding-bottom:70px;">
   <p style="font-size:18px; color:Gray;"> MUCHAS GRACIAS POR REGISTRARTE EN NUESTRO SISTEMA. LE ENVIAMOS UN CORREO ELECTRONICO A SU CASILLA PARA CONFIRMAR LA ACTIVACION DE LA CUENTA.</p>
    <p>
        &nbsp;</p>
   <p style="font-size:15px;color:Gray;">Tigre Municipio</p>
    </div>
    

</asp:Content>
