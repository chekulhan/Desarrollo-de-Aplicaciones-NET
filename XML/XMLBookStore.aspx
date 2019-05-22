<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XMLBookStore.aspx.cs" Inherits="GestiondeEstado.XMLBookStore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                <asp:ListItem Value="cooking">Cocina</asp:ListItem>
                <asp:ListItem Value="children">Niños</asp:ListItem>
                <asp:ListItem Value="web">Web</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
            <br />
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/bookstore2.xml"></asp:XmlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="XmlDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="title">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# XPath("title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="author">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# XPath("author") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="year">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# XPath("year") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="price">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# XPath("price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
              
            </asp:GridView>
        </div>
    </form>
</body>
</html>
