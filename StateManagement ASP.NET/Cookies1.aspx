<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cookies1.aspx.cs" Inherits="GestiondeEstado.Cookies1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Color: <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
            <asp:Button ID="btnSaveCookie" runat="server" Text="Guardar Cookie" OnClick="btnSaveCookie_Click" />
        </div>
    </form>
</body>
</html>
