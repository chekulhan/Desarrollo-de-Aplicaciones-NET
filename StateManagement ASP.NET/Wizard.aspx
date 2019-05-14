<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wizard.aspx.cs" Inherits="GestiondeEstado.Wizard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Wizard ID="Wizard1" runat="server" OnFinishButtonClick="Wizard1_FinishButtonClick">
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
                        First name: <asp:TextBox ID="fname" runat="server"></asp:TextBox><br>
                        Last name: <asp:TextBox ID="lname" runat="server"></asp:TextBox><br>

                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">

                        Email: <asp:TextBox ID="email" runat="server"></asp:TextBox><br>

                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3">

                        Age: <asp:TextBox ID="edad" runat="server"></asp:TextBox><br>
                        Hobby: <asp:TextBox ID="hobby" runat="server"></asp:TextBox><br>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>

            <asp:Label ID="lblResultados" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
