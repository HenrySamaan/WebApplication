using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static int AS, CS, IB;
        static string filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillauthor();
            fillPubliher();
            GridView1.DataBind();
            
        }
        private void fillauthor()
        {
            try
            {
                SqlConnection conn = new SqlConnection(con);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT AuthorName from AuthorMaster;",
                conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DDLAuthorName.DataSource = dt;
                DDLAuthorName.DataValueField = "AuthorName";
                DDLAuthorName.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
            }
        }
        private void fillPubliher()
        {
            try
            {
                SqlConnection conn = new SqlConnection(con);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT publisherName from [PulisherMaster];",
                conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DDLPublisherName.DataSource = dt;
                DDLPublisherName.DataValueField = "PublisherName";
                DDLPublisherName.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
            }
        }
        protected bool checkmember()
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"select * from BookMaster where bookid = '{TBBBookID.Text.Trim()}' or BookName='{TBBookName.Text}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            var item = cmd.ExecuteScalar();
            if (item != null)
                return true;
            else return false;
                    

        }

        protected void getmember()
        {
            SqlConnection connection = new SqlConnection(con);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            string query = $@"select * from BookMaster where bookid = '{TBBBookID.Text.Trim()}'";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TBBookName.Text = reader["bookname"].ToString();
                    //TBContactNo.Text = reader["genre"].ToString();
                    DDLAuthorName.Text = reader["AuthorName"].ToString();
                    DDLPublisherName.Text = reader["publisherName"].ToString();
                    TPublisherDate.Text = reader["publishDate"].ToString();
                    DDLLanguage.Text = reader["language"].ToString();
                    TEdition.Text = reader["edition"].ToString();
                    TBookCost.Text = reader["bookCost"].ToString();
                    TPages.Text = reader["noofpages"].ToString();
                    TBookDescription.Text = reader["bookdescription"].ToString();
                    TAStock.Text = reader["actualstock"].ToString();
                    AS = Convert.ToInt32(reader["actualstock"].ToString());
                    CS = Convert.ToInt32(reader["currentstock"].ToString());
                    TCstock.Text = reader["currentstock"].ToString();
                    IB = Convert.ToInt32(reader["actualstock"].ToString()) - Convert.ToInt32(reader["currentstock"].ToString());
                    TIssuedbooks.Text = Convert.ToString(IB);
                    filepath= reader["bookimglink"].ToString();
                    for (int i = 0; i < LBGenre.Items.Count; i++)
                    {
                        if(reader["genre"].ToString().Contains(LBGenre.Items[i].Text))
                            LBGenre.Items[i].Selected = true;
                    }

                }
            }

            else Response.Write("<script>alert('book with this ID does not exist');</script>");

            connection.Close();
        }
        protected void btnGo_Click(object sender, EventArgs e)
        {
            getmember();

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            if(checkmember())
                Response.Write("<script>alert('book with this ID already exist');</script>");
            else
            {
                string genre = "";
                foreach(int i in LBGenre.GetSelectedIndices())
                {
                    genre += LBGenre.Items[i]+",";
                }
                genre = genre.Remove(genre.Length - 1);
                string filepath = "~/bookinventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("bookinventory/" + filename));
                filepath = "~/bookinventory/" + filename;
                SqlConnection connection = new SqlConnection(con);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                string query = $@" insert into BookMaster ([bookId],[BookName],[genre],[authorName],[publisherName],[publishDate],[language],[edition],[bookCost],
[noofpages],[bookdescription],[actualstock],[currentstock],[bookimglink]) 
                                               values ('{TBBBookID.Text.Trim()}',
                                                        '{TBBookName.Text.Trim()}', 
                                                        '{genre}',
                                                        '{DDLAuthorName.Text.Trim()}',
                                                        '{DDLPublisherName.Text.Trim()}',
                                                        '{TPublisherDate.Text.Trim()}',
                                                        '{DDLLanguage.Text.Trim()}',
                                                        '{TEdition.Text.Trim()}',
                                                        '{TBookCost.Text.Trim()}',
                                                        '{TPages.Text.Trim()}',
                                                        '{TBookDescription.Text.Trim()}',
                                                        '{TAStock.Text.Trim()}',
                                                        '{TAStock.Text.Trim()}',
                                                        '{filepath}'
                                                        )";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                GridView1.DataBind();

            }
        }
        

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}