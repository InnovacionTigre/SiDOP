using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using MessagingToolkit.QRCode;
using MessagingToolkit.QRCode.Codec;
using System.Drawing;

public partial class QR : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string URL = url.Text;
        string ruta = Server.MapPath("Archivos/qr2.png");
        QRCodeEncoder encoder = new QRCodeEncoder();
        Bitmap qrcode = encoder.Encode(URL);
        qrcode.Save(ruta);       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {   
        ScriptManager.RegisterStartupScript(this.Page, GetType(), "mostrar", "OpenConfirm('Esta seguro');", true);
    }    
}
