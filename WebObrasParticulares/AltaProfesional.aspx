<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="AltaProfesional.aspx.cs" Inherits="AltaProfesional" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="Artisteer" %>
<%@ Register TagPrefix="artisteer" Namespace="Artisteer" %>
<%@ Register TagPrefix="art" TagName="DefaultMenuInicio" Src="DefaultMenuInicio.ascx" %> 
<%@ Register TagPrefix="art" TagName="DefaultHeader" Src="DefaultHeader.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        txtNumeroDocumento.Attributes.Add("onKeyPress", "Numeros()");
        txtTelefono.Attributes.Add("onKeyPress", "Numeros()");
    }
</script>

<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuInicio ID="DefaultMenuContent" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">

<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />

<div style="text-align:center; width:1300px;">
    
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>

<h2><span style="color: #7d0506; font-size: 26px; text-align:center;"><b>COMPLETE EL FORMULARIO PARA REGISTRARSE COMO PROFESIONAL</span></h2>
    <asp:Label ID="Label1" runat="server" Text=":"></asp:Label><br />
    <br />
    <asp:UpdatePanel  id="UpdatePanel1" runat="server" >
        <contenttemplate>
<asp:Panel id="PanelTable" runat="server">
<TABLE class="table table-bordered table-condensed" style="width:auto; margin-right: auto; margin-left: auto; BORDER-RIGHT: #660000 thin solid; TABLE-LAYOUT: fixed; PADDING-RIGHT: 2px; BORDER-TOP: #660000 thin solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; margin-top: 2px; margin-bottom: 2px; VERTICAL-ALIGN: middle; BORDER-LEFT: #660000 thin solid; PADDING-TOP: 2px; BORDER-BOTTOM: #660000 thin solid; BORDER-COLLAPSE: collapse; TEXT-ALIGN: left" id="TableContinuar" cellPadding=10 ForeColor="#333333" GridLines="None">
<TBODY>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblNombre" runat="server" Text="Nombre Completo: " Width="144px" __designer:wfdid="w16"></asp:Label> </TD>
<TD><asp:TextBox class="form-control input-sm" id="txtNombre" runat="server" __designer:wfdid="w17"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblApellido" runat="server" Text="Apellido Completo:" Width="136px" __designer:wfdid="w18"></asp:Label> </TD>
<TD><asp:TextBox class="form-control input-sm" id="txtApellido" runat="server" __designer:wfdid="w19"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblTipoDocumento" runat="server" Text="Tipo de documento:" Width="144px" __designer:wfdid="w20"></asp:Label></TD>
<TD>Doc. Nacional de Identidad<asp:DropDownList id="ddlTipoDocumento" runat="server" __designer:dtid="281474976710676" Visible="False" __designer:wfdid="w21" AutoPostBack="True"><asp:ListItem __designer:dtid="281474976710677">Doc. Nacional de Identidad</asp:ListItem></asp:DropDownList></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblNroDocumento" runat="server" Text="Número de Documento:" Width="144px" __designer:wfdid="w22"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtNumeroDocumento" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w23" AutoPostBack="True" OnTextChanged="txtNumeroDocumento_TextChanged" MaxLength="8"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblNombreUsuario" runat="server" Text="Nombre de Usuario" Width="144px" __designer:wfdid="w24"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtUsuario" runat="server" __designer:wfdid="w25" Enabled="False"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblTelefono" runat="server" Text="Telefono:" Width="144px" __designer:wfdid="w26"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtTelefono" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w27"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblDireccion" runat="server" Text="Dirección:" Width="144px" __designer:wfdid="w28"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtDireccion" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w29"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblLocalidad" runat="server" Text="Localidad:" Width="144px"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtLocalidad" runat="server" Width="168px"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblCiudad" runat="server" Text="Ciudad:" Width="144px"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtCiudad" runat="server" Width="168px"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblnroRegistroProfesional" runat="server" Text="Nro Registro Profesional:" Width="144px" __designer:wfdid="w30"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtNroRegistroProfesional" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w31"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblnroRegistroMunicipal" runat="server" Text="Nro Registro Municipal:" Width="144px" __designer:wfdid="w32"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtnroRegistroMunicipal" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w33"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblnroCuentaMunicipal" runat="server" Text="Nro Cuenta Municipal:" Width="144px"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtnroCuentaMunicipal" runat="server" Width="168px"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblNroCuit" runat="server" Text="Nro Cuit:" Width="144px" __designer:wfdid="w34"></asp:Label></TD>
<TD><div class="form-inline"><asp:TextBox  id="txtCuitAnt" runat="server" __designer:dtid="281474976710683" Width="26px" __designer:wfdid="w35" MaxLength="2"></asp:TextBox> -<asp:TextBox  id="txtNroCuit" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w36" MaxLength="8"></asp:TextBox> -<asp:TextBox  id="txtCuitValidador" runat="server" __designer:dtid="281474976710683" Width="35px" __designer:wfdid="w37" MaxLength="1"></asp:TextBox></div><BR />xx-xxxxxxxx-x</TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblTituloHabilitante" runat="server" Text="Titulo Habilitante:" Width="144px" __designer:wfdid="w38"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtTituloHabilitante" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w39"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblCategoria" runat="server" visible="false" Text="Categoria:" Width="144px" __designer:wfdid="w40"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtCategoria" visible="false" text="1" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w41"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblPassword" runat="server" Text="Contraseña:   " Width="136px" __designer:wfdid="w42"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtPassword" runat="server" __designer:wfdid="w43" TextMode="Password"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblPasswordRepit" runat="server" Text="Repita la Contraseña:" Width="144px" __designer:wfdid="w44"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtPasswordRepit" runat="server" __designer:wfdid="w45" TextMode="Password"></asp:TextBox></TD></TR>
<TR><TD style="vertical-align:middle;"><asp:Label id="lblMail" runat="server" Text="Dirección de Mail: " Width="128px" __designer:wfdid="w46"></asp:Label></TD>
<TD><asp:TextBox class="form-control input-sm" id="txtMail" runat="server" __designer:wfdid="w47" ValidationGroup="Email"></asp:TextBox></TD></TR>
<TR><TD colSpan=2>&nbsp;<telerik:RadCaptcha id="RadCaptcha1" CaptchaLinkButtonText="Generar nueva imagen" EnableRefreshImage="True" CaptchaTextBoxLabel="Ingrese el texto que ve en la imagen" Runat="server" ErrorMessage="El texto ingresado es incorrecto" Font-Bold="True"></telerik:RadCaptcha></TD></TR>
<TR><TD></TD>
<TD></TD></TR><TR><TD colSpan=2><asp:Label id="lblCartel" runat="server" Text="Todos los campos son obligatorios" __designer:wfdid="w3" ForeColor="DarkRed"></asp:Label></TD></TR>
</TBODY>
</TABLE>
</asp:Panel><BR />&nbsp; 
</contenttemplate>
    </asp:UpdatePanel>&nbsp;
    <asp:Button ID="btbRedirec" runat="server" Text="GO!!" OnClick="Button1_Click" Visible="False" />
    <asp:Button class="btn btn-danger btn-large" ID="btnRegistrarme" runat="server" OnClick="btnRegistrarme_Click" Text="Registrarse >>" /><br />
    &nbsp;&nbsp; 
</div>
  
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
        if (key<48||key > 57) 
        {
            window.event.keyCode = 0;
        }
   }

function letras() 
{
    var key = window.event.keyCode;
    if (key<48||key > 57) 
    {

    }
    else 
    {
        window.event.keyCode = 0;
    }

} 
    
</script>  

</asp:Content>
