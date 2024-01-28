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
    public partial class PublisherManagement : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        protected void clearform()
        {
            TBPublisherName.Text = "";
            TBPublisherID.Text = "";
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            if (checkname())
                Response.Write("<script>alert('publisher with same ID already exist');</script>");
            else
            {
                try
                {
                    SqlConnection connection = new SqlConnection(con);
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();
                    string query = $@"Insert into PulisherMaster ([publisherName],[publisherID])
                                                     values('{TBPublisherName.Text.Trim()}','{TBPublisherID.Text.Trim()}')";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    Response.Write("<script>alert('publisher added Succesfuly');</script>");
                    clearform();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
        }


        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (!checkname())
                Response.Write("<script>alert('publisher with this ID does not exist');</script>");
            else
            {
                try
                {
                    SqlConnection connection = new SqlConnection(con);
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();
                    string query = $@"Update PulisherMaster Set publisherName= '{TBPublisherName.Text.Trim()}' where publisherID='{TBPublisherID.Text.Trim()}'";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    Response.Write("<script>alert('publisher Updated Succesfuly');</script>");
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
                    Response.Write("<script>alert('publisher with this ID does not exist');</script>");
                else
                {
                    try
                    {
                        SqlConnection connection = new SqlConnection(con);
                        if (connection.State == ConnectionState.Closed)
                            connection.Open();
                        string query = $@"Delete from PulisherMaster where publisherName='{TBPublisherName.Text.Trim()}'and publisherID='{TBPublisherID.Text.Trim()}'";
                        SqlCommand cmd = new SqlCommand(query, connection);
                        cmd.ExecuteNonQuery();
                        connection.Close();
                        Response.Write("<script>alert('publisher Deleted Succesfuly');</script>");
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
            string query = $@"select * from PulisherMaster where publisherID = '{TBPublisherID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            var item = cmd.ExecuteScalar();
            connection.Close();
            if (item != null)
                return true;
            else return false;



        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"select publisherName from PulisherMaster where publisherID = '{TBPublisherID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            string name = cmd.ExecuteScalar().ToString();
            connection.Close();
            if (name != null)
                TBPublisherName.Text = name;
            else Response.Write("<script>alert('publisher with this ID does not exist');</script>"); ;

        }
    }
}