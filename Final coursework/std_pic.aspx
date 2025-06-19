<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="std_pic.aspx.cs" Inherits="Final_coursework.std_pic" %>

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
    <title>學生圖片上傳</title>
</head>
<body>
    <h1>學生圖片上傳</h1>
    <form id="form1" runat="server">
        <div style="height: auto; width: auto;" class="div_center">
            輸入學號以上傳學生圖片<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button4" runat="server" Text="查詢" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="StdSchoolID" HeaderText="StdSchoolID" SortExpression="StdSchoolID" />
                    <asp:BoundField DataField="StdDepID" HeaderText="StdDepID" SortExpression="StdDepID" />
                    <asp:BoundField DataField="StdID" HeaderText="StdID" SortExpression="StdID" />
                    <asp:BoundField DataField="StdName" HeaderText="StdName" SortExpression="StdName" />
                    <asp:BoundField DataField="StdGender" HeaderText="StdGender" SortExpression="StdGender" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <asp:Image ID="Image1" runat="server" Height="232px" Width="261px" />
            <br />
            <asp:Button ID="Button1" runat="server" Text="上傳圖片" OnClick="Button1_Click" />
            <asp:Button ID="Button3" runat="server" Text="顯示圖片" OnClick="Button3_Click1" />
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StdSchoolID], [StdID], [StdDepID], [StdPK], [StdName], [StdGender] FROM [NStd] WHERE ([StdID] = @StdID)">
               <SelectParameters>
                   <asp:ControlParameter ControlID="TextBox1" Name="StdID" PropertyName="Text" Type="String" />
               </SelectParameters>
</asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CourseCode], [CourseName], [Credit], [TeacherEmpID] FROM [Course]"></asp:SqlDataSource>
            
        </div>
    </form>
</body>
</html>
