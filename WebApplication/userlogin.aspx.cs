using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class userlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                string name = "";
                string fn = "";
                string status = "";
                SqlConnection connection = new SqlConnection(con);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                string query = $@"select * from MemberMaster where MemberID = '{TBUser.Text.Trim()}' and Password= '{TBPass.Text}'";
                SqlCommand cmd = new SqlCommand(query, connection);
                SqlDataReader reader = cmd.ExecuteReader();
                if(reader.HasRows)
                {
                    while(reader.Read())
                    {
                        name = reader["MemberID"].ToString();
                        fn = reader["FullName"].ToString();
                        status = reader["accountstatus"].ToString();
                    }
                }
                connection.Close();

                if (!String.IsNullOrEmpty(name))
                {
                    Response.Write("<script>alert('Log In successfuly');</script>");
                    Session["username"] = name;
                    Session["Fullname"] = fn;
                    Session["Role"] = "User";
                    Session["status"] = status;
                    Response.Redirect("Home.aspx");
                }
                else
                    Response.Write("<script>alert('Incorrect MemberId or Password');</script>");



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            
            }
        }
        string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
       
    }
}