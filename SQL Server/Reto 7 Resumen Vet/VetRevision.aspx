<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VetRevision.aspx.cs" Inherits="WebApplication2.VetRevision" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Revisiones</h1>
            <p>Seleccionar un cliente existente para introducir sus datos de revision.</p>
            <asp:SqlDataSource ID="sqlClientes" runat="server" ConnectionString="<%$Connectionstrings:DBChe%>" SelectCommand="SELECT * FROM Vet.Clientes " ></asp:SqlDataSource>
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>Dueño</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlClientes" runat="server" AutoPostBack="true"></asp:DropDownList></asp:TableCell>
                 </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell>Animal</asp:TableCell><asp:TableCell>
                        <asp:DropDownList ID="ddlAnimales" runat="server"></asp:DropDownList></asp:TableCell>
                 </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Fecha</asp:TableCell><asp:TableCell><asp:Label ID="lblFecha" runat="server" Text="fecha hoy por defecto"></asp:Label></asp:TableCell>
                </asp:TableRow>  
                
                <asp:TableRow>
                    <asp:TableCell>Datos</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtDatos" runat="server"></asp:TextBox></asp:TableCell>
                  </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell>Precio</asp:TableCell>
                        <asp:TableCell><asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox></asp:TableCell>
                 </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnInsertar" runat="server" Text="Insertar nueva revision" OnClick="btnInsertar_Click" />
                  </asp:TableCell>
                 </asp:TableRow>
            </asp:Table>

        </div>
    </form>
</body>
</html>
