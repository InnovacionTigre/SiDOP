<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MuestraPlanchetas.aspx.vb" Inherits="MuestraPlanchetas" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:radscriptmanager id="RadScriptManager1" runat="server"></telerik:radscriptmanager>
    <div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceMuni1" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Cuenta" HeaderText="Cuenta" ReadOnly="True" SortExpression="Cuenta" />
                <asp:BoundField DataField="Nomenclatura_Completa" HeaderText="Nomenclatura_Completa"
                    ReadOnly="True" SortExpression="Nomenclatura_Completa" />
                <asp:BoundField DataField="Nomenclatura_Circunscripcion" HeaderText="Nomenclatura_Circunscripcion"
                    ReadOnly="True" SortExpression="Nomenclatura_Circunscripcion" />
                <asp:BoundField DataField="Nomenclatura_Seccion" HeaderText="Nomenclatura_Seccion"
                    SortExpression="Nomenclatura_Seccion" />
                <asp:BoundField DataField="Nomenclatura_CodigoAmanzanamiento" HeaderText="Nomenclatura_CodigoAmanzanamiento"
                    ReadOnly="True" SortExpression="Nomenclatura_CodigoAmanzanamiento" />
                <asp:BoundField DataField="Nomenclatura_Chacra" HeaderText="Nomenclatura_Chacra"
                    SortExpression="Nomenclatura_Chacra" />
                <asp:BoundField DataField="Nomenclatura_LetraChacra" HeaderText="Nomenclatura_LetraChacra"
                    SortExpression="Nomenclatura_LetraChacra" />
                <asp:BoundField DataField="Nomenclatura_Quinta" HeaderText="Nomenclatura_Quinta"
                    SortExpression="Nomenclatura_Quinta" />
                <asp:BoundField DataField="Nomenclatura_LetraQuinta" HeaderText="Nomenclatura_LetraQuinta"
                    SortExpression="Nomenclatura_LetraQuinta" />
                <asp:BoundField DataField="Nomenclatura_Fraccion" HeaderText="Nomenclatura_Fraccion"
                    SortExpression="Nomenclatura_Fraccion" />
                <asp:BoundField DataField="Nomenclatura_LetraFraccion" HeaderText="Nomenclatura_LetraFraccion"
                    SortExpression="Nomenclatura_LetraFraccion" />
                <asp:BoundField DataField="Nomenclatura_Manzana" HeaderText="Nomenclatura_Manzana"
                    SortExpression="Nomenclatura_Manzana" />
                <asp:BoundField DataField="Nomenclatura_LetraManzana" HeaderText="Nomenclatura_LetraManzana"
                    SortExpression="Nomenclatura_LetraManzana" />
                <asp:BoundField DataField="Nomenclatura_Parcela" HeaderText="Nomenclatura_Parcela"
                    SortExpression="Nomenclatura_Parcela" />
                <asp:BoundField DataField="Nomenclatura_LetraParcela" HeaderText="Nomenclatura_LetraParcela"
                    SortExpression="Nomenclatura_LetraParcela" />
                <asp:BoundField DataField="Nomenclatura_UFuncional" HeaderText="Nomenclatura_UFuncional"
                    ReadOnly="True" SortExpression="Nomenclatura_UFuncional" />
                <asp:BoundField DataField="Nomenclatura_UComplementaria" HeaderText="Nomenclatura_UComplementaria"
                    ReadOnly="True" SortExpression="Nomenclatura_UComplementaria" />
                <asp:BoundField DataField="Inmueble_ClaveWeb" HeaderText="Inmueble_ClaveWeb" SortExpression="Inmueble_ClaveWeb" />
                <asp:BoundField DataField="Inmueble_Contribuyente" HeaderText="Inmueble_Contribuyente"
                    ReadOnly="True" SortExpression="Inmueble_Contribuyente" />
                <asp:BoundField DataField="Inmueble_Calle" HeaderText="Inmueble_Calle" ReadOnly="True"
                    SortExpression="Inmueble_Calle" />
                <asp:BoundField DataField="Inmueble_Altura" HeaderText="Inmueble_Altura" ReadOnly="True"
                    SortExpression="Inmueble_Altura" />
                <asp:BoundField DataField="Inmueble_Piso" HeaderText="Inmueble_Piso" ReadOnly="True"
                    SortExpression="Inmueble_Piso" />
                <asp:BoundField DataField="Inmueble_Depto" HeaderText="Inmueble_Depto" ReadOnly="True"
                    SortExpression="Inmueble_Depto" />
                <asp:BoundField DataField="Inmueble_Localidad" HeaderText="Inmueble_Localidad" ReadOnly="True"
                    SortExpression="Inmueble_Localidad" />
                <asp:BoundField DataField="Inmueble_Barrio" HeaderText="Inmueble_Barrio" SortExpression="Inmueble_Barrio" />
                <asp:BoundField DataField="Deuda_Importe" HeaderText="Deuda_Importe" ReadOnly="True"
                    SortExpression="Deuda_Importe" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceMuni1" runat="server" ConnectionString="<%$ ConnectionStrings:Bd_Munic1ConnectionString %>"
            SelectCommand="SELECT top 10 * FROM [WEBOP_V_AUT_Inmuebles]"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <asp:Label ID="Label1" runat="server" Text='"\\Master\usuarios\graficos\catastro\"'></asp:Label><br />
        <asp:Image ID="Image1" runat="server" /><br />
    </div>
    </form>
</body>
</html>
