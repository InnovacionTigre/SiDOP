<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="copiaFielPlano.aspx.cs" Inherits="copiaFielPlano" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
iniciar();
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
  

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
    &nbsp; &nbsp;&nbsp;&nbsp;<br />
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    &nbsp;
        <script type="text/javascript">
   function otroTag(url){
    window.open(url,'');
   // window.open(url);
    return false;
}
</script>
    <div style="text-align:center" >
    <asp:Panel ID="Panel1" runat="server" Height="150px" style="font-family: Helvetica">
        <p>
            <span style="font-size: 26px; color: #7d0506;font-family: Helvetica;"><b>SR. PROPIETARIO - PEDIDO DE COPIA DE
                PLANO.</b></span></p>
        <p>
            <span style="font-size: 16px; color: #7d0506; font-family: Helvetica;"><b></b> Para solicitar copia fiel del plano debe , previamente, abonar
                    el costo correspondiente. Una vez realizado este paso presentarse en el municipio
                    con el comprobante de pago.</span></p>
        <table style="left: 504px; margin: 0px auto; top: 776px; align: center">
            <tr>
                <td rowspan="5" style="width: 100px">
                    <asp:Image ID="Image1" runat="server" Height="176px" ImageUrl="~/img/profesional.jpg"
                        Width="152px" /></td>
                <td style="width: 120px">
                    <asp:Label ID="lblUsuario" runat="server" Text="Nro de Documento del Propietario:"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox></td>
                <td rowspan="4" style="width: 0px">
                </td>
            </tr>
            <tr>
                <td style="width: 120px; height: 26px">
                    <asp:Label ID="lblMail" runat="server" Text="Dirección de E-Mail:"></asp:Label></td>
                <td style="width: 100px; height: 26px">
                    <asp:TextBox ID="txtMail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 120px; height: 42px">
                    Tipo de Copia:</td>
                <td style="width: 100px; height: 42px; text-align: center">
                    <asp:RadioButton ID="rb1" runat="server" GroupName="g1" Style="text-align: left"
                        Text="Físico Autentificado (Papel)" Width="232px" />
                    <asp:RadioButton ID="rbDitigal" runat="server" GroupName="g1" Style="text-align: left"
                        Text="Digital (Electrónico)" Width="232px" /></td>
            </tr>
            <tr>
                <td style="width: 120px">
                </td>
                <td style="width: 100px; text-align: center">
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/copia-plano.png" OnClick="ImageButton1_Click" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblMensaje" runat="server" Font-Size="Large" ForeColor="DarkRed" Text="Label"
                        Visible="False"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
        <br />
        <br />
        <br />
  </div>
    

</asp:Content>
