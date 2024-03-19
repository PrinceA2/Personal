<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calci.aspx.cs" Inherits="Calculator.calci" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="input_group">

                <label for="tnum1">Number1</label>
                <asp:TextBox ID="tnum1" runat="server" Text=""></asp:TextBox>

               <%--Required Field Validation on the (Number) Text Box--%>

<asp:RequiredFieldValidator ID="rfvTNum1" runat="server" ControlToValidate="tnum1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>

            </div>

            <br />

            <div class="input_group">
                <label for="tnum2">Number2</label>
                <asp:TextBox ID="tnum2" runat="server" Text=""></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tnum2" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
            </div>

            <br />



            <div class="accordion-button">
                <asp:Button ID="Button0" runat="server" Text="+" OnClick="Calculate" />

                <asp:Button ID="Button1" runat="server" Text="-" OnClick="Calculate" />

                <asp:Button ID="Button2" runat="server" Text="*" OnClick="Calculate" />

                <asp:Button ID="Button3" runat="server" Text="/" OnClick="Calculate" />

                <asp:Button ID="Button4" runat="server" Text="%" OnClick="Calculate" />

            </div>

            <br />
            <br />
            <div class="result">

                <label for="tresult">Result</label>
                <asp:TextBox ID="tresult" runat="server" Text=""></asp:TextBox>

            </div>

        </div>
    </form>
</body>
</html>
