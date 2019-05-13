<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="GestiondeEstado.WebForm2"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Nombre<asp:TextBox ID="txtNombre" runat="server" ></asp:TextBox>
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" />
        </div>
    </form>

</body>
</html>
