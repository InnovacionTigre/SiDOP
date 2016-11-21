<%@ Page Language="C#" MasterPageFile="~/design/MasterPage.master" AutoEventWireup="true" CodeFile="Registracion.aspx.cs" Inherits="Registracion" %>

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

<div style="padding-left:200Px;">
    
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    
Complete el formulario para registrarse
    <asp:Label ID="Label1" runat="server" Text=":"></asp:Label><br />
    <br />
    <asp:UpdatePanel id="UpdatePanel1" runat="server" >
        <contenttemplate>
<asp:Panel id="PanelTable" runat="server"><TABLE style="WIDTH: 408px" id="TableContinuar"><TBODY><TR><TD style="WIDTH: 100px"><asp:Label id="lblNombre" runat="server" Text="Nombre Completo: " Width="144px"></asp:Label> </TD><TD style="WIDTH: 128px"><asp:TextBox id="txtNombre" runat="server"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblApellido" runat="server" Text="Apellido Completo:" Width="136px"></asp:Label> </TD><TD style="WIDTH: 128px"><asp:TextBox id="txtApellido" runat="server"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblNombreUsuario" runat="server" Text="Nombre de Usuario" Width="144px"></asp:Label></TD><TD style="WIDTH: 128px"><asp:TextBox id="txtUsuario" runat="server"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblTipoDocumento" runat="server" Text="Tipo de documento:" Width="144px" __designer:wfdid="w6"></asp:Label></TD><TD style="WIDTH: 128px"><asp:DropDownList id="ddlTipoDocumento" runat="server" __designer:dtid="281474976710676" Width="40px" __designer:wfdid="w5" AutoPostBack="True" Visible="False" Height="8px"><asp:ListItem __designer:dtid="281474976710677">Doc. Nacional de Identidad</asp:ListItem>
<asp:ListItem __designer:dtid="281474976710678">Libreta de Enrolamiento</asp:ListItem>
<asp:ListItem __designer:dtid="281474976710679">Libreta C&#237;vica</asp:ListItem>
</asp:DropDownList><BR />Doc. Nacional de Identidad</TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblNroDocumento" runat="server" Text="Número de Documento:" Width="144px" __designer:wfdid="w7"></asp:Label></TD><TD style="WIDTH: 128px"><asp:TextBox id="txtNumeroDocumento" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w4"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblnroRegistroProfesional" runat="server" Text="Nro Registro Profesional:" Width="144px" __designer:wfdid="w7"></asp:Label></TD><TD style="WIDTH: 128px"><asp:TextBox id="txtNroRegistroProfesional" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w3"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblnroRegistroMunicipal" runat="server" Text="Nro Registro Municipal:" Width="144px" __designer:wfdid="w7"></asp:Label></TD><TD style="WIDTH: 128px"><asp:TextBox id="txtnroRegistroMunicipal" runat="server" __designer:dtid="281474976710683" Width="168px" __designer:wfdid="w4"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblPassword" runat="server" Text="Contraseña:   " Width="136px"></asp:Label></TD><TD style="WIDTH: 128px"><asp:TextBox id="txtPassword" runat="server"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblPasswordRepit" runat="server" Text="Repita la Contraseña:" Width="144px"></asp:Label></TD><TD style="WIDTH: 128px"><asp:TextBox id="txtPasswordRepit" runat="server"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px; HEIGHT: 40px"><asp:Label id="lblMail" runat="server" Text="Dirección de Mail: " Width="128px"></asp:Label></TD><TD style="WIDTH: 128px; HEIGHT: 40px"><asp:TextBox id="txtMail" runat="server" ValidationGroup="Email"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 100px; HEIGHT: 40px"><asp:Label id="lblCod" runat="server" Text="Ingrese el codigo de verificación:" Width="128px" __designer:wfdid="w3"></asp:Label> </TD><TD style="WIDTH: 128px; HEIGHT: 40px"><telerik:RadCaptcha id="RadCaptcha1" __designer:wfdid="w5" EnableTheming="False" ErrorMessage="Ingreso mal el codigo de verificación" Runat="server" Display="Dynamic" CaptchaTextBoxLabel></telerik:RadCaptcha></TD></TR><TR><TD style="WIDTH: 100px; HEIGHT: 40px"></TD><TD style="WIDTH: 128px; HEIGHT: 40px"><asp:TextBox id="txtCodVerificacion" runat="server" __designer:dtid="281474976710699" Width="168px" __designer:wfdid="w2"></asp:TextBox></TD></TR></TBODY></TABLE></asp:Panel>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<BR />&nbsp; 
</contenttemplate>
    </asp:UpdatePanel>&nbsp;
    <asp:Button ID="btbRedirec" runat="server" Text="GO!!" OnClick="Button1_Click" />
    <asp:Button ID="btnRegistrarme" runat="server" OnClick="btnRegistrarme_Click" Text="Registrarme" /><br />
    &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    &nbsp;
       
    <br />
    <cc1:modalpopupextender id="ModalPopupExtender1" runat="server" PopupControlID="PanelLogin" TargetControlID="Label1" BackgroundCssClass="modalBackground"></cc1:modalpopupextender>
    <asp:Panel ID="PanelLogin" runat="server">
        <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4"
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
            ForeColor="#333333" OnAuthenticate="Login1_Authenticate">
            <TextBoxStyle Font-Size="0.8em" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
            <LayoutTemplate>
                <table border="0" cellpadding="4" cellspacing="0" style="border-collapse: collapse">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0">
                                <tr>
                                    <td align="center" colspan="2" style="font-weight: bold; font-size: 0.9em; color: white;
                                        background-color: #5d7b9d">
                                        Iniciar sesión
                                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="Red">X</asp:LinkButton></td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio."
                                            ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                                               
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria."
                                            ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Recordármelo la próxima vez." />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: red">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC"
                                            BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana"
                                            Font-Size="0.8em" ForeColor="#284775" Text="Inicio de sesión" ValidationGroup="Login1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>
    </asp:Panel>
    &nbsp;
</div>
    

</asp:Content>
