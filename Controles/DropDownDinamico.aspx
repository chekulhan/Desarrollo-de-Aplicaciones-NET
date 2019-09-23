<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropDownDinamico.aspx.cs" Inherits="WebApplication2.LoadDropDown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       

     
        <asp:DropDownList ID="ddlBasedeDatos1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBasedeDatos1_SelectedIndexChanged">
           
        </asp:DropDownList>

        <asp:DropDownList ID="ddlBasedeDatos2" runat="server">
           
        </asp:DropDownList>


       
        <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
