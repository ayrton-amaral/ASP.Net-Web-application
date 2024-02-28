<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AyrtonFinalExam.GUI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 24%;
            height: 258px;
        }
        .auto-style2 {
            height: 30px;
            width: 301px;
        }
        .auto-style3 {
            width: 127px;
        }
        .auto-style4 {
            height: 30px;
            width: 127px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style5 {
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
            text-align: center;
        }
        .auto-style6 {
            width: 127px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style7 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        .auto-style8 {
            width: 301px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" class="auto-style1">
                <tr>
                    <td class="auto-style5" colspan="2"><strong>Login Form</strong></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">User Code:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxUserCode" runat="server" Width="160px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">Password:</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBoxPassword" runat="server" Width="160px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Button ID="ButtonLogin" runat="server" CssClass="auto-style7" OnClick="ButtonLogin_Click" Text="Login" Width="169px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
