
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// SysDb 的摘要描述
/// </summary>
namespace Final_coursework
{
    public class SysDb : SqlDataSource
    {
        public SysDb() : base(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, "")
        {
        }
        public SysDb(String constr)
            : base(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, "")
        {
        }


    }
}
//: base(System.Configuration.ConfigurationManager.ConnectionStrings[constr].ConnectionString, "")
