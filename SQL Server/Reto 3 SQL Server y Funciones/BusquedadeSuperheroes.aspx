<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusquedadeSuperheroes.aspx.cs" Inherits="SuperHeroes.BusequedadeSuperheroes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Selected="True">Masculino</asp:ListItem>
            <asp:ListItem>Feminino</asp:ListItem>
        </asp:DropDownList>

         <asp:button id="btnBuscar" Text="Buscar"   runat="server" onclick="btnBuscar_Click" />

        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" connectionstring="<%$ connectionStrings:SQLConnectString %>" 
            selectcommand="SELECT * FROM dbo.fnc_MostrarSuperHeroes(@Genero);">
            <selectparameters>
              <asp:controlparameter name="Genero" controlid="DropDownList1" propertyname="SelectedValue"/>
          </selectparameters>
        </asp:SqlDataSource>


        <asp:GridView ID="GridView1" runat="server" DataSourceID = "SqlDataSource1"></asp:GridView>


        <div>
        </div>
    </form>
</body>
</html>
