using System; 
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techpro_Project
{
    public partial class Add_College : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("data source = NAQEEB-AZIZI\\SQLEXPRESS; initial catalog = COLLEGE ;integrated security = True;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string collegeId = Request.QueryString["id"];

                    // Retrieve data based on the ID from the database and populate the text fields
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM BACCHE WHERE id = @id", conn);
                    cmd.Parameters.AddWithValue("@id", collegeId);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        name.Text = dr["college"].ToString();
                        city.Text = dr["city"].ToString();
                        state.Text = dr["state"].ToString();
                        country.Text = dr["country"].ToString();
                    }
                    dr.Close();
                    conn.Close();
                }
            }
        }


        protected void btnsave_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO BACCHE(college, city, state, country) VALUES(@college, @city, @state, @country)", conn);
            cmd.Parameters.AddWithValue("@college", name.Text);
            cmd.Parameters.AddWithValue("@city", city.Text);
            cmd.Parameters.AddWithValue("@state", state.Text);
            cmd.Parameters.AddWithValue("@country", country.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];  
            conn.Open();
         
            //string college_name = name.Text;
            //string city_name = city.Text; ;
            //string state_name = state.Text;
            //string country_name = country.Text;

            SqlCommand cmd = new SqlCommand("Update BACCHE Set college = @college_name,city=@city_name,state=@state_name,country=@country_name Where id = @id",conn);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@college_name", name.Text);
            cmd.Parameters.AddWithValue("@city_name", city.Text);
            cmd.Parameters.AddWithValue("@state_name", state.Text);
            cmd.Parameters.AddWithValue("@country_name", country.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}