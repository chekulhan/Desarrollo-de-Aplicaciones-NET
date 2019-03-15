<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Titulares.aspx.cs" Inherits="BancoPrestamo.Titulares" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:GridView ID="GridView1" DataSourceID="SqlDataSource1" 
        DataKeyNames="IDTitular"  AutoGenerateSelectButton="true" 
        runat="server" />

        <asp:GridView ID="GridView2"  AutoGenerateEditButton="true" 
        DataSourceID="SqlDataSource2"	runat="server">
        </asp:GridView>
   
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 			
        ConnectionString="<%$Connectionstrings:SQLConnectString%>"
        SelectCommand="SELECT * FROM bco.titulares">
        </asp:SqlDataSource> 

        <asp:SqlDataSource ID="SqlDataSource2" 						
        ConnectionString="<%$Connectionstrings:SQLConnectString%>"
        SelectCommand="SELECT * FROM bco.Prestamos Where IDTitular=@IDTitular" 
        UpdateCommand="Update bco.Prestamos SET Importe=@Importe Where IDPrestamo=@IDPrestamo"
        runat="server">

        <SelectParameters>
            <asp:ControlParameter Name="IDTitular" ControlID="GridView1"/>
        </SelectParameters>

         <UpdateParameters> 
              <asp:Parameter Name="Importe" />
              <asp:Parameter Name="IDPrestamo" /> 
          </UpdateParameters> 


        </asp:SqlDataSource>




         </div>
    </form>
</body>
</html>
