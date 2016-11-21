<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QR.aspx.cs" Inherits="QR" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="MessagingToolkit.QRCode" Namespace="MessagingToolkit.QRCode" TagPrefix="Messaging" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<script type="text/javascript">
    function confirmCallBackFn(arg)
    {
        radalert("Confirm returned the following result: " + arg);
    }
     function  OpenConfirm(text)
    {
       return   radconfirm("<p><strong>" + text +"</strong>!</p>", 500, 200, "Confirmación");      
   }
</script>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
        </telerik:RadWindowManager>
    <div>
        <asp:Image ID="qrimagen" runat="server" Height="248px" Width="344px" />
        <asp:ImageMap ID="ImageMap1" runat="server" Width="208px">
        </asp:ImageMap><br />
        &nbsp;<br />
        <asp:TextBox ID="url" runat="server"></asp:TextBox>
        <telerik:RadToolTip ID="RadToolTip1" runat="server" Skin="Sunset" TargetControlID="url" Text="Prueba ">
            prueba de control</telerik:RadToolTip>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
<button onclick="radconfirm('Are you sure?', confirmCallBackFn); return false;">show radconfirm</button> 
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirmr" />
    </form>
</body>
</html>
