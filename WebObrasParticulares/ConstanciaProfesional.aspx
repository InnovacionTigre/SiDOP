<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ConstanciaProfesional.aspx.cs" Inherits="ConstanciaProfesional" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenuProfesional" Src="DefaultMenuProfesional.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
             inicio_pagina();
   }
   </script>

<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server"  />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuProfesional ID="DefaultMenuContent" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    &nbsp;<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
    <script type="text/javascript">

    function OpenAlert(text)
    {
     radalert("<p><strong>" + text +"</strong>!</p>", 500, 200, "Importarte");
   }
   function  OpenConfirm(text)
    {
       return   radconfirm("<p><strong>" + text +"</strong>!</p>", 500, 200, "Confirmación");      
   }
   function CallBackFn(arg)  
        {  
           OpenAlert(arg);
        }  
     function Numeros() 
   {
        var key = window.event.keyCode;
        if (key<48||key > 57) //46
        {
            window.event.keyCode = 0;
        }
   }
   function otroTag(url){
    window.open(url,'');
   // window.open(url);
    return false;
}
function imprSelec(muestra)
{var ficha=document.getElementById(muestra);var ventimp=window.open(' ','popimpr');ventimp.document.write(ficha.innerHTML);ventimp.document.close();ventimp.print();ventimp.close();}

</script>

   <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >CONSTANCIA DEL PROFESIONAL.<br />
    </span></strong>
    <div style="text-align: left">
        &nbsp;<br />
        &nbsp;<asp:ImageButton ID="imgImprimir" runat="server" OnClick="imgImprimir_Click" ImageUrl="~/images/imprimir.png" /><br />
        <div ID="muestra">
        &nbsp;<table style="border-right: #000000 thin double; border-top: #000000 thin double; border-left: #000000 thin double; border-bottom: #000000 thin double; font-family: Helvetica;">
            <tr>
                <td style="width: 385px; vertical-align: middle; text-align: center;">
                    <asp:Image ID="imgLogo" runat="server" style="vertical-align: middle; text-align: center" ImageUrl="~/images/logotigre.png" Width="360px" /></td>
                <td style="font-weight: bold; vertical-align: middle; width: 462px; text-align: center">
                    DIRECCIÓN GENERAL DE OBRAS PARTICULARES<br />
                    <br />
                    SR.
                    <asp:Label ID="lblNombre" runat="server" Text="Label"></asp:Label>
                    con D.N.I. nro<asp:Label ID="lblDNI" runat="server" Text="Label"></asp:Label>
                    ha quedado registrado en la base de datos de profesionales de ésta dirección<br />
                    <br />
                    Imprima el presente comprobante para ser adjuntado al expediente de obra.</td>
            </tr>
        </table>
        </div> 
        <br />
    </div>
    &nbsp;&nbsp;<asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png"
        OnClick="imbVolver_Click" />
    

</asp:Content>
