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
using System.Windows.Forms;
using System.Data.SqlClient;
using Telerik.Web.UI;
using System.Net;

public partial class Propietario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void iniciar()
    {
        try
        {
            String variable = "";
            variable = Session["NroCuenta"].ToString();
            FileExplorerObrasParticulares.TreeView.Nodes.Clear();
            FileExplorerObrasParticulares.Configuration.ViewPaths = new String[] { "~/Archivos/" + variable };
            FileExplorerObrasParticulares.Configuration.UploadPaths = new String[] { "~/Archivos/" + variable };
            FileExplorerObrasParticulares.Configuration.DeletePaths = new String[] { "~/Archivos/" + variable };
            Session["cuenta"] = variable;
            borrarCondiciones();
            actualizarArbol();
            }
            catch { }
    }
    protected void borrarCondiciones()
    {
        if (FileExplorerObrasParticulares.Visible == true)
        {
            RadToolBar toolBar = FileExplorerObrasParticulares.ToolBar;          
            int i = 0;
            while (i < toolBar.Items.Count)
            {
                if (toolBar.Items[i].Value == "Delete")
                {
                    toolBar.Items.RemoveAt(i);
                    continue;
                }
                else if (toolBar.Items[i].Value == "Upload")
                {
                    toolBar.Items.RemoveAt(i);
                    continue;
                }
                i++;
            }
        
            RadContextMenu gridContextMenu = FileExplorerObrasParticulares.GridContextMenu;
            i = 0;
            while (i < gridContextMenu.Items.Count)
            {
                if (gridContextMenu.Items[i].Value == "Delete")
                {
                    gridContextMenu.Items.RemoveAt(i);
                    continue;
                }

                else if (gridContextMenu.Items[i].Value == "Upload")
                {
                    gridContextMenu.Items.RemoveAt(i);
                    continue;
                }
                i++;
            }
        }
    } 
    protected void nuevaPagina(string url)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "otroTag('" + url + "');", true);
    }
    protected void actualizarArbol()
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "actualizarfile();", false);      
    } 
    
}
