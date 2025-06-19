<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_Course.aspx.cs" Inherits="Final_coursework.Add_Course" %>

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
    <title>編輯課程資料</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>編輯課程資料</h1>
            <div class="div_center">課程編號
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
           <asp:Button ID="Button1" runat="server" Text="查詢" />
           </div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="CourseCode" DataSourceID="SqlDataSource1" style="margin-right: 0px">
            <EditItemTemplate>
                課程編號:
                <asp:Label ID="CourseCodeLabel1" runat="server" Text='<%# Eval("CourseCode") %>' />
                <br />
                課程名稱:
                <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                <br />
                學分:
                <asp:TextBox ID="CreditTextBox" runat="server" Text='<%# Bind("Credit") %>' />
                <br />
                開課教師:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="EmpName" DataValueField="EmpID" SelectedValue='<%# Bind("TeacherEmpID", "{0}") %>'>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                課程編號:
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CourseCode", "{0}") %>'></asp:TextBox>
                <br />
                課程名稱:
                <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                <br />
                學分:
                <asp:TextBox ID="CreditTextBox" runat="server" Text='<%# Bind("Credit") %>' />
                <br />
                開課教師:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="EmpName" DataValueField="EmpID" SelectedValue='<%# Bind("TeacherEmpID", "{0}") %>'>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                課程名稱:
                <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Bind("CourseName") %>' />
                <br />
                學分:
                <asp:Label ID="CreditLabel" runat="server" Text='<%# Bind("Credit") %>' />
                <br />
                開課教師編號:
                <asp:Label ID="TeacherEmpIDLabel" runat="server" Text='<%# Bind("TeacherEmpID") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Course] WHERE [CourseCode] = @CourseCode" InsertCommand="INSERT INTO [Course] ([CourseCode], [CourseName], [Credit], [TeacherEmpID]) VALUES (@CourseCode, @CourseName, @Credit, @TeacherEmpID)" SelectCommand="SELECT [CourseCode], [CourseName], [Credit], [TeacherEmpID] FROM [Course] WHERE ([CourseCode] = @CourseCode)" UpdateCommand="UPDATE [Course] SET [CourseName] = @CourseName, [Credit] = @Credit, [TeacherEmpID] = @TeacherEmpID WHERE [CourseCode] = @CourseCode" OnSelecting="SqlDataSource1_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="CourseCode" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CourseCode" />
                <asp:Parameter Name="CourseName" />
                <asp:Parameter Name="Credit" />
                <asp:Parameter Name="TeacherEmpID" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="CourseCode" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CourseName" />
                <asp:Parameter Name="Credit" />
                <asp:Parameter Name="TeacherEmpID" />
                <asp:Parameter Name="CourseCode" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Emp] WHERE [EmpID] = @EmpID" InsertCommand="INSERT INTO [Emp] ([EmpID], [EmpName], [EmpTitleID], [EmpStatus], [EmpGender]) VALUES (@EmpID, @EmpName, @EmpTitleID, @EmpStatus, @EmpGender)" SelectCommand="SELECT [EmpID], [EmpName], [EmpTitleID], [EmpStatus], [EmpGender] FROM [Emp]" UpdateCommand="UPDATE [Emp] SET [EmpName] = @EmpName, [EmpTitleID] = @EmpTitleID, [EmpStatus] = @EmpStatus, [EmpGender] = @EmpGender WHERE [EmpID] = @EmpID">
            <DeleteParameters>
                <asp:Parameter Name="EmpID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EmpID" Type="Int32" />
                <asp:Parameter Name="EmpName" Type="String" />
                <asp:Parameter Name="EmpTitleID" Type="Int32" />
                <asp:Parameter Name="EmpStatus" Type="Boolean" />
                <asp:Parameter Name="EmpGender" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EmpName" Type="String" />
                <asp:Parameter Name="EmpTitleID" Type="Int32" />
                <asp:Parameter Name="EmpStatus" Type="Boolean" />
                <asp:Parameter Name="EmpGender" Type="String" />
                <asp:Parameter Name="EmpID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
