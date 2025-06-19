<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_findschool.aspx.cs" Inherits="Final_coursework.edit_schoolordep" %>

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
    <title>列出各科系學生</title>
</head>
<body>
    <h1>列出各科系學生</h1>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="DepID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="DepID" HeaderText="科系代號" ReadOnly="True" SortExpression="DepID" />
                <asp:BoundField DataField="DepName" HeaderText="科系名稱" SortExpression="DepName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [DepID], [DepName], [SchoolID], [IsActive] FROM [Department]"></asp:SqlDataSource>
        <div class="div_center">
                <label for="TextBox1">請輸入科系代號</label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="查詢" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StdSchoolID], [StdDepID], [StdID], [StdGender], [StdName], [StdStatus], [BirthDate], [BirthPlace] FROM [NStd] WHERE ([StdDepID] = @StdDepID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="StdDepID" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="StdID" HeaderText="學號" SortExpression="StdID" />
                <asp:BoundField DataField="StdGender" HeaderText="性別" SortExpression="StdGender" />
                <asp:BoundField DataField="StdName" HeaderText="姓名" SortExpression="StdName" />
                <asp:CheckBoxField DataField="StdStatus" HeaderText="狀態" SortExpression="StdStatus" />
                <asp:BoundField DataField="BirthDate" HeaderText="生日" SortExpression="BirthDate" />
                <asp:BoundField DataField="BirthPlace" HeaderText="籍貫" SortExpression="BirthPlace" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
