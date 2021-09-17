using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace Consultas
{
	public partial class WebForm2 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				string conexion = ConfigurationManager.ConnectionStrings["ConsultaConnectionString"].ConnectionString;

				using (SqlConnection conn = new SqlConnection())
				{
					conn.ConnectionString = conexion;
					SqlCommand comm = new SqlCommand();
					comm.Connection = conn;
					comm.CommandType = CommandType.Text;
					comm.CommandText = "select id,estado from estadoconsulta";

					DataTable dt = new DataTable();
					SqlDataAdapter dAd = new SqlDataAdapter();
					dAd.SelectCommand = comm;
					dAd.Fill(dt);

					ddlEstadoConsulta.DataSource = dt;
					ddlEstadoConsulta.DataTextField = "estado";
					ddlEstadoConsulta.DataValueField = "id";
					ddlEstadoConsulta.DataBind();
				}

				
			}
		}
		protected void Button2_Click(object sender, EventArgs e)
		{
			example1.Value = "30";
		}
	}
}