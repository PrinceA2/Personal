using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Techpro_Project
{
    public partial class College_List : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection("data source = NAQEEB-AZIZI\\SQLEXPRESS; initial catalog = COLLEGE ;integrated security = True;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                show();
            }
        }
       
        protected void show()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from BACCHE", conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            conn.Close();
            GV.DataSource = dt;
            GV.DataBind();
        }



        protected void GV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "D")
            { 
            conn.Open();
            SqlCommand cmd = new SqlCommand("Delete from BACCHE where id= '" + e.CommandArgument + "'  ", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            show();
            }

            //if (e.CommandName == "E")
            //{
            //    string id = e.CommandArgument.ToString();

            //    //Redirect to the edit page, passing the ID as a query string parameter.

            //    Response.Redirect("Add_College.aspx?id=" + e.CommandArgument);
            //}
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string id = hiddenID.Value;
            conn.Open();

            //string college_name = name.Text;
            //string city_name = city.Text; ;
            //string state_name = state.Text;
            //string country_name = country.Text;

            SqlCommand cmd = new SqlCommand("Update BACCHE Set college = @college_name,city=@city_name,state=@state_name,country=@country_name Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@college_name", name.Text);
            cmd.Parameters.AddWithValue("@city_name", city.Text);
            cmd.Parameters.AddWithValue("@state_name", state.Text);
            cmd.Parameters.AddWithValue("@country_name", country.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("College_List.aspx");
        }
    }
}