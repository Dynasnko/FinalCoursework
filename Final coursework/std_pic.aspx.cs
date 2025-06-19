using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_coursework
{
    public partial class std_pic : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AlertMessage sysmsg = new AlertMessage();

            string stdID = TextBox1.Text.Trim();

            if (string.IsNullOrEmpty(stdID))
            {
                sysmsg.ShowMsg(this.Page, "請輸入學號！");
                return;
            }

            if (!FileUpload1.HasFile)
            {
                sysmsg.ShowMsg(this.Page, "請選擇要上傳的圖片！");
                return;
            }

            // 直接呼叫你原本的 Insert_Image 方法，但 SQL 字串用拼的
            string sql = "UPDATE NStd SET StdPicture = @StdPicture WHERE StdID = '" + stdID + "'";

            SQL_Handle jpgUpload = new SQL_Handle(this.Page, "ConnectionString");
            bool result = jpgUpload.Insert_Image(sql, FileUpload1, "StdPicture");

            if (result)
                sysmsg.ShowMsg(this.Page, "圖片上傳成功！");
            else
                sysmsg.ShowMsg(this.Page, "圖片上傳失敗！");
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            string stdID = TextBox1.Text.Trim();
            if (string.IsNullOrEmpty(stdID))
            {
                AlertMessage sysmsg = new AlertMessage();
                sysmsg.ShowMsg(this.Page, "請輸入學號！");
                return;
            }
            // 設定 Image1 來源
            Image1.ImageUrl = "Download_Sub1.aspx?pid=" + stdID;
            Image1.Visible = true;
        }
    }
    }
