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
    <title>教師開課資料查詢</title>
</head>
<body>
    <h1>教師開課資料查詢 </h1>
    <form id="form1" runat="server">
        <div style="height: auto; width: auto;">
            <br />
            <div class="div_center">
                <label for="TextBox1">輸入教師編號</label>
                <asp:TextBox ID="TextBox1" runat="server" style="margin-bottom: 0px" Width="300px"></asp:TextBox>
                  <asp:Button ID="Button1" runat="server" Text="查詢" />
            </div>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT Emp.EmpID, Emp.EmpName, Emp.EmpGender, Emp.EmpTitleID, EmpTitle.TitleName, Emp.EmpStatus 
                   FROM Emp 
                   LEFT JOIN EmpTitle ON Emp.EmpTitleID = EmpTitle.ID 
                   WHERE Emp.EmpID = @EmpID">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="EmpID" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
            
            <br />
            <div class="div_center">教師資料</div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="EmpID" DataSourceID="SqlDataSource3">
    <Columns>
        <asp:BoundField DataField="EmpID" HeaderText="教師編號" SortExpression="EmpID" ReadOnly="True" />
        <asp:BoundField DataField="EmpName" HeaderText="姓名" SortExpression="EmpName" />
        <asp:BoundField DataField="EmpGender" HeaderText="性別" SortExpression="EmpGender" />
        <asp:BoundField DataField="TitleName" HeaderText="職稱" SortExpression="TitleName" />
        <asp:CheckBoxField DataField="EmpStatus" HeaderText="在職狀態" SortExpression="EmpStatus" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:CheckBoxField>
    </Columns>
</asp:GridView>
            
             <div class="div_center">開課資料</div>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CourseCode], [CourseName], [Credit], [TeacherEmpID] FROM [Course] WHERE ([TeacherEmpID] = @TeacherEmpID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="TeacherEmpID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseCode" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:BoundField DataField="CourseCode" HeaderText="課程編號" ReadOnly="True" SortExpression="CourseCode" />
                    <asp:BoundField DataField="CourseName" HeaderText="課程名稱" SortExpression="CourseName" />
                    <asp:BoundField DataField="Credit" HeaderText="學分" SortExpression="Credit" />
                </Columns>
            </asp:GridView>
            <br />
            
        </div>
    </form>
</body>
</html>