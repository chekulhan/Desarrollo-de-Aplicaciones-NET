<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kanban.aspx.cs" Inherits="WebApplication2.Kanban" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <!-- OJO:AutoPostBack="true" en dropdownlist
        A veces el esquema no aparece en la herramienta grafica
        Enlazar el WHERE clausura de sqldatasource2 con el drop down list (herramienta grafica)
        Añadir DataTextField="Contenedor" DataValueField="IDContenedor" al control drop down list
        Usando SQL Server, cambiar la consulta para usar AS nombre para concatenar mas campos
        -->
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlContenedor" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="Contenedor" DataValueField="IDContenedor"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Che_DevConnectionString %>" SelectCommand="SELECT [IDContenedor], CAST(ProvedorID AS varchar(10))  + ' ' + NombredeProvedor AS  Contenedor FROM Kanban.Contenedores "></asp:SqlDataSource>
        
        </div>

        <div>
       
            <asp:GridView ID="gridTarjetas" runat="server" DataSourceID="SqlDataSource2"></asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Che_DevConnectionString %>" SelectCommand="SELECT * FROM Kanban.Tarjetas WHERE ([IDContenedor] = @IDContenedor)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlContenedor" Name="IDContenedor" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource> 

        </div>
    </form>
</body>
</html>
