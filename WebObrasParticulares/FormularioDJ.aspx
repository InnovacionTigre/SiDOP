<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="FormularioDJ.aspx.cs" Inherits="FormularioDJ" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenuProfesional" Src="DefaultMenuProfesional.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script runat="server">

    //protected void Page_Load(object sender, EventArgs e)
    //{

    //}
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

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
    &nbsp;&nbsp;<br />
    &nbsp;<br />
    &nbsp;<asp:Label ID="LblnroCuenta" runat="server" Text="06364500"></asp:Label>
    <table border="2" id="tablaContenedora" style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double; border-collapse: collapse;">
        <tr>
            <td colspan="14" style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>
                Marcar el item que se controlo</strong></td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>PROF</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>DG OP</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>N°</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>ITEM</strong></td>
            <td rowspan="62" style="width: 1px">
            </td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>PROF</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>DG OP</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>N°</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>ITEM</strong></td>
            <td rowspan="62">
            </td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>PROF</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>DG OP</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>N°</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>ITEM</strong></td>
        </tr>
        <tr>
            <td colspan="4" style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>
                1. CARATULA</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;" colspan="4">
                <strong>
                4. PLANTA ALTA</strong></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;" colspan="4">
                <strong>15. CORTE PILETA DE NATACION</strong></td>
        </tr>
        <tr>
            <td style="width: 42px; height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb1" runat="server" /></td>
            <td style="height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                &nbsp;<asp:RadioButtonList ID="Rbl1" runat="server">
                    <asp:ListItem>C</asp:ListItem>
                    <asp:ListItem>I</asp:ListItem>
                    <asp:ListItem>F</asp:ListItem>
                </asp:RadioButtonList></td>
            <td style="height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                1</td>
            <td style="height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Partida de contribución territorial</td>
            <td style="width: 37px; height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb59" runat="server" /></td>
            <td style="height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                59</td>
            <td style="height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Destino y numeración de locales</td>
            <td style="width: 18px; height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb108" runat="server" /></td>
            <td style="height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                108</td>
            <td style="height: 92px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Acotado alturas</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb2" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                2</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cuenta Municipal</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb60" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                60</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Acotado total</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb109" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                109</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cotas de nivel</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb3" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                3</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Expediente Anterior</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb61" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                61</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cotas de nivel</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb110" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                110</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Materialidad</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb4" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                4</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Plano de Obra - Decretos</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb62" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                62</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Ventilaciones</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb111" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                111</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cerco perimetral (s.c.)</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb5" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                5</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Destino</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb63" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                63</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Barandas (altura y material)</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb112" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                112</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Colores y rayados reglamentarios</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb6" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                6</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Propietario</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb64" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                64</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Escalera (ancho y sentido) (s.c.)</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;"colspan="4">
                <strong>16. INFORMACION COMPLEMENTARIA</strong></td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb7" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                7</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Calle, Número y Localidad</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb65" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                65</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Marcado de los cortes</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb113" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                113</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Carátula según Decreto N° 1313/10</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb8" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                8</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Barrio (s.c. : si corresponde)</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb66" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                66</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cortes y rayados reglamentarios</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb114" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                114</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cálculos de Premios</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb9" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                9</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Partido</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb67" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                67</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Proyecciones de cubiertas sup.</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb115" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                115</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cálculo de Estacionamiento</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb10" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                10</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Escala</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb68" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                68</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Vista superficie cubierta P.B.</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb116" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                116</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Indicadores según Reglamento int.</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb11" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                11</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Nomenclatura catastral</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb69" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                69</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Vistas a vecino</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb117" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                117</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Leyenda Específicas</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb12" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                12</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Zona</td>
            <td colspan="4" style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>
                5. PLANTA DE TECHOS</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb118" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                118</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Detalles de compensaciónes</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb13" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                13</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Fos y Fot de Código</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb70" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                70</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Materialidad</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb119" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                119</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Camino de Sirga / Restricciones / Cesiones</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb14" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                14</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Barrio Decreto Prov. N° 27 (s.c.)</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb71" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                71</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Pendientes - tipo, escurrimiento</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb120" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                120</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Rampa (ancho, sentido, pendiente)</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb15" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                15</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Superficies</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb72" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                72</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Desagües</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb121" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                121</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Ascensor (acotado)</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb16" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                16</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Fos de Proyecto</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb73" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                73</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Tanque (Mat. - cap.) acotado</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb122" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                122</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Forestación (especies - acotado)</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb17" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                17</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Fot de Proyecto</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb74" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                74</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Ventilaciones</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb123" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                123</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Planilla de Estadística</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb18" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                18</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Plano de Ubicación</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb75" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                75</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Azoteas accesibles - barandas - cotas de nivel</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb124" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                124</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Plano visado Colegio Profesional</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb19" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                19</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Servicios</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb76" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                76</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cargas - materiales, espesor y altura</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb125" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                125</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Contrato visado Colegio Prof.</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb20" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                20</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Referencias</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;"colspan="4">
                <strong>
                6. CORTES</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb126" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                126</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Plano visado por Barrio Cerrado</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb21" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                21</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Leyendas</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb77" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                77</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Correspondencia dibujo</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb127" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                127</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Plano de Escurrimiento</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb22" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                22</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Antigüedad de la Obra</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb78" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                78</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Acotado de alturas (parciales, baricentro)</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb128" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                128</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Antecedentes de consulta a C.I.A.C.Z.</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb23" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                23</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Propetarios: domicilio, firma</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb79" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                79</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cotas de nivel</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb129" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                129</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Presupuesto de Modificaciones internas o Demolición</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb24" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                24</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Profesional: -Dom, -Mat, -Firma</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb80" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                80</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cota IGM + 4.00m (en zonas inund.)</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb130" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                130</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Copia de Documento de Identidad</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb25" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                25</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Tareas Profesionales</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb81" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                81</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Materialidad</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb131" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                131</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Copia Estatuto de la Sociedad (s.c.)</td>
        </tr>
        <tr>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;" colspan="4">
                <strong>
                2. CARATULA COMPLEMENTARIA</strong></td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb82" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                82</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Colores y rayados reglamentarios</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb132" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                132</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Copia C.U.I.T de la Sociedad (s.c.)</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb26" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                26</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Balance de Superficie</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;" colspan="4">
                <strong>
                7. VISTAS (una por calle)</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb133" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                133</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Copia de Poder (s.c.)</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb27" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                27</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Totales Cubierta / Semicubierta</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb83" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                83</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Correspondencia dibujo</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb134" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                134</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb28" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                28</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Ubicación</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb84" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                84</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Acotado de alturas (total, baricentro)</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb135" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                135</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Coincidencia Sup.Antecedente</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb29" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                29</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Superficie Total</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb85" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                85</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cota IGM + 4.00m (en zonas inund.)</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb136" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                136</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Seperar sup. cubierta y semi</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb30" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                30</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Nomenclatura catastral</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb86" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                86</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Materialidad frentes</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb137" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                137</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cálculos medios de Salida</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb31" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                31</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Partida de contribución territorial</td>
            <td colspan="4" style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>
                8. ESTRUCTURA</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb138" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                138</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cálculo cargas de fuego</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb32" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                32</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cuenta Municipal</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb87" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                87</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Planta de Fundaciones</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb139" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                139</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Plano hidraulico 10000 m2</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb33" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                33</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Croquis de Ubicación</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb88" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                88</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Plantas (según nivel)</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb140" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                140</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Visación Direc. Industria</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb34" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                34</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Superficie de Terreno</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb89" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                89</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Estructura de Techos</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb141" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                141</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Visación Direc. Habilitación</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb35" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                35</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Pileta de natación (s.c.)</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb90" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                90</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Planilla de cálculo</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb142" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                142</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Artefactos Sanitarios</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb36" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                36</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Firmas</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb91" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                91</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Carátula con detalle especifico (si va en plano aparte)</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb143" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                143</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Verificar calle a ceder</td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb37" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                37</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cumplimiento según Código</td>
            <td colspan="4" style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <strong>
                9. SILUETA Y BALANCE DE SUPERFICIES</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb144" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                144</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Unificación parcelas
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb38" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                38</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Desglose de Antecedentes</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb92" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                92</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Geometría silueta</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb39" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                39</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Final de Obra</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb93" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                93</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cotas referidas a plantas</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb40" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                40</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Otros Exptes.</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb94" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                94</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Numeración</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;"colspan="4">
                <strong>
                3. PLANTA BAJA</strong></td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb95" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                95</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Rayados reglamentarios</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb41" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                41</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Delimitación del terreno</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb96" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                96</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Encolumnado según tipo de plano</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb42" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                42</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Acotado del terreno</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb97" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                97</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Sumatorias parciales</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb43" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                43</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cercos reglamentarios</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb98" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                98</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Sumatoria total</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb44" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                44</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Calle-Vereda (con cota de nivel) - Arbolado</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;"colspan="4">
                <strong>
                10. CALCULO DE F.O.S. Y F.O.T.</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb45" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                45</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Retiros reglamentarios / Restricciones</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb99" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                99</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cálculo según cómputo Balance</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb46" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                46</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Destino y numeración de locales</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;"colspan="4">
                <strong>
                11. CALCULO DE DENSIDAD</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb47" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                47</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Acotado total</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb100" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                100</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Densidad de proyecto &lt;= según zona</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb48" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                48</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cotas de nivel</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;"colspan="4">
                <strong>
                12. PLANILLA DE ILUM. Y VENT.</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb49" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                49</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Ventilaciones</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb101" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                101</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Destino, sup., coef., proy., obs.</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb50" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                50</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Barandas (altura y material)</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;"colspan="4">
                <strong>
                13. NIVEL DE PROYECTO</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb51" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                51</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Escalera (ancho y sentido) (s.c.)</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb102" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                102</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Verificación N.P.T.P.B. &gt;= + 4.00 IGM</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb52" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                52</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Marcado de los cortes</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;"colspan="4">
                <strong>
                14. DETALLE DE ESCALERA</strong></td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb53" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                53</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Colores y rayados reglamentarios</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb103" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                103</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Acotado de escalones</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb54" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                54</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Proyecciones de cubiertas superiores</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb104" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                104</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Materialidad</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb55" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                55</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Pileta natación (acotada) (s.c.)</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb105" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                105</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Cálculo</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb56" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                56</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Módulo de estacionamiento</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb106" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                106</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Detalle de compensado (s.c.)</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb57" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                57</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                P-N. / B.A. (acotados) (s.c.)</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb107" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                107</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Ancho min. - Sentido escalera</td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        <tr>
            <td style="width: 42px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                <asp:CheckBox ID="Chb58" runat="server" /></td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                58</td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
                Vistas a vecino</td>
            <td style="width: 37px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="width: 18px; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
            <td style="border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">
            </td>
        </tr>
        
    </table>
    <br />
    <br />
    <asp:Button ID="BtnGuardar" runat="server" OnClick="BtnGuardar_Click" Text="Guardar" /><br />
    <br />
    <br />
    <br />
    <br />
    <br />
    

</asp:Content>
