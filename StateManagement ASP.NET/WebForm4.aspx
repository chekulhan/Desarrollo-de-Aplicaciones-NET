<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="GestiondeEstado.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hiddenName" runat="server" />
        <asp:HiddenField ID="hiddenEmail" runat="server" />

        <asp:Label ID="lblNombre" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
        <div>
        </div>
    </form>
</body>
</html>
