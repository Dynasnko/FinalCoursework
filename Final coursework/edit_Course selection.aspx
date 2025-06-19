<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_student data.aspx.cs" Inherits="Final_coursework.Student_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <style>
    body {
        font-family: "微軟正黑體", sans-serif;
        background-color: #f4f7f9;
        margin: 0;
        padding: 20px;
    }

    h1 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 30px;
    }

    form {
        max-width: 1200px;
        height:800px;
        margin: 0 auto;
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    input{
         border-radius: 5px;
    }
    table{
        width:700px;
        margin:0 auto;
        border-spacing: 0 20px;
    }
    .div_center{
    text-align: center;
    padding:10px;
    }
</style>
    <title>學生選課</title>
</head>
<body>
    <h1>選課</h1>
    <form id="form1" runat="server">
        <div style="height: auto; width: auto;">
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Enrollment] WHERE [EnrollID] = @EnrollID" InsertCommand="INSERT INTO [Enrollment] ([CourseCode], [StdID], [EnrollStatus]) VALUES (@CourseCode, @StdID, @EnrollStatus)" SelectCommand="SELECT [CourseCode], [StdID], [EnrollStatus], [EnrollID] FROM [Enrollment]" UpdateCommand="UPDATE [Enrollment] SET [CourseCode] = @CourseCode, [StdID] = @StdID, [EnrollStatus] = @EnrollStatus WHERE [EnrollID] = @EnrollID">
    <DeleteParameters>
        <asp:Parameter Name="EnrollID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CourseCode" Type="String" />
        <asp:Parameter Name="StdID" Type="String" />
        <asp:Parameter Name="EnrollStatus" Type="Boolean" />
        <%-- 移除 EnrollID 參數 --%>
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CourseCode" Type="String" />
        <asp:Parameter Name="StdID" Type="String" />
        <asp:Parameter Name="EnrollStatus" Type="Boolean" />
        <asp:Parameter Name="EnrollID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="EnrollID" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnPageIndexChanging="FormView1_PageIndexChanging" CellPadding="4" ForeColor="#333333">
                 <EditItemTemplate>
                     CourseCode:
                     <asp:Label ID="CourseCodeLabel" runat="server" Text='<%# Bind("CourseCode") %>' />
                    <br />
                    StdID:
                     <asp:Label ID="StdIDLabel" runat="server" Text='<%# Bind("StdID") %>' />
                    <br />
                     EnrollStatus:
                    <asp:CheckBox ID="EnrollStatusCheckBox" runat="server" Checked='<%# Bind("EnrollStatus") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                     &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                
                 <EditRowStyle BackColor="#999999" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                
                <InsertItemTemplate>
                    課程:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CourseName" DataValueField="CourseCode" SelectedValue='<%# Bind("CourseCode", "{0}") %>'>
                    </asp:DropDownList>
                    <br />
                    學號:
                    <asp:TextBox ID="StdIDTextBox" runat="server" Text='<%# Bind("StdID") %>' />
                    <br />
                    EnrollStatus:
                    <asp:CheckBox ID="EnrollStatusCheckBox" runat="server" Checked='<%# Bind("EnrollStatus") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="加入課表" />
                    &nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </InsertItemTemplate>
                
                <ItemTemplate>
                    CourseCode:
                    <asp:Label ID="CourseCodeLabel" runat="server" Text='<%# Bind("CourseCode") %>' />
                    <br /> StdID:
                    <asp:Label ID="StdIDLabel" runat="server" Text='<%# Bind("StdID") %>' />
                    <br />
                    EnrollStatus:
                    <asp:CheckBox ID="EnrollStatusCheckBox" runat="server" Checked='<%# Bind("EnrollStatus") %>' Enabled="false" />
                    <br />
                    EnrollID:
                    <asp:Label ID="EnrollIDLabel" runat="server" Text='<%# Eval("EnrollID") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                </ItemTemplate>
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:FormView>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CourseCode], [CourseName], [Credit], [TeacherEmpID] FROM [Course]"></asp:SqlDataSource>
            
        </div>
    </form>
</body>
</html>