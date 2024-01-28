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
    public partial class Aminmanagementauthor : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"select AuthorName from AuthorMaster where AuthorID = '{TBAuthorID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            string name = cmd.ExecuteScalar().ToString();
            connection.Close();
            if (name != null)
                TBAuthorName.Text=name;
            else Response.Write("<script>alert('Author with this ID does not exist');</script>"); ;

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {

            if (checkname())
                Response.Write("<script>alert('Author with same ID already exist');</script>");
            else
            {
                try
                {
                    SqlConnection connection = new SqlConnection(con);
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();
                    string query = $@"Insert into AuthorMaster ([AuthorName],[AuthorID])
                                                     values('{TBAuthorName.Text.Trim()}','{TBAuthorID.Text.Trim()}')";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    Response.Write("<script>alert('Author added Succesfuly');</script>");
                    clearform();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }

        }
        private bool checkname()
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"select * from AuthorMaster where AuthorID = '{TBAuthorID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            var item = cmd.ExecuteScalar();
            connection.Close();
            if (item != null)
                return true;
            else return false;



        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (!checkname())
                Response.Write("<script>alert('Author with this ID does not exist');</script>");
            else
            {
                try
                {
                    SqlConnection connection = new SqlConnection(con);
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();
                    string query = $@"Update AuthorMaster Set AuthorName= '{TBAuthorName.Text.Trim()}' where AuthorID='{TBAuthorID.Text.Trim()}'";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    Response.Write("<script>alert('Author Updated Succesfuly');</script>");
                    clearform();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }

        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            if (!checkname())
                Response.Write("<script>alert('Author with this ID does not exist');</script>");
            else
            {
                try
                {
                    SqlConnection connection = new SqlConnection(con);
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();
                    string query = $@"Delete from AuthorMaster where AuthorName='{TBAuthorName.Text.Trim()}'and AuthorID='{TBAuthorID.Text.Trim()}'";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    Response.Write("<script>alert('Author Deleted Succesfuly');</script>");
                    clearform();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
        }
        protected void clearform()
        {
            TBAuthorName.Text = "";
            TBAuthorID.Text = "";
        }

    }
}