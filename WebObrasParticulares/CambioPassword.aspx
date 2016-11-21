<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="CambioPassword.aspx.cs" Inherits="CambioPassword" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
        cargardni();
        cargarDatosPersonales();
    }
</script>


<asp:Content ID="PageTitle" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    Web Obras Particulares
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentPlaceHolder" Runat="Server">
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuProfesional ID="DefaultMenuContent" runat="server" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
  

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
    <script type="text/javascript">

   
function otroTag(url){
    window.open(url,'');
   // window.open(url);
    return false;
}


</script>

    <strong><span style="font-size: 20pt; color: #7d0506; font-family: Helvetica">DATOS
        PERSONALES.<br />
    </span></strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<table style="font-family: Helvetica;padding-left:200px;">
        <tr>
            <td style="width: 323px">
                Apellidos:</td>
            <td style="width: 331px">
                <asp:TextBox ID="txtApellido" runat="server" Font-Names="Helvetica" Width="280px"></asp:TextBox></td>
            <td rowspan="6" style="width: 170px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/user.jpg" /></td>
        </tr>
        <tr>
            <td style="width: 323px">
                Nombres:</td>
            <td style="width: 331px">
                <asp:TextBox ID="txtNombre" runat="server" Font-Names="Helvetica" Width="280px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 323px; height: 25px;">
                Telefono:</td>
            <td style="width: 331px; height: 25px;">
                <asp:TextBox ID="txtTelefono" runat="server" Font-Names="Helvetica"
                    Width="280px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 323px">
                Correo electronico:</td>
            <td style="width: 331px">
                <asp:TextBox ID="txtCorreo" runat="server" Font-Names="Helvetica"
                    Width="280px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 323px">
                Dirección:</td>
            <td style="width: 331px">
                <asp:TextBox ID="txtDireccion" runat="server" Font-Names="Helvetica"
                    Width="280px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 21px" colspan="2">
                <asp:Label ID="lblCartelActualizar" runat="server" Font-Bold="True" Font-Names="Helvetica"
                    ForeColor="#FF8080" Text="Label" Visible="False" Width="656px"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="1" style="height: 21px">
            </td>
            <td colspan="3" style="height: 21px">
                <asp:Button ID="btnActualizar" runat="server" Style="vertical-align: middle; text-align: center"
                    Text="Actualizar mis datos"  Width="288px" OnClick="btnActualizar_Click" /></td>
        </tr>
    </table>
    <br />
 <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >CAMBIO DE CONTRASEÑAS.<br />
    </span></strong>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;<table style="font-family: Helvetica;padding-left:200px;">
        <tr>
            <td style="width: 323px">
                Su Numero de Documento:</td>
            <td style="width: 331px">
                <asp:Label ID="lblDocumento" runat="server" Text="Label" Width="288px" Font-Names="Helvetica"></asp:Label></td>
            <td rowspan="5" style="width: 170px">
                <asp:Image ID="imgUser" runat="server" ImageUrl="~/images/user.jpg" /></td>
        </tr>
        <tr>
            <td style="width: 323px">
                Ingrese su clave actual:</td>
            <td style="width: 331px">
                <asp:TextBox ID="txtClaveActual" runat="server" Width="280px" TextMode="Password" Font-Names="Helvetica"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 323px; height: 25px;">
                Ingrese su nueva clave:</td>
            <td style="width: 331px; height: 25px;">
                <asp:TextBox ID="txtNuevaClave" runat="server" Width="280px" TextMode="Password" Font-Names="Helvetica"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 323px">
                Ingrese nuevamente su nueva clave</td>
            <td style="width: 331px">
                <asp:TextBox ID="txtNuevaClave2" runat="server" Width="280px" TextMode="Password" Font-Names="Helvetica"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 21px" colspan="2">
                <asp:Label ID="lblcartel" runat="server" Font-Bold="True" ForeColor="#FF8080" Text="Label"
                    Visible="False" Width="656px" Font-Names="Helvetica"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="1" style="height: 21px">
            </td>
            <td colspan="3" style="height: 21px">
                <asp:Button ID="btnCambiar" runat="server" Style="vertical-align: middle; text-align: center"
                    Text="Cambiar Contraseña" OnClick="btnCambiar_Click" Width="288px" /></td>
        </tr>
    </table>
    <br />
    &nbsp;<br />
    <br />
    <br />
    <asp:ImageButton ID="imgVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imgVolver_Click" />
    

</asp:Content>
