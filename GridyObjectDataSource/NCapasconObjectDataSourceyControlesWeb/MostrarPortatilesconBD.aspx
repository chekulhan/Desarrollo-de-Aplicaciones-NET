<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarPortatilesconBD.aspx.cs" Inherits="WebNCapas.MostrarPortatilesconBD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Usando DATASET<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPortatiles" TypeName="WebNCapas.BLL.ProductoMgr" UpdateMethod="UpdateProducto" OnUpdated="ObjectDataSource1_Updated">
                <UpdateParameters>
                    <asp:Parameter Name="ProductoID" Type="Int32" />
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Detalles" Type="String" />
                    <asp:Parameter Name="Precio" Type="Decimal" />
                    <asp:Parameter Name="Disponible" Type="Boolean" />
                </UpdateParameters>
            </asp:ObjectDataSource>
&nbsp;<asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" DataKeyNames="ProductoID" >
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>

        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetProducto" TypeName="WebNCapas.BLL.ProductoMgr">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="pID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="ObjectDataSource3">
            <Fields>
                <asp:BoundField DataField="ProductoID" HeaderText="ProductoID" SortExpression="ProductoID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Detalles" HeaderText="Detalles" SortExpression="Detalles" />
                <asp:BoundField DataField="NombreyDetalles" HeaderText="NombreyDetalles" ReadOnly="True" SortExpression="NombreyDetalles" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                <asp:BoundField DataField="Foto" HeaderText="Foto" SortExpression="Foto" />
                <asp:CheckBoxField DataField="Disponible" HeaderText="Disponible" SortExpression="Disponible" />
            </Fields>
        </asp:DetailsView>




        <div>
            Usando colección de objetos
    
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
                <Columns>
                    <asp:BoundField DataField="ProductoID" HeaderText="ProductoID" SortExpression="ProductoID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Detalles" HeaderText="Detalles" SortExpression="Detalles" />
                    <asp:BoundField DataField="NombreyDetalles" HeaderText="NombreyDetalles" ReadOnly="True" SortExpression="NombreyDetalles" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                    <asp:BoundField DataField="Foto" HeaderText="Foto" SortExpression="Foto" />
                    <asp:CheckBoxField DataField="Disponible" HeaderText="Disponible" SortExpression="Disponible" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetPortatilesconObjectos" TypeName="WebNCapas.BLL.ProductoMgr"></asp:ObjectDataSource>
    </form>
</body>
</html>
