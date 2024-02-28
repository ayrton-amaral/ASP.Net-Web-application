<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobAssignment.aspx.cs" Inherits="AyrtonFinalExam.GUI.JobAssignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 99%;
            height: 629px;
        }
        .auto-style2 {
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: large;
        }
        .auto-style4 {
            width: 321px;
        }
        .auto-style5 {
            width: 180px;
        }
        .auto-style6 {
            width: 133px;
        }
        .auto-style7 {
            width: 137px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style8 {
            width: 137px;
        }
        .auto-style9 {
            width: 133px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style10 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style11 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        .auto-style12 {
            width: 137px;
            height: 23px;
        }
        .auto-style13 {
            width: 321px;
            height: 23px;
        }
        .auto-style14 {
            width: 180px;
            height: 23px;
        }
        .auto-style15 {
            width: 133px;
            height: 23px;
        }
        .auto-style16 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="5">IT Project Manager - Job Assignment</td>
                </tr>
                <tr>
                    <td colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">Select Employee:</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropDownListEmployees" runat="server" CssClass="auto-style10" Height="18px" Width="264px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style9">Select Job:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListJobs" runat="server" CssClass="auto-style10" Height="19px" Width="265px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">Assigned Date:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxAssignedDate" runat="server" CssClass="auto-style10" Height="22px" Width="261px"></asp:TextBox>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style9">Submitted Date:</td>
                    <td>
                        <asp:TextBox ID="TextBoxSubmittedDate" runat="server" CssClass="auto-style10" Height="22px" Width="262px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Calendar ID="CalendarAssignedDate" runat="server" CssClass="auto-style10" OnSelectionChanged="AssignedDateSelection"></asp:Calendar>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>
                        <asp:Calendar ID="CalendarSubmittedDate" runat="server" CssClass="auto-style10" OnSelectionChanged="SubmissionDateSelection"></asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button ID="ButtonListJobsByEmployee" runat="server" Text="List Jobs By Employee" Width="272px" OnClick="ButtonListJobsByEmployee_Click" />
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>
                        <asp:Button ID="ButtonListEmployeesByJob" runat="server" Text="List Employees By Job" Width="276px" OnClick="ButtonListEmployeesByJob_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:GridView ID="GridView1" runat="server" CssClass="auto-style10" Width="273px">
                        </asp:GridView>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" CssClass="auto-style10" Width="276px">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button ID="ButtonAssignJobToEmployee" runat="server" CssClass="auto-style11" Height="26px" OnClick="Button1_Click" Text="Assign Job to Employee" />
                    </td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13"></td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
