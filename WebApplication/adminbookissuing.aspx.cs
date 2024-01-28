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
    public partial class adminbookissuing : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            TBMemberID.Text = Session["username"].ToString();
            TBMemberName.Text = Session["Fullname"].ToString();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getmember();
            getbook();
            TBStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            TBEndDate.Text = DateTime.Now.AddDays(3).ToString("yyyy-MM-dd");

        }
        private void getmember()
        {
            try
            {
                SqlConnection conn = new SqlConnection(con);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string s = $"select fullname from Membermaster where memberid='{TBMemberID.Text}'";
                SqlCommand cmd = new SqlCommand(s, conn);
                TBMemberName.Text = cmd.ExecuteScalar().ToString();
                conn.Close();
            }
            catch
            { }
        }
        private void getbook()
        {
            try
            {

                SqlConnection conn = new SqlConnection(con);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string s = $"select bookname from bookmaster where bookid='{TBBookID.Text}'";
                SqlCommand cmd = new SqlCommand(s, conn);
                TBBookName.Text = cmd.ExecuteScalar().ToString();
                conn.Close();
            }
            catch { }

        }
        private bool checkbook()
        {
            try
            {

                SqlConnection conn = new SqlConnection(con);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string s = $"select * from bookmaster where bookid='{TBBookID.Text}' and currentstock > 0";
                SqlCommand cmd = new SqlCommand(s, conn);
                string id = "";
                id = cmd.ExecuteScalar().ToString();
                conn.Close();
                if (!String.IsNullOrEmpty(id))
                    return true;
                else
                    return false;
                

            }
            catch
            {
                return false;
            }
        }



        protected void BtnIssue_Click(object sender, EventArgs e)
        {
            if(checkbook())
            {
                SqlConnection conn = new SqlConnection(con);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string s = $"insert into BookIssue (memberID,membername,bookid,bookname,issuedate,duedate) " +
                    $"values ('{TBMemberID.Text}','{TBMemberName.Text}','{TBBookID.Text}','{TBBookName.Text}','{TBStartDate.Text}','{TBEndDate.Text}')";
                SqlCommand command = new SqlCommand(s, conn);
                command.ExecuteNonQuery();
                string update = $"update BookMaster set currentstock=currentstock-1 where bookid='{TBBookID.Text}' ";
                SqlCommand command1 = new SqlCommand(update, conn);
                command1.ExecuteNonQuery();
                conn.Close();
                GridView1.DataBind();


            }
        }
        private bool checkmemberbook()
        {
            try
            {

                SqlConnection conn = new SqlConnection(con);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string s = $"select * from BookIssue where bookid='{TBBookID.Text}' and memberid='{TBMemberID.Text}'";
                SqlCommand cmd = new SqlCommand(s, conn);
                string id = "";
                id = cmd.ExecuteScalar().ToString();
                conn.Close();
                if (!String.IsNullOrEmpty(id))
                    return true;
                else
                    return false;


            }
            catch
            {
                return false;
            }
        }
        protected void BtnReturn_Click(object sender, EventArgs e)
        {
            if(checkmemberbook())
            {

                SqlConnection conn = new SqlConnection(con);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string s = $"Delete from bookissue where  bookid='{TBBookID.Text}' and memberid='{TBMemberID.Text}' ";
                SqlCommand command = new SqlCommand(s, conn);
                command.ExecuteNonQuery();
                string update = $"update BookMaster set currentstock=currentstock+1 where bookid='{TBBookID.Text}' ";
                SqlCommand command1 = new SqlCommand(update, conn);
                command1.ExecuteNonQuery();
                conn.Close();
                GridView1.DataBind();

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           /* if(e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                if(dt<DateTime.Today)
                {
                    e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                }
            }*/
        }
    }
}