<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cross1.aspx.cs" Inherits="WebApplication2.Cross1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Nombre<asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        Edad<asp:TextBox ID="txtEdad" runat="server"></asp:TextBox>

        <asp:Button ID="btnSubmit" runat="server" Text="Button" OnClick="btnSubmit_Click" />
    </form>
</body>
</html>
