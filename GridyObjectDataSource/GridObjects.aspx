<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridObjects.aspx.cs" Inherits="WebApplication1.GridObjects" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            GRID
            
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"  TypeName="WebApplication1.BLL.ProductosMger" SelectMethod="getProductos"></asp:ObjectDataSource>
           

                    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" allowpaging="true"  >
                        <HeaderStyle BackColor="#336699" ForeColor="White" />
                         <pagersettings mode="Numeric" position="Bottom" pagebuttoncount="5"/>
                      
                        <pagerstyle backcolor="LightBlue" height="30px" verticalalign="Bottom"  horizontalalign="Center"/>
                    </asp:GridView>
          

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"  DataSourceMode="DataSet"   ConnectionString="<%$ ConnectionStrings:SQLConnectStringCheDB%>"
          SelectCommand="SELECT * FROM Productos"></asp:SqlDataSource>

            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1" allowpaging="true"     >
                        <HeaderStyle BackColor="#336699" ForeColor="White" />
                         <pagersettings mode="Numeric" position="Bottom" pagebuttoncount="5"/>
                      
                        <pagerstyle backcolor="LightBlue" height="30px" verticalalign="Bottom"  horizontalalign="Center"/>
                    </asp:GridView>

         </div>
    </form>
</body>
</html>
