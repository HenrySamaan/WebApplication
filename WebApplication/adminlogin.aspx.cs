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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                string name = "";
                string fn = "";
                

                SqlConnection connection = new SqlConnection(con);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                string query = $@"select * from AdminLogin where username = '{TBUser.Text.Trim()}' and password= '{TBPass.Text}'";
                SqlCommand cmd = new SqlCommand(query, connection);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        name = reader["username"].ToString();
                        fn = reader["fullname"].ToString();
                        
                    }
                }
                connection.Close();

                if (!String.IsNullOrEmpty(name))
                {
                    Response.Write("<script>alert('Log In successfuly');</script>");
                    Session["username"] = name;
                    Session["Fullname"] = fn;
                    Session["Role"] = "Admin";
                    Session["status"] = "";
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
        
        
    }
}