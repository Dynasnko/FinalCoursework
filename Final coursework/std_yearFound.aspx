<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="std_yearFound.aspx.cs" Inherits="Final_coursework.std_yearFound" %>

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
        width:1000px;
        height:300px;
        margin:0 auto;
        border-spacing: 0 20px;
    }
    .div_center{
    text-align: center;
    padding:10px;
    }
</style>
    <title>學生出生年份查詢</title>
</head>
<body>
        <h1>學生出生年份查詢</h1>

    <form id="form1" runat="server">
        <div class="div_center">
           出生年<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查詢" />
            <br />            
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StdPK" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="div_center" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="StdPK" HeaderText="學生編號" InsertVisible="False" ReadOnly="True" SortExpression="StdPK" />
                    <asp:BoundField DataField="StdSchoolID" HeaderText="學校編號" SortExpression="StdSchoolID" />
                    <asp:BoundField DataField="StdDepID" HeaderText="科系代號" SortExpression="StdDepID" />
                    <asp:BoundField DataField="StdID" HeaderText="學號" SortExpression="StdID" />
                    <asp:BoundField DataField="StdName" HeaderText="學生姓名" SortExpression="StdName" />
                    <asp:BoundField DataField="StdGender" HeaderText="學生性別" SortExpression="StdGender" />
                    <asp:CheckBoxField DataField="StdStatus" HeaderText="狀態" SortExpression="StdStatus" />
                    <asp:BoundField DataField="BirthDate" HeaderText="出生日期" SortExpression="BirthDate" />
                    <asp:BoundField DataField="BirthPlace" HeaderText="出生地" SortExpression="BirthPlace" />
                </Columns>
            </asp:GridView>
            </div>
            <br />
            <br />
        <p>
            &nbsp;</p>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT *
FROM NStd 
WHERE YEAR(NStd.BirthDate) = @BirthYear">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="BirthYear" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>

    </form>
</body>
</html>

