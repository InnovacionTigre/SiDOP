<%@ Page Language="C#" MasterPageFile="~/design/MasterPageProfesional.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Subir_Archivo.aspx.cs" Inherits="Subir_Archivo" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
        cargarnumero();
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
    &nbsp; &nbsp;&nbsp; &nbsp;
   
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

  function  OpenConfirm(text)
    {
       
          radconfirm("<p><strong>" + text +"</strong>!</p>", 500, 200, "Confirmación"); 
                     
   }
   function confirmCallBackFn(arg)
    {
        radalert("Confirm returned the following result: " + arg);
    }
    function otroTag(url){
    window.open(url,'');
   // window.open(url);
    return false;
}
</script>
 <strong><span style="font-size: 20pt; color: #7d0506;font-family: Helvetica" >SUBIDA DE ARCHIVOS.<br />
    </span></strong>
 <div style="text-align: center;">
    <p><span style="color: #7d0506; font-size: 26px;"><b> 
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Skin="Sunset">
        </telerik:RadWindowManager>
        NUMERO DE CUENTA RELACIONADA: 
        <asp:Label ID="lblCuenta" runat="server" Text="-"></asp:Label></b></span></P>
     <p>
         &nbsp;</p>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <contenttemplate>
<TABLE style="PADDING-LEFT: 250px"><TBODY><TR><TD style="WIDTH: 100px"><asp:Label id="lblOficina" runat="server" Text="Oficina:"></asp:Label></TD><TD style="WIDTH: 109px"><asp:DropDownList id="ddlOficina" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlOficina_SelectedIndexChanged1"><asp:ListItem>Seleccione una oficina</asp:ListItem>
<asp:ListItem>Catastro</asp:ListItem>
<asp:ListItem>Comisi&#243;n</asp:ListItem>
<asp:ListItem>Espacios Publicos</asp:ListItem>
<asp:ListItem>Inspecci&#243;n</asp:ListItem>
<asp:ListItem>Obras Particulares</asp:ListItem>
<asp:ListItem>Tasas</asp:ListItem>
</asp:DropDownList> </TD><TD style="WIDTH: 833px"></TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblSubCarpeta" runat="server" Text="SubCarpeta:"></asp:Label></TD><TD style="WIDTH: 109px"><asp:DropDownList id="ddlSubCarpeta" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSubCarpeta_SelectedIndexChanged"></asp:DropDownList> <asp:CheckBox id="chbAlcance" runat="server" Visible="False" Text="Con Alcance" __designer:wfdid="w3"></asp:CheckBox></TD><TD style="WIDTH: 833px"></TD></TR><TR><TD style="WIDTH: 100px"><asp:Label id="lblArchivo" runat="server" Text="Seleccione un Archivo:" Width="160px"></asp:Label></TD><TD style="WIDTH: 109px"><asp:FileUpload id="oFile" runat="server"></asp:FileUpload><SPAN style="COLOR: #7d0506">&nbsp;max.&nbsp;3MB.</SPAN></TD><TD style="WIDTH: 833px"></TD></TR><TR><TD style="WIDTH: 100px; HEIGHT: 26px"><asp:Label id="lblNombreArchivo" runat="server" Visible="False" Text="Nombre del Archivo:" Width="152px"></asp:Label></TD><TD style="WIDTH: 109px; HEIGHT: 26px"><asp:TextBox id="txtNombreArchivo" runat="server" Visible="False"></asp:TextBox></TD><TD style="WIDTH: 833px; HEIGHT: 26px"></TD></TR><TR><TD style="WIDTH: 100px; HEIGHT: 26px"></TD><TD style="WIDTH: 109px; HEIGHT: 26px"><asp:Button id="btbSubirArchivo" onclick="btbSubirArchivo_Click" runat="server" Text="Subir Archivo" Width="328px"></asp:Button></TD><TD style="WIDTH: 833px; HEIGHT: 26px"></TD></TR><TR><TD colSpan=2><DIV><asp:Label id="lblResult" runat="server" Visible="False" Text="." ForeColor="#C00000" Font-Size="Large" Font-Bold="True"></asp:Label></DIV></TD><TD style="WIDTH: 833px"></TD></TR></TBODY></TABLE><asp:Button id="bntLiquidarMulta" onclick="Button1_Click" runat="server" Visible="False" Text="Continuar" __designer:wfdid="w5"></asp:Button> 
</contenttemplate>
         <Triggers>
            <asp:PostBackTrigger ControlID="btbSubirArchivo" />
        </Triggers>
    </asp:UpdatePanel></div>
    <asp:ImageButton ID="imbVolver" runat="server" ImageUrl="~/images/volver.png" OnClick="imbVolver_Click" />
    
  
</asp:Content>
