<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VetGestionRazas.aspx.cs" Inherits="WebApplication2.IntroVet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Gestión de las Razas</h1>

             <asp:SqlDataSource ID="SqlDataSource1" 						
        ConnectionString="<%$Connectionstrings:DBChe%>" SelectCommand="SELECT * FROM Vet.Razas" UpdateCommand="Update Vet.Razas SET nombre = @nombre, caracteristicas=@caracteristicas WHERE codigoRaza=@codigoRaza"  runat="server">

        <UpdateParameters> 
            <asp:Parameter Name="codigoRaza" />
         </UpdateParameters> 

</asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateEditButton="True" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="true">
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


                 <columns>
                     <asp:templatefield headertext="Type">
                        <itemtemplate>
                             <asp:HyperLink runat="server" NavigateUrl='<%# "VetRazasyAnimales.aspx?raza=" + Eval("codigoRaza")%>' Text="ver">
                        </asp:HyperLink>
                         
                        </itemtemplate>
                      </asp:templatefield>
                    
                    
                 </columns>
             </asp:GridView>

        </div>
    </form>
</body>
</html>
