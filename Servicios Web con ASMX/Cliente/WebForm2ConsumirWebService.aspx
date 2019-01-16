<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2ConsumirWebService.aspx.cs" Inherits="WebApplication1.WebForm2ConsumirWebService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Numero 1: <asp:TextBox ID="txtNum1" runat="server"></asp:TextBox>
            Numero 2: <asp:TextBox ID="txtNum2" runat="server"></asp:TextBox>

            <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnGetWebServicio" runat="server" Text="GetWebServicio" OnClick="btnGetWebServicio_Click" />


        </div>
    </form>
</body>
</html>
