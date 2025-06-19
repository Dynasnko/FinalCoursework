<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="std_place.aspx.cs" Inherits="Final_coursework.edit_daaf4a63f42" %>

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
    <title>學生籍貫查詢</title>
</head>
<body>
        <h1>學生籍貫查詢</h1>

    <form id="form1" runat="server">
        <div class="div_center">
            籍貫<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查詢" />
        </div>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="SchoolName" HeaderText="校名" SortExpression="SchoolName" />
        <asp:BoundField DataField="DepName" HeaderText="系名" SortExpression="DepName" />
        <asp:BoundField DataField="StdID" HeaderText="學號" SortExpression="StdID" />
        <asp:BoundField DataField="StdName" HeaderText="姓名" SortExpression="StdName" />
        <asp:BoundField DataField="StdGender" HeaderText="性別" SortExpression="StdGender" />
        <asp:CheckBoxField DataField="StdStatus" HeaderText="狀態" SortExpression="StdStatus" />
        <asp:BoundField DataField="BirthDate" HeaderText="生日" SortExpression="BirthDate" />
        <asp:BoundField DataField="BirthPlace" HeaderText="籍貫" SortExpression="BirthPlace" />
    </Columns>
</asp:GridView>
        <p>
            &nbsp;</p>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT NStd.StdSchoolID, School.SchoolName, NStd.StdDepID, Department.DepName, 
                          NStd.StdID, NStd.StdName, NStd.StdGender, NStd.StdStatus, NStd.BirthDate, NStd.BirthPlace 
                   FROM NStd 
                   LEFT JOIN School ON NStd.StdSchoolID = School.SchoolID 
                   LEFT JOIN Department ON NStd.StdDepID = Department.DepID 
                   WHERE NStd.BirthPlace LIKE '%' + @BirthPlace + '%'">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="BirthPlace" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

    </form>
</body>
</html>
