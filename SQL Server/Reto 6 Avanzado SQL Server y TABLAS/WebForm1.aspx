<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>



</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtLinea" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
        </div>


    </form>
</body>
</html>
