<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Formulario.aspx.cs" Inherits="Formulario" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
        txtObraNuevaCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtObraNuevaSCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtAmpliacionCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtAmpliacionSCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorDemolicion.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorModificacionInterna.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorPileta.Attributes.Add("onKeyPress", "Numeros(event)");
        txtsubsistenciaCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtSubsistenciaSCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtConformeObraCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtConformeObraSCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorExistenteDemolicion.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorExistenteModificacionInterna.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorExistentePileta.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorEspecialCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorEspecialScub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorMultifamiliar.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorGalerias.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorIndustria.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorEmprendimientosUrbanos.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorAmbientalCub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtValorAmbientalScub.Attributes.Add("onKeyPress", "Numeros(event)");
        txtCantLocales.Attributes.Add("onKeyPress", "Numeros(event)");
        txtCantViviendas.Attributes.Add("onKeyPress", "Numeros(event)");
        txtCantDormitorios.Attributes.Add("onKeyPress", "Numeros(event)");
        txtCantBanos.Attributes.Add("onKeyPress", "Numeros(event)");
        inicio_pagina();
        ddlCategoria_SelectedIndexChanged(sender, e);
        verSiProfesional();
   }
   </script>

<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" OnLoad="DefaultHeader_Load"  />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuProfesional ID="DefaultMenuContent" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
    &nbsp;<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
         <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >FORMULARIO DE DERECHOS DE CONSTRUCCIÓN.<br />
    </span></strong>
    <span style="font-family: Helvetica; font-size: 19px">
         Datos útiles:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para seleccionar
    una fila debe hacer clic sobre ella.<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; -Para realizar un
    filtro debe escribir dentro de los cuadros determinados y presionar la tecla ENTER.<br /></span>
    &nbsp;&nbsp;<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    &nbsp;&nbsp;
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
     function Numeros(e) 
   {
        if(window.event)
        var key = window.event.keyCode;       // IE
        else
         var key = e.which;
        
       // var key = window.event.keyCode;
        if (key<48||key > 57) //46
        {
            //window.event.keyCode = false;
            if(window.event)
             window.event.returnValue=false;       // IE
          else
             e.preventDefault();
        }
    
       
            
   }
   function otroTag(url){
    window.open(url,'');
   // window.open(url);
    return false;
}
</script>

    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
        
    </telerik:RadWindowManager>
  
     <div style="text-align: center;"><telerik:RadGrid ID="RadGrid1" runat="server"
        DataSourceID="SqlDataSourceliquidacionXcuenta" GridLines="None" Skin="Sunset" AllowPaging="True" PageSize="5" Font-Names="Helvetica">
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceliquidacionXcuenta">
            <Columns>
                <telerik:GridBoundColumn DataField="idLiquidacion" DataType="System.Int32" HeaderText="Identificaci&#243;n de Liquidaci&#243;n"
                    ReadOnly="True" SortExpression="idLiquidacion" UniqueName="idLiquidacion">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fecha" DataType="System.DateTime" HeaderText="Fecha de Liquidaci&#243;n"
                    SortExpression="fecha" UniqueName="fecha">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="totalPagar" DataType="System.Double" HeaderText="Total a Pagar"
                    SortExpression="totalPagar" UniqueName="totalPagar">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
         <FooterStyle Font-Names="Helvetica" />
         <HeaderStyle Font-Names="Helvetica" HorizontalAlign="Center" />
    </telerik:RadGrid>&nbsp;</div>
    <asp:Button ID="btnCargar" runat="server" OnClick="btnCargar_Click" Text="Cargar liquidacion anterior" />
    <asp:SqlDataSource ID="SqlDataSourceliquidacionXcuenta" runat="server" ConnectionString="<%$ ConnectionStrings:PlanoDigitalConnectionString %>"
        SelectCommand="SELECT [idLiquidacion], [fecha], [totalPagar] FROM [LiquidacionDerechosConstruccion] WHERE ([nrocuenta] = @nrocuenta)">
        <SelectParameters>
            <asp:QueryStringParameter Name="nrocuenta" QueryStringField="cuenta" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
     <div style="text-align: center;">
    <table style="font-family: Helvetica; padding-left:300px;">
        <tr>
            <td colspan="4" style="vertical-align: middle; text-align: center">
                ESTADISTICAS</td>
        </tr>
        <tr>
            <td style="width: 179px">
                Superficie a Construir :</td>
            <td style="width: 153px">
                <asp:TextBox ID="txtSuperficieConstruir" runat="server"></asp:TextBox></td>
            <td style="width: 233px">
                Tipo de Obra</td>
            <td style="width: 126px"><asp:DropDownList ID="ddlTipoObra" runat="server" OnSelectedIndexChanged="ddlTipoObra_SelectedIndexChanged">
                <asp:ListItem>Obra Nueva</asp:ListItem>
                <asp:ListItem Value="Demolicion">Demolici&#243;n</asp:ListItem>
                <asp:ListItem>Subsistencia</asp:ListItem>
                <asp:ListItem>Pileta</asp:ListItem>
                <asp:ListItem>Plano Inscripto</asp:ListItem>
            </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 179px">
                Cantidad de Locales Comer.:</td>
            <td style="width: 153px">
                <asp:TextBox ID="txtCantLocales" runat="server"></asp:TextBox></td>
            <td style="width: 233px">
                Destino:</td>
            <td style="width: 126px">
                <asp:DropDownList ID="ddlDestino" runat="server">
                    <asp:ListItem Value="1">Administraci&#243;n</asp:ListItem>
                    <asp:ListItem Value="2">Bailable</asp:ListItem>
                    <asp:ListItem Value="3">Barrio Cerrado</asp:ListItem>
                    <asp:ListItem Value="4">Comercio</asp:ListItem>
                    <asp:ListItem Value="5">Deportes</asp:ListItem>
                    <asp:ListItem Value="6">Educaci&#243;n</asp:ListItem>
                    <asp:ListItem Value="7">Guarderia N&#225;utica</asp:ListItem>
                    <asp:ListItem Value="8">Garage</asp:ListItem>
                    <asp:ListItem Value="9">Industria</asp:ListItem>
                    <asp:ListItem Value="10">Log&#237;stica</asp:ListItem>
                    <asp:ListItem Value="11">Salud</asp:ListItem>
                    <asp:ListItem Value="12">Vivienda Multifamiliar</asp:ListItem>
                    <asp:ListItem Value="13">Vivienda Unifamiliar (Plural)</asp:ListItem>
                    <asp:ListItem Value="14">Demolici&#243;n</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 179px; height: 26px;">
                Cantidad de Viviendas:</td>
            <td style="width: 153px; height: 26px;">
                <asp:TextBox ID="txtCantViviendas" runat="server"></asp:TextBox></td>
            <td style="width: 233px; height: 26px;">
                Altura de Construcción:</td>
            <td style="width: 126px; height: 26px;">
                <asp:TextBox ID="txtAlturaConstruccion" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 179px; height: 26px;">
                Cantidad de Dormitorios:</td>
            <td style="width: 153px; height: 26px;">
                <asp:TextBox ID="txtCantDormitorios" runat="server"></asp:TextBox></td>
            <td style="width: 233px; height: 26px;">
                Financiamiento:</td>
            <td style="width: 126px; height: 26px;">
                <asp:DropDownList ID="ddlFinanciamientoPropio" runat="server">
                    <asp:ListItem Value="1">Propio</asp:ListItem>
                    <asp:ListItem Value="2">Prestamo Bancario</asp:ListItem>
                    <asp:ListItem Value="3">Procrear</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 179px">
                Cantidad de Baños:</td>
            <td style="width: 153px">
                <asp:TextBox ID="txtCantBanos" runat="server"></asp:TextBox></td>
            <td style="width: 233px">
                Distancia Transportes en Cuadras.:</td>
            <td style="width: 126px">
                <asp:DropDownList ID="ddlDistanciaTransporte" runat="server">
                    <asp:ListItem Value="1">1 a 5</asp:ListItem>
                    <asp:ListItem Value="2">5 a 10</asp:ListItem>
                    <asp:ListItem Value="3">+ 10</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 179px">
            </td>
            <td colspan="2">
                <asp:Button ID="btnEstadistica" runat="server" OnClick="btnEstadistica_Click" Text="-"
                    Width="360px" /></td>
            <td style="width: 126px">
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblEStadistica" runat="server" ForeColor="#C00000" Text="Label" Visible="False"></asp:Label></td>
        </tr>
    </table></div>
    <asp:ImageButton ID="imbComoCategorizar" runat="server" ImageUrl="~/images/categorizar-obra.png"
        OnClick="imbComoCategorizar_Click" /><br />
    <div style="text-align: left">
        <asp:UpdatePanel id="UpdatePanel1" runat="server">
            <contenttemplate>
<TABLE style="WIDTH: 100%; FONT-FAMILY: Helvetica; TEXT-ALIGN: center" cellSpacing=0 border=1><TBODY><TR><TD style="HEIGHT: 23px" colSpan=8 rowSpan=1>Seleccione la Categoria de Inmueble <asp:DropDownList id="ddlCategoria" runat="server" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" Width="48px" AutoPostBack="True">
                    <asp:ListItem>A</asp:ListItem>
                    <asp:ListItem>B</asp:ListItem>
                    <asp:ListItem>C</asp:ListItem>
                </asp:DropDownList> <asp:DropDownList id="ddlTipo" runat="server" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged" Width="176px" AutoPostBack="True"><asp:ListItem Value="1">Vivienda</asp:ListItem>
<asp:ListItem Value="2">Comercio</asp:ListItem>
<asp:ListItem Value="3">Industria</asp:ListItem>
</asp:DropDownList></TD><TD style="HEIGHT: 23px" colSpan=3 rowSpan=1>Nro cuenta: <asp:Label id="lblNroCuenta" runat="server" Text="Label"></asp:Label>-</TD></TR><TR><TD style="HEIGHT: 23px" colSpan=4 rowSpan=2>-LOGO-</TD><TD style="HEIGHT: 23px" colSpan=4 rowSpan=2>DECLARACION JURADA DE DERECHOS DE CONSTRUCCION DGOP</TD><TD style="HEIGHT: 23px" colSpan=3 rowSpan=2><asp:Label id="lblVivienda" runat="server" Text="Label"></asp:Label> CATEGORIA &nbsp; <asp:Label id="lblcat" runat="server" Text="Label"></asp:Label> $<asp:Label id="lblvalor" runat="server" Text="Label"></asp:Label></TD></TR><TR></TR><TR><TD colSpan=11>-</TD></TR><TR><TD style="HEIGHT: 118px" colSpan=11 rowSpan=3>1- El propietario declara conocer y aceptar los términos de Ordenanzas y Decretos relacionados con la presentación de los planos adjuntos y renuncia expresamente a cualquier reclamo en caso que las construcciones se encuentran fuera del alcance de las normas y no puedan ser incorporadas al catastro municipal.<BR />2- La aceptación por pate del Municipio de la presente declaración jurada y la porterior incorporación al catastro municipal de las construcciones son condición necesaria, pero no suficiente para la Habilitación de comercios y/o para la aprobación de planos de subdivisión por Propiedad Horizontal.</TD></TR><TR></TR><TR></TR><TR><TD style="HEIGHT: 23px" colSpan=6>-</TD><TD style="HEIGHT: 23px" colSpan=2>DERECHOS</TD><TD style="WIDTH: 60px; HEIGHT: 23px">-</TD><TD style="WIDTH: 99px; HEIGHT: 23px">-</TD><TD style="WIDTH: 100px" rowSpan=2>DERECHO SUBTOTAL</TD></TR><TR><TD style="HEIGHT: 23px" colSpan=3>-</TD><TD style="WIDTH: 127px; HEIGHT: 23px">SUPERFICIE</TD><TD style="WIDTH: 100px; HEIGHT: 23px">CATEGORIA</TD><TD style="WIDTH: 147px; HEIGHT: 23px">VALOR OBRA</TD><TD style="WIDTH: 100px; HEIGHT: 23px">TASA</TD><TD style="WIDTH: 121px; HEIGHT: 23px">IMPORTE</TD><TD style="WIDTH: 60px; HEIGHT: 23px">-</TD><TD style="WIDTH: 99px; HEIGHT: 23px">-</TD></TR><TR><TD style="WIDTH: 100px" rowSpan=7>NUEVA</TD><TD style="WIDTH: 114px" rowSpan=2>OBRA NUEVA</TD><TD style="WIDTH: 110px">Cub.</TD><TD style="WIDTH: 127px"><asp:TextBox id="txtObraNuevaCub" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtObraNuevaCub_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblObraNuevaCub" runat="server" Text="1700"></asp:Label></TD><TD style="WIDTH: 147px"><asp:TextBox id="txtValorObraNuevaCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox> </TD><TD style="WIDTH: 100px"><asp:Label id="lblObraNuevaCubTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtImporteObraNuevaCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px">-</TD><TD style="WIDTH: 99px">-</TD><TD style="WIDTH: 100px"><asp:TextBox id="txtSubtotalObraNuevaCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 110px; HEIGHT: 25px">S/Cub.</TD><TD style="WIDTH: 127px; HEIGHT: 25px"><asp:TextBox id="txtObraNuevaSCub" tabIndex=1 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtObraNuevaSCub_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 25px"><asp:Label id="lblObraNuevaSCub" runat="server" Text="1700"></asp:Label></TD><TD style="WIDTH: 147px; HEIGHT: 25px"><asp:TextBox id="txtValorObraNuevaSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 25px"><asp:Label id="lblObraNuevaSCubTasa" runat="server" Text="0,0075"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 25px"><asp:TextBox id="txtImporteObraNuevaSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 25px">-</TD><TD style="WIDTH: 99px; HEIGHT: 25px">-</TD><TD style="WIDTH: 100px; HEIGHT: 25px"><asp:TextBox id="txtSubTotalObraNuevaSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 114px" rowSpan=2>AMPLIACION</TD><TD style="WIDTH: 110px">Cub.</TD><TD style="WIDTH: 127px"><asp:TextBox id="txtAmpliacionCub" tabIndex=2 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtAmpliacionCub_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblAmpliacionCub" runat="server" Text="1700"></asp:Label></TD><TD style="WIDTH: 147px"><asp:TextBox id="txtValorAmpliacionCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblAmpliacionCubTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtImporteAmpliacionCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px">-</TD><TD style="WIDTH: 99px">-</TD><TD style="WIDTH: 100px"><asp:TextBox id="txtSubTotalAmpliacionCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 110px; HEIGHT: 28px">S/Cub.</TD><TD style="WIDTH: 127px; HEIGHT: 28px"><asp:TextBox id="txtAmpliacionSCub" tabIndex=3 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtAmpliacionSCub_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 28px"><asp:Label id="lblAmpliacionSCub" runat="server" Text="1700"></asp:Label></TD><TD style="WIDTH: 147px; HEIGHT: 28px"><asp:TextBox id="txtValorAmpliacionSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 28px"><asp:Label id="lblAmpliacionSCubTasa" runat="server" Text="0,0075"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 28px"><asp:TextBox id="txtImporteAmpliacionSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 28px">-</TD><TD style="WIDTH: 99px; HEIGHT: 28px">-</TD><TD style="WIDTH: 100px; HEIGHT: 28px"><asp:TextBox id="txtSubTotalAmpliacionSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 114px; HEIGHT: 28px">DEMOLICION</TD><TD style="WIDTH: 110px; HEIGHT: 28px">-</TD><TD style="WIDTH: 127px; HEIGHT: 28px">-</TD><TD style="WIDTH: 100px; HEIGHT: 28px">-</TD><TD style="WIDTH: 147px; HEIGHT: 28px"><asp:TextBox id="txtValorDemolicion" tabIndex=4 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorDemolicion_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 28px"><asp:Label id="lblDemolicionTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 28px"><asp:TextBox id="txtImporteDemolicion" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 28px">-</TD><TD style="WIDTH: 99px; HEIGHT: 28px">-</TD><TD style="WIDTH: 100px; HEIGHT: 28px"><asp:TextBox id="txtSubTotalDemolicion" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 114px">MODIFICACION<BR />INTERNA</TD><TD style="WIDTH: 110px">-</TD><TD style="WIDTH: 127px">-</TD><TD style="WIDTH: 100px">-</TD><TD style="WIDTH: 147px"><asp:TextBox id="txtValorModificacionInterna" tabIndex=5 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorModificacionInterna_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblModificacionInternaTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtImporteModificionInterna" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px">-</TD><TD style="WIDTH: 99px">-</TD><TD style="WIDTH: 100px"><asp:TextBox id="txtSubTotalModificionInterna" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 114px">NATATORIO</TD><TD style="WIDTH: 110px">-</TD><TD style="WIDTH: 127px">Minimo</TD><TD style="WIDTH: 100px">3350</TD><TD style="WIDTH: 147px"><asp:TextBox id="txtValorPileta" tabIndex=6 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorPileta_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblPiletaTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtimportePileta" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px">-</TD><TD style="WIDTH: 99px">-</TD><TD style="WIDTH: 100px"><asp:TextBox id="txtSubTotalPileta" runat="server" Width="56px" OnTextChanged="txtSubTotalPileta_TextChanged" Enabled="False">0</asp:TextBox></TD></TR><TR><TD colSpan=11>-</TD></TR><TR><TD style="HEIGHT: 3px" colSpan=6>-</TD><TD style="HEIGHT: 3px" colSpan=2>DERECHO</TD><TD style="HEIGHT: 3px" colSpan=2>RECARGO</TD><TD style="WIDTH: 100px" rowSpan=2>DERECHO SUBTOTAL</TD></TR><TR><TD style="HEIGHT: 42px" colSpan=3>-</TD><TD style="WIDTH: 127px; HEIGHT: 42px">SUPERFICIE</TD><TD style="WIDTH: 100px; HEIGHT: 42px">CATEGORIA</TD><TD style="WIDTH: 147px; HEIGHT: 42px">VALOR OBRA</TD><TD style="WIDTH: 100px; HEIGHT: 42px">TASA</TD><TD style="WIDTH: 121px; HEIGHT: 42px">IMPORTE</TD><TD style="WIDTH: 60px; HEIGHT: 42px">TASA</TD><TD style="WIDTH: 99px; HEIGHT: 42px">IMPORTE</TD></TR><TR><TD style="WIDTH: 100px" rowSpan=7>EXISTENTE</TD><TD style="WIDTH: 114px" rowSpan=2>SUBSISTENCIA</TD><TD style="WIDTH: 110px; HEIGHT: 23px">Cub.</TD><TD style="WIDTH: 127px; HEIGHT: 23px"><asp:TextBox id="txtsubsistenciaCub" tabIndex=7 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtsubsistenciaCub_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 23px"><asp:Label id="lblsubsistenciaCub" runat="server" Text="1700"></asp:Label></TD><TD style="WIDTH: 147px; HEIGHT: 23px"><asp:TextBox id="txtValorSubsistenciaCub" runat="server" Width="56px" OnTextChanged="txtValorSubsistenciaCub_TextChanged" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 23px"><asp:Label id="lblSubsistenciaCubTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 23px"><asp:TextBox id="txtImporteSubsistenciaCub" runat="server" Width="48px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 23px"><asp:Label id="lblSubsistenciaCubTasaRecargo" runat="server" Text="0,5"></asp:Label></TD><TD style="WIDTH: 99px; HEIGHT: 23px"><asp:TextBox id="txtRecargoSubsistenciaCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 23px"><asp:TextBox id="txtExistenteSubtotalObraNuevaCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 110px">S/Cub.</TD><TD style="WIDTH: 127px"><asp:TextBox id="txtSubsistenciaSCub" tabIndex=8 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtSubsistenciaSCub_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblSubsistenciaSCub" runat="server" Text="1700"></asp:Label></TD><TD style="WIDTH: 147px"><asp:TextBox id="txtValorSubsistenciaSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblSubsistenciaSCubTasa" runat="server" Text="0,0075"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtImporteSubsistenciaSCub" runat="server" Width="48px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px"><asp:Label id="lblSubsistenciaSCubTasaRecargo" runat="server" Text="0,5"></asp:Label></TD><TD style="WIDTH: 99px"><asp:TextBox id="txtRecargoSubsistenciaSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px"><asp:TextBox id="txtExistenteSubTotalObraNuevaSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 114px" rowSpan=2>CONFORME OBRA</TD><TD style="WIDTH: 110px; HEIGHT: 28px">Cub.</TD><TD style="WIDTH: 127px; HEIGHT: 28px"><asp:TextBox id="txtConformeObraCub" tabIndex=9 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtConformeObraCub_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 28px"><asp:Label id="lblConformeObraCub" runat="server" Text="1700"></asp:Label></TD><TD style="WIDTH: 147px; HEIGHT: 28px"><asp:TextBox id="txtValorConformeObraCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 28px"><asp:Label id="lblConformeObraCubTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 28px"><asp:TextBox id="txtImporteConformeObraCub" runat="server" Width="48px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 28px"><asp:Label id="lblConformeObraCubTasaRecargo" runat="server" Text="0,5"></asp:Label></TD><TD style="WIDTH: 99px; HEIGHT: 28px"><asp:TextBox id="txtRecargoConformeObraCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px; HEIGHT: 28px"><asp:TextBox id="txtExistenteSubTotalAmpliacionCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 110px">S/Cub.</TD><TD style="WIDTH: 127px"><asp:TextBox id="txtConformeObraSCub" tabIndex=10 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtConformeObraSCub_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblConformeObraSCub" runat="server" Text="1700"></asp:Label></TD><TD style="WIDTH: 147px"><asp:TextBox id="txtValorConformeObraSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblConformeObraSCubTasa" runat="server" Text="0,0075"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtImporteConformeObraSCub" runat="server" Width="48px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px"><asp:Label id="lblConformeObraSCubTasaRecargo" runat="server" Text="0,5"></asp:Label></TD><TD style="WIDTH: 99px"><asp:TextBox id="txtRecargoConformeObraSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px"><asp:TextBox id="txtExistenteSubTotalAmpliacionSCub" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 114px">DEMOLICION</TD><TD style="WIDTH: 110px">-</TD><TD style="WIDTH: 127px">-</TD><TD style="WIDTH: 100px">-</TD><TD style="WIDTH: 147px"><asp:TextBox id="txtValorExistenteDemolicion" tabIndex=11 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorExistenteDemolicion_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblExistenteDemolicionTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtImporteExistenteDemolicion" runat="server" Width="48px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px"><asp:Label id="lblExistenteDemolicionTasaRecargo" runat="server" Text="0,5"></asp:Label></TD><TD style="WIDTH: 99px"><asp:TextBox id="txtRecargoExistenteDemolicion" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px"><asp:TextBox id="txtExistenteSubTotalDemolicion" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 114px">MODIFICACION INTERNA</TD><TD style="WIDTH: 110px">-</TD><TD style="WIDTH: 127px">-</TD><TD style="WIDTH: 100px">-</TD><TD style="WIDTH: 147px"><asp:TextBox id="txtValorExistenteModificacionInterna" tabIndex=12 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorExistenteModificacionInterna_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblExistenteModificacionInternaTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtImporteExistenteModificionInterna" runat="server" Width="48px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px"><asp:Label id="lblExistenteModificacionInternaTasaRecargo" runat="server" Text="0,5"></asp:Label></TD><TD style="WIDTH: 99px"><asp:TextBox id="txtRecargoExistenteModificionInterna" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px"><asp:TextBox id="txtExistenteSubTotalModificionInterna" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 114px">NATATORIO</TD><TD style="WIDTH: 110px">-</TD><TD style="WIDTH: 127px">Minimo$</TD><TD style="WIDTH: 100px">3350</TD><TD style="WIDTH: 147px"><asp:TextBox id="txtValorExistentePileta" tabIndex=13 runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorExistentePileta_TextChanged" BackColor="#FFFFC0"></asp:TextBox></TD><TD style="WIDTH: 100px"><asp:Label id="lblExistentePiletaTasa" runat="server" Text="0,0150"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtimporteExistentePileta" runat="server" Width="48px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 60px"><asp:Label id="lblExistentePiletaTasaRecargo" runat="server" Text="0,5"></asp:Label></TD><TD style="WIDTH: 99px"><asp:TextBox id="txtRecargoExistentePileta" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD><TD style="WIDTH: 100px"><asp:TextBox id="txtExistenteSubTotalPileta" runat="server" Width="56px" Enabled="False">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px"></TD><TD style="WIDTH: 114px"></TD><TD style="WIDTH: 110px"></TD><TD style="WIDTH: 127px"></TD><TD style="WIDTH: 100px"></TD><TD style="WIDTH: 147px"></TD><TD style="WIDTH: 100px"></TD><TD style="WIDTH: 121px"></TD><TD style="WIDTH: 60px"></TD><TD style="WIDTH: 99px"></TD><TD style="WIDTH: 100px"></TD></TR><TR><TD>-</TD><TD>-</TD><TD style="WIDTH: 110px">-</TD><TD style="WIDTH: 127px">-</TD><TD>-</TD><TD>-</TD><TD colSpan=2>DERECHOS</TD><TD colSpan=2>-</TD><TD rowSpan=2>DERECHO SUBTOTAL</TD></TR><TR><TD>-</TD><TD>-</TD><TD style="WIDTH: 110px">-</TD><TD style="WIDTH: 127px">-</TD><TD>-</TD><TD>VALOR OBRA</TD><TD>TASA</TD><TD style="WIDTH: 121px">IMPORTE</TD><TD style="WIDTH: 60px">-</TD><TD>-</TD></TR><TR><TD rowSpan=11>ESPECIAL</TD><TD rowSpan=2>CONSTRUCCION ESPECIAL</TD><TD style="WIDTH: 110px; HEIGHT: 14px">Cub.</TD><TD style="WIDTH: 127px; HEIGHT: 14px">-</TD><TD style="HEIGHT: 14px">-</TD><TD style="HEIGHT: 14px"><asp:TextBox id="txtValorEspecialCub" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorEspecialCub_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w1"></asp:TextBox></TD><TD style="HEIGHT: 14px"><asp:Label id="lblEspecialCubTasa" runat="server" Text="0,0150" __designer:wfdid="w11"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 14px"><asp:TextBox id="txtEspecialCubImporte" runat="server" Width="56px" Enabled="False" __designer:wfdid="w21">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 14px">-</TD><TD style="HEIGHT: 14px">-</TD><TD style="HEIGHT: 14px"><asp:TextBox id="txtEspecialCubSubtotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w29">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 110px; HEIGHT: 23px">S/Cub.</TD><TD style="WIDTH: 127px; HEIGHT: 23px">-</TD><TD style="HEIGHT: 23px">-</TD><TD style="HEIGHT: 23px"><asp:TextBox id="txtValorEspecialScub" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorEspecialScub_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w2"></asp:TextBox></TD><TD style="HEIGHT: 23px"><asp:Label id="lblEspecialScubTasa" runat="server" Text="0,0150" __designer:wfdid="w12"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 23px"><asp:TextBox id="txtEspecialScubImporte" runat="server" Width="56px" Enabled="False" __designer:wfdid="w22">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 23px">-</TD><TD style="HEIGHT: 23px">-</TD><TD style="HEIGHT: 23px"><asp:TextBox id="txtEspecialScubSubtotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w30">0</asp:TextBox></TD></TR><TR><TD rowSpan=4>FONDO ESPECIAL PARA VIVIENDA</TD><TD style="WIDTH: 110px; HEIGHT: 23px">Multifamiliar</TD><TD style="WIDTH: 127px; HEIGHT: 23px">-</TD><TD style="HEIGHT: 23px">-</TD><TD style="HEIGHT: 23px"><asp:TextBox id="txtValorMultifamiliar" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorMultifamiliar_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w3"></asp:TextBox></TD><TD style="HEIGHT: 23px"><asp:Label id="lblMultifamiliarTasa" runat="server" Text="0,0300" __designer:wfdid="w13"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 23px"><asp:TextBox id="txtMultifamiliarImporte" runat="server" Width="56px" Enabled="False" __designer:wfdid="w23">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 23px">-</TD><TD style="HEIGHT: 23px">-</TD><TD style="HEIGHT: 23px"><asp:TextBox id="txtMultifamiliarSubtotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w31">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 110px; HEIGHT: 28px">Galerias</TD><TD style="WIDTH: 127px; HEIGHT: 28px">-</TD><TD style="HEIGHT: 28px">-</TD><TD style="HEIGHT: 28px"><asp:TextBox id="txtValorGalerias" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorGalerias_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w4"></asp:TextBox></TD><TD style="HEIGHT: 28px"><asp:Label id="lblGaleriasTasa" runat="server" Text="0,0200" __designer:wfdid="w14"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 28px"><asp:TextBox id="txtGaleriasImporte" runat="server" Width="56px" Enabled="False" __designer:wfdid="w24">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 28px">-</TD><TD style="HEIGHT: 28px">-</TD><TD style="HEIGHT: 28px"><asp:TextBox id="txtGaleriasSubtotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w32">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 110px">Industria</TD><TD style="WIDTH: 127px">-</TD><TD>-</TD><TD><asp:TextBox id="txtValorIndustria" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorIndustria_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w5"></asp:TextBox></TD><TD><asp:Label id="lblIndustriaTasa" runat="server" Text="0,0250" __designer:wfdid="w15"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtIndustriaImporte" runat="server" Width="56px" Enabled="False" __designer:wfdid="w25">0</asp:TextBox></TD><TD style="WIDTH: 60px">-</TD><TD>-</TD><TD><asp:TextBox id="txtIndustriaSubtotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w33">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 110px">Emprendimientos Urbanos</TD><TD style="WIDTH: 127px">-</TD><TD>-</TD><TD><asp:TextBox id="txtValorEmprendimientosUrbanos" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorEmprendimientosUrbanos_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w6"></asp:TextBox></TD><TD><asp:Label id="lblEmprendimientosUrbanosTasa" runat="server" Text="0,0100" __designer:wfdid="w16"></asp:Label></TD><TD style="WIDTH: 121px"><asp:TextBox id="txtEmprendimientosUrbanosImporte" runat="server" Width="56px" Enabled="False" __designer:wfdid="w26">0</asp:TextBox></TD><TD style="WIDTH: 60px">-</TD><TD>-</TD><TD><asp:TextBox id="txtEmprendimientosUrbanosSubtotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w34">0</asp:TextBox></TD></TR><TR><TD rowSpan=2>TASA AMBIENTAL POR GENERACION RESIDUOS ARIDOS Y AFINES</TD><TD style="WIDTH: 110px; HEIGHT: 24px">Cub.</TD><TD style="WIDTH: 127px; HEIGHT: 24px"><asp:TextBox id="txtValorAmbientalCub" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorAmbientalCub_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w7"></asp:TextBox></TD><TD style="HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px"><asp:Label id="lblAmbientalCubTasa" runat="server" Text="20" __designer:wfdid="w17"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 24px"><asp:TextBox id="txtAmbientalCubImporte" runat="server" Width="56px" Enabled="False" __designer:wfdid="w27">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px"><asp:TextBox id="txtAmbientalCubSubtotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w35">0</asp:TextBox></TD></TR><TR><TD style="WIDTH: 110px; HEIGHT: 24px">S/Cub.</TD><TD style="WIDTH: 127px; HEIGHT: 24px"><asp:TextBox id="txtValorAmbientalScub" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtValorAmbientalScub_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w8"></asp:TextBox></TD><TD style="HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px"><asp:Label id="lblAmbientalScubTasa" runat="server" Text="10" __designer:wfdid="w18"></asp:Label></TD><TD style="WIDTH: 121px; HEIGHT: 24px"><asp:TextBox id="txtAmbientalScubImporte" runat="server" Width="56px" Enabled="False" __designer:wfdid="w28">0</asp:TextBox></TD><TD style="WIDTH: 60px; HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px"><asp:TextBox id="txtAmbientalScubSubtotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w36">0</asp:TextBox></TD></TR><TR><TD style="HEIGHT: 24px">CANCHA TENIS</TD><TD style="WIDTH: 110px; HEIGHT: 24px">-</TD><TD style="WIDTH: 127px; HEIGHT: 24px"><asp:TextBox id="txtCanchaTenis" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtCanchaTenis_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w3"></asp:TextBox></TD><TD style="HEIGHT: 24px">1600</TD><TD style="HEIGHT: 24px"><asp:TextBox id="txtCanchaTenisValor" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtCanchaTenisValor_TextChanged" Enabled="False" __designer:wfdid="w5">0</asp:TextBox></TD><TD style="HEIGHT: 24px">-</TD><TD style="WIDTH: 121px; HEIGHT: 24px">-</TD><TD style="WIDTH: 60px; HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px"><asp:TextBox id="txtCanchaTenisValorTotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w7">0</asp:TextBox></TD></TR><TR><TD style="HEIGHT: 24px">CANCHA PADDLE</TD><TD style="WIDTH: 110px; HEIGHT: 24px">-</TD><TD style="WIDTH: 127px; HEIGHT: 24px"><asp:TextBox id="txtCanchapaddle" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtCanchapaddle_TextChanged" BackColor="#FFFFC0" __designer:wfdid="w4"></asp:TextBox></TD><TD style="HEIGHT: 24px">1050</TD><TD style="HEIGHT: 24px"><asp:TextBox id="txtCanchapaddleValor" runat="server" Width="56px" ForeColor="Black" AutoPostBack="True" OnTextChanged="txtCanchapaddleValor_TextChanged" Enabled="False" __designer:wfdid="w6">0</asp:TextBox></TD><TD style="HEIGHT: 24px">-</TD><TD style="WIDTH: 121px; HEIGHT: 24px">-</TD><TD style="WIDTH: 60px; HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px">-</TD><TD style="HEIGHT: 24px"><asp:TextBox id="txtCanchapaddleValorTotal" runat="server" Width="56px" Enabled="False" __designer:wfdid="w8">0</asp:TextBox></TD></TR><TR><TD style="HEIGHT: 23px"></TD><TD style="WIDTH: 110px; HEIGHT: 23px"></TD><TD style="WIDTH: 127px; HEIGHT: 23px"></TD><TD style="HEIGHT: 23px"></TD><TD style="HEIGHT: 23px"></TD><TD style="HEIGHT: 23px"></TD><TD style="WIDTH: 121px; HEIGHT: 23px"></TD><TD style="WIDTH: 60px; HEIGHT: 23px"></TD><TD style="HEIGHT: 23px"></TD><TD style="HEIGHT: 23px"></TD></TR><TR><TD style="HEIGHT: 11px" colSpan=10>TOTAL A PAGAR PESOS </TD><TD style="HEIGHT: 11px"><asp:TextBox id="txtTotalPagar" runat="server" Width="56px" Enabled="False"></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 40px" colSpan=11><asp:Button id="btnContinuar" onclick="btnContinuar_Click" runat="server" Text="CONTINUAR CON LA LIQUIDACIÓN" __designer:wfdid="w2"></asp:Button> <asp:Label id="lblmensaje" runat="server" __designer:dtid="562949953421358" Text="-" Visible="False" ForeColor="#C00000" __designer:wfdid="w3" Font-Bold="True" Font-Size="Large"></asp:Label><BR /><asp:Button id="BtnLiquidar" onclick="BtnLiquidar_Click" runat="server" Text="LIQUIDAR PAGO" Visible="False"></asp:Button></TD></TR></TBODY></TABLE>&nbsp; <asp:Button id="Button1" onclick="Button1_Click1" runat="server" Text="Button" Visible="False" __designer:wfdid="w39"></asp:Button> 
</contenttemplate>
                    </asp:UpdatePanel>&nbsp;<br />
        &nbsp;</div>
    &nbsp;&nbsp;
    

</asp:Content>
