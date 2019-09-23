<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadDropDown.aspx.cs" Inherits="WebApplication2.LoadDropDown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList0" runat="server">
            <asp:ListItem Value="1">MS Access</asp:ListItem>
            <asp:ListItem Value="2">SQL Server</asp:ListItem>
            <asp:ListItem Value="3">MySQL</asp:ListItem>
           
        </asp:DropDownList>

        <asp:DropDownList ID="ddlBasedeDatos1" runat="server">
           
        </asp:DropDownList>

        <asp:DropDownList ID="ddlBasedeDatos2" runat="server">
           
        </asp:DropDownList>

        <asp:DropDownList ID="ddlBasedeDatos3" runat="server">
           
        </asp:DropDownList>


        <div>
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />
        </div>
        <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
