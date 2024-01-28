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
    public partial class Adminusermanagement : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void BtnGo_Click(object sender, EventArgs e)
        {
            getmember();
            

        }
        protected void getmember()
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"select * from MemberMaster where MemberID = '{TBMemberID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TBFullName.Text = reader["FullName"].ToString();
                    TBContactNo.Text = reader["contact"].ToString();
                    TBDOB.Text = reader["dob"].ToString();
                    TBEmailID.Text = reader["email"].ToString();
                    TState.Text = reader["State"].ToString();
                    TCity.Text = reader["city"].ToString();
                    TPinCode.Text = reader["pincode"].ToString();
                    TAddress.Text = reader["FullAddress"].ToString();
                    TAccountStatus.Text = reader["accountstatus"].ToString();
                }
            }
            else Response.Write("<script>alert('Author with this ID does not exist');</script>");

            connection.Close();
        }

      
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"Delete from MemberMaster where MemberID = '{TBMemberID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            TBFullName.Text = "";
            TBContactNo.Text = "";
            TBDOB.Text = "";
            TBEmailID.Text = "";
            TState.Text = "";
            TCity.Text = "";
            TPinCode.Text = "";
            TAddress.Text = "";
            TAccountStatus.Text= "";


            GridView1.DataBind();
        }

        protected void activebtn_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"Update MemberMaster set accountstatus='Active' where MemberID = '{TBMemberID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            getmember();
            GridView1.DataBind();
        }

        protected void pendingbtn_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"Update MemberMaster set accountstatus='Pending' where MemberID = '{TBMemberID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            getmember();
            GridView1.DataBind();
        }

        protected void inactivebtn_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"Update MemberMaster set accountstatus='Desactive' where MemberID = '{TBMemberID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            getmember();
            GridView1.DataBind();
        }
    }
}