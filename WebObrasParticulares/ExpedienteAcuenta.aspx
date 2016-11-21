<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ExpedienteAcuenta.aspx.cs" Inherits="ExpedienteAcuenta" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
    <art:DefaultHeader ID="DefaultHeader" runat="server" />
</asp:Content>
<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
    <art:DefaultMenuProfesional ID="DefaultMenuContent" runat="server" Visible="false" />
</asp:Content>

<asp:Content ID="SheetContent" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
  

<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        </telerik:RadScriptManager>
    &nbsp; &nbsp;&nbsp;
   
    <script type="text/javascript">

    function OnClientFileOpen(oExplorer, args) {
     var item = args.get_item();
     var fileExtension = item.get_extension();
 
     var fileDownloadMode = true;
     if ((fileDownloadMode == true) && (fileExtension == "jpg" || fileExtension == "gif" || fileExtension == "pdf" || fileExtension == "dwg" || fileExtension == "doc" || fileExtension == "docx" || fileExtension == "xls" || fileExtension == "xlsx")) {// Download the file
          // File is a image document, do not open a new window
          args.set_cancel(true);
           
          // Tell browser to open file directly
          //var requestImage = "Handler.ashx?path=" + item.get_url();
          var requestImage =  item.get_url();
          if(fileExtension == "dwg"){
          document.location.href="file://10.70.132.21"+ requestImage;}
          else
          {
           window.open(requestImage)
          }
          //document.open=requestImage;
          ////document.location=requestImage;
         
     }
}
</script>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
         <Triggers>
            <asp:PostBackTrigger ControlID="btbSubirArchivo" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click" />
  
</asp:Content>
