<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Validation.aspx.cs" Inherits="WebApplication4.Validation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <!-- Validar la edad -->
          Edad:<br />
          <asp:TextBox id="EdadTextBox" runat="server" />
            
          <asp:CompareValidator id="CompareValidator1" 
              runat="server"
              operator="GreaterThan" type="Integer"
              ValuetoCompare="18"
              ControlToValidate="EdadTextBox"
              ErrorMessage="Fecha tiene que ser hoy" />

     
        <!-- Validar la fecha de hoy, no olvides en añadir la fecha de hoy en el Page_Load evento
            HiddenTodayDate.Text = DateTime.Today.ToShortDateString();
            No funciona con un hidden field (<asp:HiddenField ...>
            -->
         Fecha:<br />
          <asp:TextBox id="FechaTextBox" runat="server" />
          <asp:TextBox ID="HiddenTodayDate" runat="server" visible="false"/>
       
          <asp:CompareValidator id="CompareValidator2" 
              runat="server"
              operator="Equal" type="Date"
              ControltoCompare="HiddenTodayDate"
              ControlToValidate="FechaTextBox"
              ErrorMessage="Fecha tiene que ser hoy" />
   



        <!-- Validation Summary -->
           <asp:ValidationSummary  id="ValidationSummary1"   Runat="server" displayMode="List"/>

            <asp:Label  id="lblFirstName"  Text="First Name:"   AssociatedControlID="txtFirstName"    Runat="server" />
            <asp:TextBox   id="txtFirstName"    Runat="server" />
            <asp:RequiredFieldValidator      id="reqFirstName"  Text="(Required)" ErrorMessage="First Name is required"  ControlToValidate="txtFirstName"  Runat="server" />

            <br /><br />

            <asp:Label    id="lblLastName"      Text="Last Name:"       AssociatedControlID="txtLastName"       Runat="server" />
            <asp:TextBox    id="txtLastName"  Runat="server" />
            <asp:RequiredFieldValidator id="reqLastName"  Text="(Required)" ErrorMessage="Last Name is required"   ControlToValidate="txtLastName"   Runat="server" />


         <!-- Regular expression Validator -->
         Email:<br />
          <asp:TextBox id="txtEmail" runat="server" />
        
        <asp:RegularExpressionValidator ID="string" runat="server" ErrorMessage="error de email" ControlToValidate="txtEmail"
             ValidationGroup="string" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> </asp:RegularExpressionValidator>

        <!-- Regular expression Validator -->
         Valor:<br />
          <asp:TextBox id="txtValor" runat="server" />
        
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="error de valor" ControlToValidate="txtValor"
             ValidationGroup="string" ValidationExpression="[0-9]+"> </asp:RegularExpressionValidator>

          <asp:Button id="submitButton" 
              runat="server"
              Text="Submit" 
              OnClick="submitButton_Click" />
        
    </div>
    </form>
</body>
</html>
