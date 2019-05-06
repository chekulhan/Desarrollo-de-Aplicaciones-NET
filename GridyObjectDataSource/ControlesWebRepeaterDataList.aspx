<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlesWebRepeaterDataList.aspx.cs" Inherits="WebApplication5.ControlesWebRepeaterDataList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName = "WebApplication5.BooksBLL" SelectMethod = "getBooks"></asp:ObjectDataSource>
            

            Data List Control - por defecto, dibuja un elemento TABLE de HTML
            <br /> Inspeccionar el codigo HTML para ver las diferencias con RepeatDirection y RepeatLayout
            <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" BorderWidth="1pt" RepeatColumns="3" RepeatDirection="Horizontal"  RepeatLayout="Table">
           
                <HeaderTemplate>
                    <tr>
                        <td>Name </td>
                        <td>Author </td>
                        <td>my ISBN </td>
                    </tr>
                </HeaderTemplate>
                 <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("BookName") %>' />
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Author") %>' />
                        </td>
                        <td>
                            <asp:Label  runat="server" Text='<%# Eval("ISBN") %>' />
                        </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                   
                </FooterTemplate>
              

               

                <SeparatorTemplate>
                    ----
                </SeparatorTemplate>
              

               

            </asp:DataList>

            <br />
            <br />

            Repeater Control con HTML - no tiene que ser una TABLA
            <ul>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
                
                 <ItemTemplate>
                        <li><%# Eval("BookName") %></li>
                        <li><%# Eval("Author") %></li>
                        <li><%# Eval("ISBN") %></li> 
                </ItemTemplate>

            </asp:Repeater>
            </ul>


            Repeater Control con HTML TABLE
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource1">
             <HeaderTemplate>
                    <table cellspacing="0" border="1">
                        <tr>
                            <th scope="col" style="width: 80px">
                                Nombre
                            </th>
                            <th scope="col" style="width: 120px">
                                Autor
                            </th>
                            <th scope="col" style="width: 100px">
                                ISBN
                            </th>
                        </tr>
                </HeaderTemplate>
                 <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("BookName") %>' />
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Author") %>' />
                        </td>
                        <td>
                            <asp:Label  runat="server" Text='<%# Eval("ISBN") %>' />
                        </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
             </asp:Repeater>
        </div>
    </form>
</body>
</html>
