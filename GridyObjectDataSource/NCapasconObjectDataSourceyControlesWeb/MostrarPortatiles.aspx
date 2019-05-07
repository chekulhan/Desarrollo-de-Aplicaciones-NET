<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarPortatiles.aspx.cs" Inherits="WebNCapas.MostrarPortatiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="WebNCapas.BLL.ProductoMgr" SelectMethod="GetProductos"></asp:ObjectDataSource>
        
        
       <asp:DataList ID="DataList2" runat="server" DataSourceID="ObjectDataSource1"   
        RepeatColumns="5" Width="927px">  
          <ItemTemplate>  
            <asp:Panel ID="Panel1" runat="server">  
              <table height=150>  
               <tr>  
               <td width=”75%” align=”center” style=”color: #FF0000; font-weight: bold”>  
                <asp:ImageButton ID="Image1" runat="server" Width="100px" Height="70px" ImageUrl='<%#Eval("Foto")%>' CommandName="ViewDetails" CommandArgument='<%#Eval("ID") %>' />  
               </td>  
               </tr>  
               <tr>  
               <td>  
               <span style="color:Black;font-weight:bold;">Nombre de Producto</span>  
               <asp:Label ID="lb1" runat ="server" Text='<%#Eval("Nombre") %>' ></asp:Label>  
               </td>  
               </tr>  
               <tr>  
               <td>  
                <span style="color:Black;font-weight:bold;">Detalles</span><br />  
                <asp:Label ID="lbl2" runat="server" Text='<%#Eval("Detalles") %>' ></asp:Label>  
               </td>  
               </tr>  
               <tr>  
               <td>  
               <span style ="color:Black;font-weight:bold">Precio</span>  
                 <asp:Label ID="lbl3" runat ="server" Text='<%#Eval("Precio") %>' ></asp:Label>  
               </td>  
               </tr>  
               <tr>  
               <td>  
                   <asp:LinkButton ID="LinkButton1" runat="server"  PostBackUrl='<%# string.Format("~/ViewDetails.aspx?ID={0}", Eval("ID")) %>'>Mostrar Detalles</asp:LinkButton>
               </td>  
               </tr>  
        </table>  
          </asp:Panel>  
         </ItemTemplate>  
    </asp:DataList> 
          
     
    </form>
</body>
</html>
