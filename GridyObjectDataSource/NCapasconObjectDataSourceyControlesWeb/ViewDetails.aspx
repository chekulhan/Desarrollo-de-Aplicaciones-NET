<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="WebNCapas.ViewDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="WebNCapas.BLL.ProductoMgr" SelectMethod="GetProducto">
                <SelectParameters>
                    <asp:QueryStringParameter Name="pID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1">

                <ItemTemplate>  
                    <table class="table table-bordered table-striped">  
                        <tr>  
                            <td>ID</td>  
                            <td><%#Eval("ID") %></td>  
                        </tr>  
                        <tr>  
                            <td>Nombre</td>  
                            <td><%#Eval("Nombre") %></td>  
                        </tr>  
                        <tr>  
                            <td>Descripcion</td>  
                            <td><%#Eval("Detalles") %></td>  
                        </tr>  
                        <tr>  
                            <td>precio</td>  
                            <td><%#Eval("Precio") %></td>  
                        </tr>  
                        <tr>  
                            <td>Foto</td>  
                            <td>
                             <asp:Image ID="Image1" ImageUrl='<%#Eval("Foto") %>' runat="server" Width="100px" Height="70px" />
                               </td>  
                        </tr>  
                         
                    </table>  
                </ItemTemplate> 

            </asp:FormView>




            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="ObjectDataSource1">
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Detalles" HeaderText="Detalles" SortExpression="Detalles" />

                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                    <asp:BoundField DataField="Foto" HeaderText="Foto" SortExpression="Foto" />
                    
             
                </Fields>
            </asp:DetailsView>

        </div>
    </form>
</body>
</html>
