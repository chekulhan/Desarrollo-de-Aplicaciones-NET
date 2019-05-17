<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cookies2.aspx.cs" Inherits="GestiondeEstado.Cookies2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <asp:Label ID="lblColor" runat="server" Text="Deberia cambiar de color"></asp:Label>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblResultado" runat="server" Text="Label"></asp:Label>
        </div>

        <div runat="server" id="mydiv">DIV paa cambiar el color</div>
    </form>
</body>
</html>
