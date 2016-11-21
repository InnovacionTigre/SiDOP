<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Ayuda.aspx.cs" Inherits="Ayuda" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
             
   }
   </script>

<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server"  />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    &nbsp;
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
{var ficha=document.getElementById(muestra);var ventimp=window.open(' ','popimpr');ventimp.document.write(ficha.innerHTML);ventimp.document.close();ventimp.print();ventimp.close();}


</script>


    <br />
    <br />
    <div style="text-align: center; font-size: 20px;">
        &nbsp;<table align="center" style="width: 496px; border-right: #990000 thin solid; border-top: #990000 thin solid; border-left: #990000 thin solid; border-bottom: #990000 thin solid; table-layout: auto; border-collapse: collapse; font-size: 18px; vertical-align: middle; text-align: center;" >
            <tr>
                <td colspan="4" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; border-bottom: black thin solid; height: 23px;">
     <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >AYUDA.<br />
    </span></strong></td>
            </tr>
            <tr>
                <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                    width: 32px; border-bottom: black thin solid; height: 25px">
                    1</td>
                <td colspan="1" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 60px; border-bottom: black thin solid;
                    height: 25px">
                </td>
                <td colspan="2" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 496px; border-bottom: black thin solid;
                    height: 25px">
                    <a href="./Documentos/MANUAL SIDOP.pdf" target="_blank" >GUIA DE USUARIO. </a>
                </td>
            </tr>
            <tr>
                <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                    width: 32px; border-bottom: black thin solid; height: 25px">
                    2</td>
                <td colspan="1" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 60px; border-bottom: black thin solid;
                    height: 25px">
                </td>
                <td colspan="2" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 496px; border-bottom: black thin solid;
                    height: 25px">
                    <span face="">DECRETO 170/14</span></td>
            </tr>
            <tr>
                <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                    width: 32px; border-bottom: black thin solid; height: 25px">
                </td>
                <td colspan="1" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 60px; border-bottom: black thin solid;
                    height: 25px">
                    2.1</td>
                <td colspan="2" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 496px; border-bottom: black thin solid;
                    height: 25px">
                     <a href="./Documentos/Decreto 170 14.pdf" target="_blank" >
                    Cuerpo principal de Decreto 170/14</a></td>
            </tr>
            <tr>
                <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                    width: 32px; border-bottom: black thin solid; height: 25px;">
                    </td>
                <td colspan="1" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 60px; border-bottom: black thin solid;
                    height: 25px">
                    2.2</td>
                <td colspan="2" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 496px; border-bottom: black thin solid; height: 25px;">
                    <a href="./Documentos/ANEXO I.pdf" target="_blank" >
                    Procedimientos Administrativos(anexo I)</a></td>
            </tr>
            <tr>
                <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                    width: 32px; border-bottom: black thin solid">
                    </td>
                <td colspan="1" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 60px; border-bottom: black thin solid">
                    2.3</td>
                <td colspan="2" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 496px; border-bottom: black thin solid">
                     <a href="./Documentos/FORMULARIO DECLARACION JURADA  0905-11-13.pdf" target="_blank" >
                    Declaración Jurada (anexo II)</a></td>
                                        
            </tr>
            <tr>
                <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                    width: 32px; border-bottom: black thin solid">
                    </td>
                <td colspan="1" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 60px; border-bottom: black thin solid">
                    2.4</td>
                <td colspan="2" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 496px; border-bottom: black thin solid">
                    <a href="./Documentos/FORMULARIO DECLARACION JURADA  05-11-13 Anexo II.pdf" target="_blank" >
                    Corrección del Visador (anexo III)</a></td>
            </tr>
            <tr>
                   
                <td style="width: 32px; border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid;">
                    </td>
                <td colspan="1" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 60px; border-bottom: black thin solid">
                    2.5</td>
                <td colspan="2" style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; width: 496px; border-bottom: black thin solid">
                     <a href="./Documentos/ANEXO IV - AYUDA DEL ANEXO II.pdf" target="_blank" >
                    Ayuda del Anexo II (anexo IV).
                    </a>
                    </td>
                    
            </tr>
            <tr>
                <td style="width: 32px; border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid;">
                    </td>
                <td colspan="1" style="border-right: black thin solid; border-top: black thin solid;
                    border-left: black thin solid; width: 60px; border-bottom: black thin solid">
                    2.6</td>
                <td colspan="2" style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; width: 496px; border-bottom: black thin solid">
                    Planos de Ejemplo.</td>
            </tr>
            <tr>
                <td style="width: 32px; height: 21px">
                </td>
                <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                    width: 60px; border-bottom: black thin solid">
                </td>
                
                <td style="width: 41px; border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid;">
                    2.6.1</td>
                <td  style="width: 496px; border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid;">
                    <a href="./Documentos/PLANO_EJEMPLO_OBRA_NUEVA-Model.pdf" target="_blank">
                    Obra Nueva
                    <!--a href="./Documentos/Desagues-Ejemplo.pdf" target="_blank">
                    <Desagues-Ejemplo.-->
                    </a> 
                    </td>
                 
            </tr>
            <tr>
                <td style="width: 32px">
                </td>
                <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                    width: 60px; border-bottom: black thin solid">
                </td>
                
                <td style="width: 41px; border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid;">
                    2.6.2</td>
                    
                <td style="width: 496px; border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid;">
                   <a href="./Documentos/PLANO_EJEMPLO_SUBSISTENCIA-Model.pdf" target="_blank">
                   Subsistencia
                    <!--a href="./Documentos/Estructura-Ejemplo.pdf" target="_blank">
                    <Estructura-Ejemplo.-->
                    </a>
                    </td>
                    
            </tr>
            <tr>
                <td style="width: 32px">
                </td>
                <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                    width: 60px; border-bottom: black thin solid">
                </td>
                
                <td style="width: 41px; border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid;">
                    2.6.3</td>
                <td style="width: 496px; border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid;">
                    <a href="./Documentos/PLQANO_EJEMPLO_OBRAANTIRREGLAMENTARIA-Model.pdf" target="_blank">
                    Declaración de construcción antirreglamentaria
                    <!--a href="./Documentos/Municipal-Ejemplo.pdf" target="_blank">
                    Municipal-Ejemplo.-->
                    </a>
                    </td>
                    
            </tr>
        </table>
        <br />
        <div id="muestra">
            &nbsp;</div>
        <br />
    </div>
    &nbsp;&nbsp;<br />
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click" />
    

</asp:Content>
