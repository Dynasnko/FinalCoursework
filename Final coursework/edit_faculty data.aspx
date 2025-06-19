<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_faculty data.aspx.cs" Inherits="Final_coursework.Add_faculty_data" %>

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
        border-spacing: 0 20px;
    }
    .div_center{
    text-align: center;
    padding:10px;
    }
</style>
    <title>編輯教師資料</title>
</head>
<body>
    <h1>編輯教師資料</h1>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Emp] WHERE [EmpID] = @EmpID" InsertCommand="INSERT INTO [Emp] ([EmpID], [EmpName], [EmpTitleID], [EmpGender], [EmpStatus]) VALUES (@EmpID, @EmpName, @EmpTitleID, @EmpGender, @EmpStatus)" SelectCommand="SELECT [EmpID], [EmpName], [EmpTitleID], [EmpGender], [EmpStatus] FROM [Emp] WHERE ([EmpID] = @EmpID)" UpdateCommand="UPDATE [Emp] SET [EmpName] = @EmpName, [EmpTitleID] = @EmpTitleID, [EmpGender] = @EmpGender, [EmpStatus] = @EmpStatus WHERE [EmpID] = @EmpID">
            <DeleteParameters>
                <asp:Parameter Name="EmpID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EmpID" Type="Int32" />
                <asp:Parameter Name="EmpName" Type="String" />
                <asp:Parameter Name="EmpTitleID" Type="Int32" />
                <asp:Parameter Name="EmpGender" Type="String" />
                <asp:Parameter Name="EmpStatus" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="EmpID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="EmpName" Type="String" />
                <asp:Parameter Name="EmpTitleID" Type="Int32" />
                <asp:Parameter Name="EmpGender" Type="String" />
                <asp:Parameter Name="EmpStatus" Type="Boolean" />
                <asp:Parameter Name="EmpID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div class="div_center">
                <label for="TextBox1">教師編號</label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="查詢" />
        </div>
       
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="EmpID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
            <EditItemTemplate>
                教師編號:
                <asp:Label ID="EmpIDLabel1" runat="server" Text='<%# Eval("EmpID") %>' />
                <br />
                性別:
                <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("EmpGender", "{0}") %>'>
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList>
                <br />
                姓名:
                <asp:TextBox ID="EmpNameTextBox" runat="server" Text='<%# Bind("EmpName") %>' />
                <br />
                在職狀態:
                <asp:CheckBox ID="EmpStatusCheckBox" runat="server" Checked='<%# Bind("EmpStatus") %>' />
                <br />
                職位ID:
                <asp:TextBox ID="EmpTitleIDTextBox" runat="server" Text='<%# Bind("EmpTitleID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                教師編號:
                <asp:TextBox ID="EmpIDTextBox" runat="server" Text='<%# Bind("EmpID") %>' />
                <br />
                姓別:
                <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("EmpGender", "{0}") %>'>
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList>
                <br />
                姓名:
                <asp:TextBox ID="EmpNameTextBox" runat="server" Text='<%# Bind("EmpName") %>' />
                <br />
                教師:
                <asp:CheckBox ID="EmpStatusCheckBox" runat="server" Checked='<%# Bind("EmpStatus") %>' />
                <br />
                職稱:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TitleName" DataValueField="ID" SelectedValue='<%# Bind("EmpTitleID", "{0}") %>'>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                教師編號:
                <asp:Label ID="EmpIDLabel" runat="server" Text='<%# Eval("EmpID") %>' />
                <br />
                性別:
                <asp:Label ID="EmpGenderLabel" runat="server" Text='<%# Bind("EmpGender") %>' />
                <br />
                性名:
                <asp:Label ID="EmpNameLabel" runat="server" Text='<%# Bind("EmpName") %>' />
                <br />
                在職狀態:
                <asp:CheckBox ID="EmpStatusCheckBox" runat="server" Checked='<%# Bind("EmpStatus") %>' Enabled="false" />
                <br />
                職稱編號:
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmpTitleID") %>'></asp:Label>
                <br />
                &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                &nbsp;<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [TitleName] FROM [EmpTitle]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TitleName], [ID] FROM [EmpTitle] WHERE ([ID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="FormView1" Name="ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
