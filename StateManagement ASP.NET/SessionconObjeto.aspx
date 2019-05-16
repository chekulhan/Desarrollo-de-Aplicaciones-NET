<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionconObjeto.aspx.cs" Inherits="GestiondeEstado.SessionconObjeto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Nombre<asp:TextBox ID="txtNombre" runat="server"></asp:TextBox><br />
            Edad<asp:TextBox ID="txtEdad" runat="server"></asp:TextBox>
            <asp:Button ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" /><br />

        </div>
    </form>
</body>
</html>
