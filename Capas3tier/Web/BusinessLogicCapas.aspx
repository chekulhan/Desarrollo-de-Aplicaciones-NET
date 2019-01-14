<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessLogicCapas.aspx.cs" Inherits="WebApplication1.BusinessLogicCapas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblNum1" runat="server" Text="Numero 1:"></asp:Label>
            <asp:TextBox ID="txtNum1" runat="server" Width="20"></asp:TextBox>
            <br />
            <asp:Label ID="lblNum2" runat="server" Text="Numero 2:"></asp:Label>
            <asp:TextBox ID="txtNum2" runat="server" Width="20"></asp:TextBox>
             <br />
            <asp:Button ID="btnAdd" runat="server" Text="Sumar" OnClick="btnSumar_Click" />
            <asp:Button ID="btnAddconClases" runat="server" Text="Sumar con clases" OnClick="btnSumarconClases_Click" />
            <asp:Button ID="btnBD" runat="server" Text="Sumar con capa de BD" OnClick="btnSumarconCapaBD_Click" />
            <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>



            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Button ID="btnGetDatos" runat="server" Text="Get datos de Base de datos" OnClick="btnGetDatos_Click" />
        </div>
        


        <asp:GridView ID="GridViewUsuarios" runat="server"></asp:GridView>


         <div style="margin: 0px auto; padding-left: 370px; padding-right: 30px;overflow: auto;">  
        <div>  
            <table width="50%">  
                <tr>  
                    <td colspan="2" style="background-color: Green; height: 30px;color: White;" align="center">  
                        Registrar Usuarios  
                    </td>  
                </tr>  
                <tr>  
                    <td> Nombre </td>  
                    <td>  
           <asp:TextBox ID="txtNombre" Width="150px" runat="server"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td>  
                        Dirección </td>  
                    <td>  
            <asp:TextBox ID="txtDireccion" Width="150px" runat="server"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td> Email </td>  
             <td>  
            <asp:TextBox ID="txtEmail" Width="150px" runat="server"></asp:TextBox>  
             </td>  
                </tr>  
                <tr>  
                    <td> Móvil   </td>  
                    <td>  
            <asp:TextBox ID="txtMobile" Width="150px" runat="server"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td align="center" colspan="2">  
                        <asp:Button ID="BtnSave" runat="server" Width="100px" Text="Añadir" OnClick="BtnSaveUser_Click" />  
                    </td>  
                </tr>  
            </table>  
        </div>  
    </div>  
    </form>
</body>
</html>
