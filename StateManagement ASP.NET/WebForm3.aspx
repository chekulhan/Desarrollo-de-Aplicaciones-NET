<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="GestiondeEstado.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Valor: <asp:Label ID="lblResultados" runat="server" Text="Label"></asp:Label>
            
            
            <asp:HiddenField ID="hiddenName" runat="server" />

            Email<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
    </form>
</body>
</html>
