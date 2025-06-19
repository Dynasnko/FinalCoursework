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
    <title>新增學生資料</title>
</head>
<body>
    <h1>新增學生資料</h1>
    <form id="form1" runat="server">
        <div style="height: auto; width: auto;margin-bottom: 0px;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Std] WHERE [StdPK] = @StdPK" InsertCommand="INSERT INTO [Std] ([StdSchoolID], [StdDepID], [StdID], [StdName], [StdGender], [StdStatus], [BirthDate], [BirthPlace], [StdPK]) VALUES (@StdSchoolID, @StdDepID, @StdID, @StdName, @StdGender, @StdStatus, @BirthDate, @BirthPlace, @StdPK)" SelectCommand="SELECT [StdSchoolID], [StdDepID], [StdID], [StdName], [StdGender], [StdStatus], [BirthDate], [BirthPlace], [StdPK] FROM [Std]" UpdateCommand="UPDATE [Std] SET [StdSchoolID] = @StdSchoolID, [StdDepID] = @StdDepID, [StdID] = @StdID, [StdName] = @StdName, [StdGender] = @StdGender, [StdStatus] = @StdStatus, [BirthDate] = @BirthDate, [BirthPlace] = @BirthPlace WHERE [StdPK] = @StdPK">
                <DeleteParameters>
                    <asp:Parameter Name="StdPK" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StdSchoolID" Type="String" />
                    <asp:Parameter Name="StdDepID" Type="String" />
                    <asp:Parameter Name="StdID" Type="String" />
                    <asp:Parameter Name="StdName" Type="String" />
                    <asp:Parameter Name="StdGender" Type="String" />
                    <asp:Parameter Name="StdStatus" Type="Boolean" />
                    <asp:Parameter Name="BirthDate" Type="DateTime" />
                    <asp:Parameter Name="BirthPlace" Type="String" />
                    <asp:Parameter Name="StdPK" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StdSchoolID" Type="String" />
                    <asp:Parameter Name="StdDepID" Type="String" />
                    <asp:Parameter Name="StdID" Type="String" />
                    <asp:Parameter Name="StdName" Type="String" />
                    <asp:Parameter Name="StdGender" Type="String" />
                    <asp:Parameter Name="StdStatus" Type="Boolean" />
                    <asp:Parameter Name="BirthDate" Type="DateTime" />
                    <asp:Parameter Name="BirthPlace" Type="String" />
                    <asp:Parameter Name="StdPK" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="StdPK" DataSourceID="SqlDataSource4" DefaultMode="Insert" OnPageIndexChanging="FormView1_PageIndexChanging" CellPadding="4" ForeColor="#333333">
                 <EditItemTemplate>
                    StdPK:
                    <asp:Label ID="StdPKLabel1" runat="server" Text='<%# Eval("StdPK") %>' />
                    <br />
                    StdDepID:
                    <asp:TextBox ID="StdDepIDTextBox" runat="server" Text='<%# Bind("StdDepID") %>' />
                    <br />
                    StdSchoolID:
                    <asp:TextBox ID="StdSchoolIDTextBox" runat="server" Text='<%# Bind("StdSchoolID") %>' />
                    <br />
                    StdID:
                    <asp:TextBox ID="StdIDTextBox" runat="server" Text='<%# Bind("StdID") %>' />
                    <br />
                    StdName:
                    <asp:TextBox ID="StdNameTextBox" runat="server" Text='<%# Bind("StdName") %>' />
                    <br />
                    StdGender:
                    <asp:TextBox ID="StdGenderTextBox" runat="server" Text='<%# Bind("StdGender") %>' />
                    <br />
                    StdStatus:
                    <asp:CheckBox ID="StdStatusCheckBox" runat="server" Checked='<%# Bind("StdStatus") %>' />
                    <br />
                    BirthDate:
                    <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' />
                    <br />
                    BirthPlace:
                    <asp:TextBox ID="BirthPlaceTextBox" runat="server" Text='<%# Bind("BirthPlace") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                
                 <EditRowStyle BackColor="#999999" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                
                <InsertItemTemplate>
                    學校:
                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource3" DataTextField="SchoolName" DataValueField="SchoolID" SelectedValue='<%# Bind("StdSchoolID", "{0}") %>'>
                    </asp:DropDownList>
                     <br />
                    科系:
                    <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="SqlDataSource2" DataTextField="DepName" DataValueField="DepID" SelectedValue='<%# Bind("StdDepID", "{0}") %>'>
                    </asp:DropDownList>
                    <br />
                    學號:
                    <asp:TextBox ID="StdIDTextBox" runat="server" Text='<%# Bind("StdID") %>' />
                    <br />
                    姓名:
                    <asp:TextBox ID="StdNameTextBox" runat="server" Text='<%# Bind("StdName") %>' />
                    <br />
                    性別:
                    <asp:DropDownList ID="DropDownList10" runat="server" SelectedValue='<%# Bind("StdGender", "{0}") %>'>
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    狀態:
                    <asp:CheckBox ID="StdStatusCheckBox" runat="server" Checked='<%# Bind("StdStatus") %>' />
                    <br />
                    生日:
                    <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' TextMode="Date" />
                    <br />
                    籍貫:
                    <asp:TextBox ID="BirthPlaceTextBox" runat="server" Text='<%# Bind("BirthPlace") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </InsertItemTemplate>
                
                <ItemTemplate>
                    科系:
                    <asp:Label ID="StdDepIDLabel" runat="server" Text='<%# Bind("StdDepID") %>' />
                    <br /> :
                    <asp:Label ID="StdSchoolIDLabel" runat="server" Text='<%# Bind("StdSchoolID") %>' />
                    <br />
                    StdID:
                    <asp:Label ID="StdIDLabel" runat="server" Text='<%# Bind("StdID") %>' />
                    <br />
                    StdName:
                    <asp:Label ID="StdNameLabel" runat="server" Text='<%# Bind("StdName") %>' />
                    <br />
                    StdGender:
                    <asp:Label ID="StdGenderLabel" runat="server" Text='<%# Bind("StdGender") %>' />
                    <br />
                    StdStatus:
                    <asp:CheckBox ID="StdStatusCheckBox" runat="server" Checked='<%# Bind("StdStatus") %>' Enabled="false" />
                    <br />
                    BirthDate:
                    <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Bind("BirthDate") %>' />
                    <br />
                    BirthPlace:
                    <asp:Label ID="BirthPlaceLabel" runat="server" Text='<%# Bind("BirthPlace") %>' />
                    <br />
                </ItemTemplate>
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:FormView>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT [DepID], [DepName], [SchoolID], [IsActive] FROM [Department] WHERE [IsActive] = 1">
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT [SchoolID], [SchoolName], [IsActive] FROM [School] WHERE [IsActive] = 1">
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [NStd] WHERE [StdPK] = @StdPK"
                InsertCommand="INSERT INTO [NStd] ([StdDepID], [StdSchoolID], [StdID], [StdName], [StdGender], [StdStatus], [BirthDate], [BirthPlace]) VALUES (@StdDepID, @StdSchoolID, @StdID, @StdName, @StdGender, @StdStatus, @BirthDate, @BirthPlace)"
                SelectCommand="SELECT [StdDepID], [StdSchoolID], [StdID], [StdName], [StdGender], [StdStatus], [BirthDate], [BirthPlace], [StdPK] FROM [NStd]"
                UpdateCommand="UPDATE [NStd] SET [StdDepID] = @StdDepID, [StdSchoolID] = @StdSchoolID, [StdID] = @StdID, [StdName] = @StdName, [StdGender] = @StdGender, [StdStatus] = @StdStatus, [BirthDate] = @BirthDate, [BirthPlace] = @BirthPlace WHERE [StdPK] = @StdPK">
                <DeleteParameters>
                    <asp:Parameter Name="StdPK" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StdDepID" Type="String" />
                    <asp:Parameter Name="StdSchoolID" Type="String" />
                    <asp:Parameter Name="StdID" Type="String" />
                    <asp:Parameter Name="StdName" Type="String" />
                    <asp:Parameter Name="StdGender" Type="String" />
                    <asp:Parameter Name="StdStatus" Type="Boolean" />
                    <asp:Parameter Name="BirthDate" Type="DateTime" />
                    <asp:Parameter Name="BirthPlace" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StdDepID" Type="String" />
                    <asp:Parameter Name="StdSchoolID" Type="String" />
                    <asp:Parameter Name="StdID" Type="String" />
                    <asp:Parameter Name="StdName" Type="String" />
                    <asp:Parameter Name="StdGender" Type="String" />
                    <asp:Parameter Name="StdStatus" Type="Boolean" />
                    <asp:Parameter Name="BirthDate" Type="DateTime" />
                    <asp:Parameter Name="BirthPlace" Type="String" />
                    <asp:Parameter Name="StdPK" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>