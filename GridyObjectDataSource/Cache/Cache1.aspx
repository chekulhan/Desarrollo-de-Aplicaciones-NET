<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cache1.aspx.cs" Inherits="WebNCapas.Cache1" %>
<%@Outputcache VaryByParam="None" Duration="30" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Time (de forma declarativa con el outputcache VaryByParam="None"):<asp:Label ID="lblTime" runat="server" Text="Label"></asp:Label>
  
            <br />

            Fetching: <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPortatiles" EnableCaching="true" CacheDuration="30" OnSelecting="ObjectDataSource1_Selecting" TypeName="WebNCapas.BLL.ProductoMgr" >
            </asp:ObjectDataSource>
&nbsp;<asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" DataKeyNames="ProductoID" >
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            Usando HttpRuntimeCache <br />
            Cache: <asp:Label ID="lblCache" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="btnGetCache" runat="server" Text="Go Cache" OnClick="btnGetCache_Click"/>
        </div>
    </form>
</body>
</html>
