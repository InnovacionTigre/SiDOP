<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="FormularioLDViviendaB.aspx.cs" Inherits="FormularioLDViviendaB" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    &nbsp;
    &nbsp;&nbsp;<div style="text-align: left">
        <asp:UpdatePanel id="UpdatePanel1" runat="server">
            <contenttemplate><table border="1" cellspacing="0" style="width: 100%; text-align: center">
        <tr>
            <td colspan="8" rowspan="1" style="height: 23px">
                Seleccione la Categoria de Inmueble
                <asp:DropDownList ID="ddlCategoria" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"
                    Width="48px">
                    <asp:ListItem>A</asp:ListItem>
                    <asp:ListItem>B</asp:ListItem>
                    <asp:ListItem>C</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlTipo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged"
                    Width="176px">
                    <asp:ListItem Value="1">Vivienda</asp:ListItem>
                    <asp:ListItem Value="2">Comercio/Industria</asp:ListItem>
                </asp:DropDownList></td>
            <td colspan="3" rowspan="1" style="height: 23px">
                Nro cuenta:
                <asp:Label ID="lblNroCuenta" runat="server" Text="Label"></asp:Label>-</td>
        </tr>
        <tr>
            <td colspan="4" rowspan="2" style="height: 23px">
                -LOGO-</td>
            <td colspan="4" rowspan="2" style="height: 23px">
                DECLARACION JURADA DE DERECHOS DE CONSTRUCCION DGOP</td>
            <td colspan="3" rowspan="2" style="height: 23px">
                <asp:Label ID="lblVivienda" runat="server" Text="Label"></asp:Label>
                CATEGORIA &nbsp;
                <asp:Label ID="lblcat" runat="server" Text="Label"></asp:Label>
                $<asp:Label ID="lblvalor" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td colspan="11">
                -</td>
        </tr>
        <tr>
            <td colspan="11" rowspan="3" style="height: 118px">
                1- El propietario declara conocer y aceptar los términos de Ordenanzas y Decretos
                relacionados con la presentación de los planos adjuntos y renuncia expresamente
                a cualquier reclamo en caso que las construcciones se encuentran fuera del alcance
                de las normas y no puedan ser incorporadas al catastro municipal.<br />
                2- La aceptación por pate del Municipio de la presente declaración jurada y la porterior
                incorporación al catastro municipal de las construcciones son condición necesaria,
                pero no suficiente para la Habilitación de comercios y/o para la aprobación de planos
                de subdivisión por Propiedad Horizontal.</td>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
            <td colspan="6" style="height: 23px">
                -</td>
            <td colspan="2" style="height: 23px">
                DERECHOS</td>
            <td style="width: 100px; height: 23px">
                -</td>
            <td style="width: 99px; height: 23px">
                -</td>
            <td rowspan="2" style="width: 100px">
                DERECHO SUBTOTAL</td>
        </tr>
        <tr>
            <td colspan="3" style="height: 23px">
                -</td>
            <td style="width: 22px; height: 23px">
                SUPERFICIE</td>
            <td style="width: 100px; height: 23px">
                CATEGORIA</td>
            <td style="width: 147px; height: 23px">
                VALOR OBRA</td>
            <td style="width: 100px; height: 23px">
                TASA</td>
            <td style="width: 100px; height: 23px">
                IMPORTE</td>
            <td style="width: 100px; height: 23px">
                -</td>
            <td style="width: 99px; height: 23px">
                -</td>
        </tr>
        <tr>
            <td rowspan="7" style="width: 100px">
                NUEVA</td>
            <td rowspan="2" style="width: 114px">
                OBRA NUEVA</td>
            <td style="width: 100px">
                Cub.</td>
            <td style="width: 22px">
                <asp:TextBox ID="txtObraNuevaCub" runat="server" AutoPostBack="True" OnTextChanged="txtObraNuevaCub_TextChanged"
                    Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblObraNuevaCub" runat="server" Text="1700"></asp:Label></td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorObraNuevaCub" runat="server" Enabled="False" Width="56px"></asp:TextBox>
            </td>
            <td style="width: 100px">
                <asp:Label ID="lblObraNuevaCubTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtImporteObraNuevaCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                -</td>
            <td style="width: 99px">
                -</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtSubtotalObraNuevaCub" runat="server" Enabled="False" Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                S/Cub.</td>
            <td style="width: 22px">
                <asp:TextBox ID="txtObraNuevaSCub" runat="server" AutoPostBack="True" OnTextChanged="txtObraNuevaSCub_TextChanged"
                    TabIndex="1" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblObraNuevaSCub" runat="server" Text="1700"></asp:Label></td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorObraNuevaSCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblObraNuevaSCubTasa" runat="server" Text="0,0075"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtImporteObraNuevaSCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                -</td>
            <td style="width: 99px">
                -</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtSubTotalObraNuevaSCub" runat="server" Enabled="False" Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td rowspan="2" style="width: 114px">
                AMPLIACION</td>
            <td style="width: 100px">
                Cub.</td>
            <td style="width: 22px">
                <asp:TextBox ID="txtAmpliacionCub" runat="server" AutoPostBack="True" OnTextChanged="txtAmpliacionCub_TextChanged"
                    TabIndex="2" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblAmpliacionCub" runat="server" Text="1700"></asp:Label></td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorAmpliacionCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblAmpliacionCubTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtImporteAmpliacionCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                -</td>
            <td style="width: 99px">
                -</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtSubTotalAmpliacionCub" runat="server" Enabled="False" Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px; height: 28px">
                S/Cub.</td>
            <td style="width: 22px; height: 28px">
                <asp:TextBox ID="txtAmpliacionSCub" runat="server" AutoPostBack="True" OnTextChanged="txtAmpliacionSCub_TextChanged"
                    TabIndex="3" Width="56px"></asp:TextBox></td>
            <td style="width: 100px; height: 28px">
                <asp:Label ID="lblAmpliacionSCub" runat="server" Text="1700"></asp:Label></td>
            <td style="width: 147px; height: 28px">
                <asp:TextBox ID="txtValorAmpliacionSCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px; height: 28px">
                <asp:Label ID="lblAmpliacionSCubTasa" runat="server" Text="0,0075"></asp:Label></td>
            <td style="width: 100px; height: 28px">
                <asp:TextBox ID="txtImporteAmpliacionSCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px; height: 28px">
                -</td>
            <td style="width: 99px; height: 28px">
                -</td>
            <td style="width: 100px; height: 28px">
                <asp:TextBox ID="txtSubTotalAmpliacionSCub" runat="server" Enabled="False" Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 114px">
                DEMOLICION</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 22px">
                -</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorDemolicion" runat="server" AutoPostBack="True" OnTextChanged="txtValorDemolicion_TextChanged"
                    TabIndex="4" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblDemolicionTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtImporteDemolicion" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                -</td>
            <td style="width: 99px">
                -</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtSubTotalDemolicion" runat="server" Enabled="False" Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 114px">
                MODIFICACION<br />
                INTERNA</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 22px">
                -</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorModificacionInterna" runat="server" AutoPostBack="True"
                    OnTextChanged="txtValorModificacionInterna_TextChanged" TabIndex="5" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblModificacionInternaTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtImporteModificionInterna" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                -</td>
            <td style="width: 99px">
                -</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtSubTotalModificionInterna" runat="server" Enabled="False" Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 114px">
                PILETA</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 22px">
                Minimo</td>
            <td style="width: 100px">
                1200</td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorPileta" runat="server" AutoPostBack="True" OnTextChanged="txtValorPileta_TextChanged"
                    TabIndex="6" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblPiletaTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtimportePileta" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                -</td>
            <td style="width: 99px">
                -</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtSubTotalPileta" runat="server" Enabled="False" Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="11">
                -</td>
        </tr>
        <tr>
            <td colspan="6">
                -</td>
            <td colspan="2">
                DERECHO</td>
            <td colspan="2">
                RECARGO</td>
            <td rowspan="2" style="width: 100px">
                DERECHO SUBTOTAL</td>
        </tr>
        <tr>
            <td colspan="3">
                -</td>
            <td style="width: 22px">
                SUPERFICIE</td>
            <td style="width: 100px">
                CATEGORIA</td>
            <td style="width: 147px">
                VALOR OBRA</td>
            <td style="width: 100px">
                TASA</td>
            <td style="width: 100px">
                IMPORTE</td>
            <td style="width: 100px">
                TASA</td>
            <td style="width: 99px">
                IMPORTE</td>
        </tr>
        <tr>
            <td rowspan="7" style="width: 100px">
                EXISTENTE</td>
            <td rowspan="2" style="width: 114px">
                SUBSISTENCIA</td>
            <td style="width: 100px; height: 23px">
                Cub.</td>
            <td style="width: 22px; height: 23px">
                <asp:TextBox ID="txtsubsistenciaCub" runat="server" AutoPostBack="True" OnTextChanged="txtsubsistenciaCub_TextChanged"
                    TabIndex="7" Width="56px"></asp:TextBox></td>
            <td style="width: 100px; height: 23px">
                <asp:Label ID="lblsubsistenciaCub" runat="server" Text="1700"></asp:Label></td>
            <td style="width: 147px; height: 23px">
                <asp:TextBox ID="txtValorSubsistenciaCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px; height: 23px">
                <asp:Label ID="lblSubsistenciaCubTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px; height: 23px">
                <asp:TextBox ID="txtImporteSubsistenciaCub" runat="server" Enabled="False" Width="48px"></asp:TextBox></td>
            <td style="width: 100px; height: 23px">
                <asp:Label ID="lblSubsistenciaCubTasaRecargo" runat="server" Text="0,5"></asp:Label></td>
            <td style="width: 99px; height: 23px">
                <asp:TextBox ID="txtRecargoSubsistenciaCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px; height: 23px">
                <asp:TextBox ID="txtExistenteSubtotalObraNuevaCub" runat="server" Enabled="False"
                    Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                S/Cub.</td>
            <td style="width: 22px">
                <asp:TextBox ID="txtSubsistenciaSCub" runat="server" AutoPostBack="True" OnTextChanged="txtSubsistenciaSCub_TextChanged"
                    TabIndex="8" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblSubsistenciaSCub" runat="server" Text="1700"></asp:Label></td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorSubsistenciaSCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblSubsistenciaSCubTasa" runat="server" Text="0,0075"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtImporteSubsistenciaSCub" runat="server" Enabled="False" Width="48px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblSubsistenciaSCubTasaRecargo" runat="server" Text="0,5"></asp:Label></td>
            <td style="width: 99px">
                <asp:TextBox ID="txtRecargoSubsistenciaSCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtExistenteSubTotalObraNuevaSCub" runat="server" Enabled="False"
                    Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td rowspan="2" style="width: 114px">
                CONFORME OBRA</td>
            <td style="width: 100px; height: 28px">
                Cub.</td>
            <td style="width: 22px; height: 28px">
                <asp:TextBox ID="txtConformeObraCub" runat="server" AutoPostBack="True" OnTextChanged="txtConformeObraCub_TextChanged"
                    TabIndex="9" Width="56px"></asp:TextBox></td>
            <td style="width: 100px; height: 28px">
                <asp:Label ID="lblConformeObraCub" runat="server" Text="1700"></asp:Label></td>
            <td style="width: 147px; height: 28px">
                <asp:TextBox ID="txtValorConformeObraCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px; height: 28px">
                <asp:Label ID="lblConformeObraCubTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px; height: 28px">
                <asp:TextBox ID="txtImporteConformeObraCub" runat="server" Enabled="False" Width="48px"></asp:TextBox></td>
            <td style="width: 100px; height: 28px">
                <asp:Label ID="lblConformeObraCubTasaRecargo" runat="server" Text="0,5"></asp:Label></td>
            <td style="width: 99px; height: 28px">
                <asp:TextBox ID="txtRecargoConformeObraCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px; height: 28px">
                <asp:TextBox ID="txtExistenteSubTotalAmpliacionCub" runat="server" Enabled="False"
                    Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                S/Cub.</td>
            <td style="width: 22px">
                <asp:TextBox ID="txtConformeObraSCub" runat="server" AutoPostBack="True" OnTextChanged="txtConformeObraSCub_TextChanged"
                    TabIndex="10" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblConformeObraSCub" runat="server" Text="1700"></asp:Label></td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorConformeObraSCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblConformeObraSCubTasa" runat="server" Text="0,0075"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtImporteConformeObraSCub" runat="server" Enabled="False" Width="48px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblConformeObraSCubTasaRecargo" runat="server" Text="0,5"></asp:Label></td>
            <td style="width: 99px">
                <asp:TextBox ID="txtRecargoConformeObraSCub" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtExistenteSubTotalAmpliacionSCub" runat="server" Enabled="False"
                    Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 114px">
                DEMOLICION</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 22px">
                -</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorExistenteDemolicion" runat="server" AutoPostBack="True"
                    OnTextChanged="txtValorExistenteDemolicion_TextChanged" TabIndex="11" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblExistenteDemolicionTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtImporteExistenteDemolicion" runat="server" Enabled="False" Width="48px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblExistenteDemolicionTasaRecargo" runat="server" Text="0,5"></asp:Label></td>
            <td style="width: 99px">
                <asp:TextBox ID="txtRecargoExistenteDemolicion" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtExistenteSubTotalDemolicion" runat="server" Enabled="False" Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 114px">
                MODIFICACION INTERNA</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 22px">
                -</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorExistenteModificacionInterna" runat="server" AutoPostBack="True"
                    OnTextChanged="txtValorExistenteModificacionInterna_TextChanged" TabIndex="12"
                    Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblExistenteModificacionInternaTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtImporteExistenteModificionInterna" runat="server" Enabled="False"
                    Width="48px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblExistenteModificacionInternaTasaRecargo" runat="server" Text="0,5"></asp:Label></td>
            <td style="width: 99px">
                <asp:TextBox ID="txtRecargoExistenteModificionInterna" runat="server" Enabled="False"
                    Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtExistenteSubTotalModificionInterna" runat="server" Enabled="False"
                    Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 114px">
                PILETA</td>
            <td style="width: 100px">
                -</td>
            <td style="width: 22px">
                Minimo$</td>
            <td style="width: 100px">
                1200</td>
            <td style="width: 147px">
                <asp:TextBox ID="txtValorExistentePileta" runat="server" AutoPostBack="True" OnTextChanged="txtValorExistentePileta_TextChanged"
                    TabIndex="13" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblExistentePiletaTasa" runat="server" Text="0,0150"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtimporteExistentePileta" runat="server" Enabled="False" Width="48px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="lblExistentePiletaTasaRecargo" runat="server" Text="0,5"></asp:Label></td>
            <td style="width: 99px">
                <asp:TextBox ID="txtRecargoExistentePileta" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtExistenteSubTotalPileta" runat="server" Enabled="False" Width="56px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 114px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 22px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 147px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 99px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="10">
                TOTAL A PAGAR PESOS
            </td>
            <td style="width: 100px">
                <asp:TextBox ID="txtTotalPagar" runat="server" Enabled="False" Width="56px"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="11">
                <asp:Button ID="Button1" runat="server" Text="GENERAR PAGO" /></td>
        </tr>
    </table></contenttemplate>
                    </asp:UpdatePanel>
    </div>
    &nbsp;&nbsp;
    

</asp:Content>
