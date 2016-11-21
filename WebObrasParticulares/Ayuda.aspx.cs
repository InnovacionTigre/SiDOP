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
using System.Data.SqlClient;
using System.Windows.Forms;
using Telerik.Web.UI;



using System.Globalization;
using System.Threading;


public partial class Ayuda : System.Web.UI.Page
{
 
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void imbVolver_Click(object sender, ImageClickEventArgs e)
    {
        string origen = Request.QueryString["origen"];      
        switch(origen)
        {
            case "1":
                Response.Redirect("./Principal.aspx");
            break;
            case "2":
                Response.Redirect("./ResponsableOP.aspx");
            break;
            case "3":
                Response.Redirect("./DirectorOP.aspx");
                break;
            default:
                Response.Redirect("./Index.html");
                break;           
        }
    }
}
