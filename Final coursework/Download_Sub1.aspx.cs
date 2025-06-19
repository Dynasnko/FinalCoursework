using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Final_coursework
{
    public partial class Download_Sub1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string stdID = Request.QueryString["pid"];
            if (string.IsNullOrEmpty(stdID))
            {
                Response.End();
                return;
            }
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT StdPicture FROM NStd WHERE StdID = @StdID";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@StdID", stdID);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read() && dr["StdPicture"] != DBNull.Value)
                    {
                        byte[] img = (byte[])dr["StdPicture"];
                        Response.ContentType = "image/jpeg"; // 預設當 JPEG，有需要再判斷
                        Response.BinaryWrite(img);
                    }
                }
            }
            Response.End();
        }
    }
}