Imports System
Imports Microsoft

Partial Class _Default
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Redirect("./index.html")
    End Sub
End Class
