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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnsignup_Click(object sender, EventArgs e)
        {
            if (checkname())
                Response.Write("<script>alert('Member with same ID already exist');</script>");
            else
            { 
                signup();
                Response.Redirect("userlogin.aspx");
            }

            
        }
        string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private bool checkname()
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"select * from MemberMaster where MemberID = '{TBUserID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            var item = cmd.ExecuteScalar();
            connection.Close();
            if (item != null)
                return true;
            else return false;
            
            
            
        }
        private void signup()
        {
            try
            {
                SqlConnection connection = new SqlConnection(con);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                string query = $@"Insert into MemberMaster ([FullName],[dob],[contact],[email],[state],[city],[pincode],[FullAddress],[MemberID],[Password],[accountstatus])
                                                     values('{TBFullName.Text.Trim()}','{TBDob.Text.Trim()}','{TBContact.Text.Trim()}','{TBEmail.Text.Trim()}','{DDListState.SelectedItem.Value}','{TBCity.Text.Trim()}','{TBPinCode.Text.Trim()}','{TBAddress.Text.Trim()}','{TBUserID.Text.Trim()}','{TextBox2.Text.Trim()}','Pending')";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                Response.Write("<script>alert('Sign Up Succesfuly');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}