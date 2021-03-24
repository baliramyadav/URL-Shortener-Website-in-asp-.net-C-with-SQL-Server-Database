using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    string URL = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            txtURL.Text = string.Empty;
            txtURL.Focus();
            BindDataIntoGrid();
        }
    }
    //Connection
    private string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["URLShort"].ConnectionString;
    }

    //Insert method
    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    //short URL button click
    protected void btnShortURL_Click(object sender, EventArgs e)
    {
        
        if (txtURL.Text != string.Empty || txtURL.Text.Length > 0)
        {
            string longUrl = "";
            longUrl = txtURL.Text;
            // Get the URL  
            URL = RandomURL.GetURL();

            if (IsDuplicate())
            {
                Response.Write("<script>alert('try again')</script>");
                //URL = RandomURL.GetURL();
            }
            else
            {
                Short_URL_AND_InsertIntoDatabase();
                BindDataIntoGrid();
            }
        }
        else
        {
            Response.Write("<script>alert('Enter URL')</script>");
            txtURL.Text = string.Empty;
            txtURL.Focus();
        }


    }


    //----Check Duplicate Short URL
    private bool IsDuplicate()
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("set nocount on;select distinct ShortURL from tblURLInfo with(nolock) where ShortURL=@ShortURL", con);
            cmd.Parameters.AddWithValue("@ShortURL", URL);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script type='text/javascript'>alert('" + ex.Message + "');</script>");
            return false;
        }
    }

    //-------Short URL and save into database
    private void Short_URL_AND_InsertIntoDatabase()
    {
        SqlCommand cmd = new SqlCommand("Insert into tblURLInfo(LongURL,ShortURL) values(@LongURL,@ShortURL)");
        cmd.Parameters.AddWithValue("@LongURL", txtURL.Text.Trim());
        cmd.Parameters.AddWithValue("@ShortURL", URL);
        if (InsertUpdateData(cmd))
        {
            Response.Write("<script type='text/javascript'>alert('URL Short Successful');</script>");
            txtURL.Text = string.Empty;
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('Invalid URL Operation Faild');</script>");
            txtURL.Text = string.Empty;
        }

    }




    //---Display Data
    private void BindDataIntoGrid()
    {
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand("set nocount on; select UrlID,LongURL,'www.cb.in/' +ShortURL as ShortURL from tblURLInfo with(nolock) order by UrlID desc", con))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Close();
                }
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                    else
                    {
                        GridView1.DataSource = null;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }

    

    



}