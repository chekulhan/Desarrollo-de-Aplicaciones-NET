<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VetRazasyAnimales.aspx.cs" Inherits="WebApplication2.RazasyAnimales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" 						
        ConnectionString="<%$Connectionstrings:DBChe%>" SelectCommand="SELECT * FROM Vet.Razas "  runat="server">
            </asp:SqlDataSource>

            <h1>Administrar Animales</h1>
            <p>Seleccionar Raza:
<asp:DropDownList ID="ddlRazas" runat="server" DataSourceID="SqlDataSource1" DataValueField="codigoRaza" DataTextField="nombre" AutoPostBack="true"></asp:DropDownList>
            </p>

            <asp:SqlDataSource ConnectionString="<%$Connectionstrings:DBChe%>" ID="SqlDataSource2" runat="server" SelectCommand="SELECT * FROM [VET].[animales]where raza = @codigoRaza">

                <selectparameters>
                    <asp:controlparameter name="codigoRaza" controlid="ddlRazas" propertyname="SelectedValue"/>
                </selectparameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
             </asp:GridView>


             
        </div>
    </form>
</body>
</html>
