<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Constancia.aspx.cs" Inherits="Constancia" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
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
{

var ficha=document.getElementById(muestra);var ventimp=window.open(' ','popimpr');ventimp.document.write(ficha.innerHTML);ventimp.document.close();ventimp.print();ventimp.close();

}


</script>
 <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >CONSTANCIA QR - CARTEL DE OBRA.<br />
     <br />
    </span></strong>
        
    <div style="text-align: left">
        &nbsp;<asp:ImageButton ID="imgImprimir" runat="server" OnClick="imgImprimir_Click" ImageUrl="~/images/guardarPDF.png" />
        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="imgImprimir_Click" ImageUrl="~/images/guardarPDF.png" /><br />
        <div id="muestra">
        <table  style="border-right: #000000 thin double; border-top: #000000 thin double; border-left: #000000 thin double; border-bottom: #000000 thin double; margin-left:5px;" cellpadding="0" cellspacing="0">
            <tr>
                <td rowspan="2" style="vertical-align: middle; width: 337px; text-align: center; padding-top:10px;">
                    <asp:Image ID="imgLogo" runat="server" style="vertical-align: middle; text-align: center" ImageUrl="~/images/logotigre.png" Width="334px" Height="144px" /></td>
                <td colspan="2" style="vertical-align: middle; text-align: center">
                    <asp:Label ID="lbl1" runat="server" Font-Bold="True" Style="text-align: center" Text="DIRECCIÓN GENERAL DE OBRAS PARTICULARES" Font-Size="X-Large" Width="624px"></asp:Label><br />
                    <asp:Label ID="lblEstadoExpediente" runat="server" Font-Bold="True" Font-Size="Large"
                        Style="text-align: center" Text="DIRECCIÓN GENERAL DE OBRAS PARTICULARES" Visible="False"
                        Width="624px"></asp:Label></td>
            </tr>
            <tr>
                <td style="vertical-align: middle; width: 466px; height: 45px; text-align: left; border-left: #000000 thin solid; padding-left:10px;">
                    <asp:Label ID="lblNombreProfesional" runat="server" Font-Bold="True" Style="text-align: center"
                        Text="PROFESIONAL RESPONSABLE:"></asp:Label><br />
                    <asp:Label ID="lblResNombreProfesional" runat="server" Font-Bold="True" Style="text-align: center"></asp:Label></td>
                <td style="vertical-align: middle; width: 466px; height: 45px; text-align: left; border-left: #000000 thin solid; padding-left:10px;">
                    <asp:Label ID="lblExpediente" runat="server" Font-Bold="True" Style="text-align: left"
                        Text="EXPEDIENTE DE OBRA:"></asp:Label><br />
                    <asp:Label ID="lblResExpediente" runat="server" Font-Bold="True" Style="text-align: left"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 337px; vertical-align: middle; text-align: center; padding-bottom:20px;" rowspan="5">
                    <asp:Image ID="imgQR" runat="server" Width="240px" Height="240px" /><br />
                </td>
                <td style="width: 466px; vertical-align: middle; border-left: #000000 thin solid; height: 46px; text-align: left; padding-left:10px;">
                    <asp:Label ID="lblNroMatricula" runat="server" Font-Bold="True" Style="text-align: center"
                        Text="N° DE MATRICULA:"></asp:Label><br />
                    <asp:Label ID="lblResNroMatricula" runat="server" Font-Bold="True" Style="text-align: center"></asp:Label></td>
                <td style="width: 466px; vertical-align: middle; border-left: #000000 thin solid; height: 46px; text-align: left; padding-left:10px;">
                    <asp:Label ID="lblRegistradoFecha" runat="server" Font-Bold="True" Style="text-align: center"
                        Text="REGISTRADO FECHA:"></asp:Label><br />
                    <asp:Label ID="lblResRegistroFecha" runat="server" Font-Bold="True" Style="text-align: center"></asp:Label></td>
            </tr>
            <tr>
                <td style="vertical-align: middle; width: 466px; text-align: left; border-left: #000000 thin solid; height: 46px; padding-left:10px;">
                    <asp:Label ID="lblTelefono" runat="server" Font-Bold="True" Style="text-align: center"
                        Text="N° DE TELEFONO:"></asp:Label><br />
                    <asp:Label ID="lblResTelefono" runat="server" Font-Bold="True" Style="text-align: center"></asp:Label></td>
                <td style="vertical-align: middle; width: 466px; text-align: left; border-left: #000000 thin solid; height: 46px; padding-left:10px;">
                    <asp:Label ID="lblDestino" runat="server" Font-Bold="True" Style="text-align: center"
                        Text="DESTINO DE LA OBRA:"></asp:Label><br />
                    <asp:Label ID="lblDestinoRes" runat="server"
                            Font-Bold="True" Style="text-align: center"></asp:Label></td>
            </tr>
            <tr>
                <td style="vertical-align: middle; width: 466px; text-align: left; border-left: #000000 thin solid; height: 46px; padding-left:10px;">
                    <asp:Label ID="lblMail" runat="server" Font-Bold="True" Style="text-align: center"
                        Text="E-MAIL:"></asp:Label><br />
                    <asp:Label ID="lblResMail" runat="server" Font-Bold="True" Style="text-align: center"></asp:Label></td>
                <td style="vertical-align: middle; width: 466px; text-align: left; border-left: #000000 thin solid; height: 46px; padding-left:10px;">
                    <asp:Label ID="lblSuperficie" runat="server" Font-Bold="True" Style="text-align: center"
                        Text="SUPERFICIE A CONSTRUIR:"></asp:Label><br />
                    <asp:Label ID="lblSuperficieRes" runat="server"
                            Font-Bold="True" Style="text-align: center"></asp:Label></td>
            </tr>
            <tr>
                <td style="vertical-align: middle; width: 466px; text-align: left; border-left: #000000 thin solid; height: 46px;">
                    &nbsp;&nbsp;
                    <asp:Label ID="lblTipoObra" runat="server" Font-Bold="True" Style="text-align: center"
                        Text="TIPO DE OBRA:"></asp:Label><br />
                    &nbsp;&nbsp;
                    <asp:Label ID="lblResTipoObra" runat="server" Font-Bold="True" Style="text-align: center"></asp:Label><br />
                    <asp:Label ID="lblViviendaUnifamiliar" runat="server" Font-Bold="True" Font-Size="Large" Style="text-align: center"
                        Text="VIVIENDA UNIFAMILIAR" Visible="False" Width="400px"></asp:Label></td>
                <td style="vertical-align: middle; width: 466px; text-align: left; border-left: #000000 thin solid; height: 46px; padding-left:10px;">
                    <asp:Label ID="lblAltura" runat="server" Font-Bold="True" Style="text-align: center"
                        Text="ALTURA:"></asp:Label><br />
                    <asp:Label ID="lblAlturaRes" runat="server" Font-Bold="True" Style="text-align: center"></asp:Label></td>
            </tr>
            <tr>
                <td style="vertical-align: middle; text-align: left; height: 46px; border-left-width: thin; border-left-color: #000000; border-top-style: none; border-right-style: none; border-bottom-style: none;" align="center" colspan="2">
                    &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" Style="text-align: center"
                        Text='" El siguiente plano se encuentra inscripto, en carácter de declaración jurada, siendo pasible de sanciones tanto el Sr. profesional como el Sr. propietario si la construcción no se ajusta a lo indicado en el plano".'
                        Width="944px"></asp:Label></td>
            </tr>
        </table>
        </div>
        <br />
    </div>
    &nbsp;&nbsp;<br />
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click" />
    

</asp:Content>
