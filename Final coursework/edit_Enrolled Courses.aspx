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
        width:auto;
        margin:0 auto;
        /*border-spacing: 0 20px;*/
    }
    .div_center{
        text-align: center;
        padding:10px;
    }
</style>
    <title>新增學生資料</title>
</head>
<body>
    <h1>個人選課資料查詢 </h1>
    <form id="form1" runat="server">
        <div style="height: auto; width: auto;">
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StdPK], [StdSchoolID], [StdDepID], [StdID], [StdName], [StdGender], [StdStatus], [BirthDate], [BirthPlace] FROM [NStd] WHERE ([StdID] = @StdID)">
               <SelectParameters>
                   <asp:ControlParameter ControlID="TextBox1" Name="StdID" PropertyName="Text" Type="String" />
               </SelectParameters>
            </asp:SqlDataSource>
            <div class="div_center">
                 <label for="TextBox1">輸入學號</label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="查詢" />
            </div>
            
          
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StdPK" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="StdSchoolID" HeaderText="學校" SortExpression="StdSchoolID" />
                    <asp:BoundField DataField="StdDepID" HeaderText="科系" SortExpression="StdDepID" />
                    <asp:BoundField DataField="StdID" HeaderText="學號" SortExpression="StdID" />
                    <asp:BoundField DataField="StdName" HeaderText="姓名" SortExpression="StdName" />
                    <asp:BoundField DataField="StdGender" HeaderText="性別" SortExpression="StdGender" />
                    <asp:CheckBoxField DataField="StdStatus" HeaderText="狀態" SortExpression="StdStatus" />
                    <asp:BoundField DataField="BirthDate" HeaderText="生日" SortExpression="BirthDate" />
                    <asp:BoundField DataField="BirthPlace" HeaderText="籍貫" SortExpression="BirthPlace" />
                </Columns>
            </asp:GridView>
            
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT Enrollment.EnrollID, Enrollment.StdID, Enrollment.CourseCode, Course.CourseName 
                   FROM Enrollment 
                   LEFT JOIN Course ON Enrollment.CourseCode = Course.CourseCode 
                   WHERE Enrollment.StdID = @StdID">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="StdID" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
            <br />
            <div class="div_center">所屬課程</div>
            <br />
           <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="EnrollID" DataSourceID="SqlDataSource2">
    <Columns>
        <asp:BoundField DataField="StdID" HeaderText="學號" SortExpression="StdID" />
        <asp:BoundField DataField="CourseCode" HeaderText="課程代碼" SortExpression="CourseCode" />
        <asp:BoundField DataField="CourseName" HeaderText="課程名稱" SortExpression="CourseName" />
    </Columns>
</asp:GridView>
            
        </div>
    </form>
</body>
</html>