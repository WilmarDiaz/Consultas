using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Consultas
{
    public partial class Funcionalidades2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void btnConsultar_Click(object sender, EventArgs e)
		{
			string conexion = ConfigurationManager.ConnectionStrings["ConsultaConnectionString"].ConnectionString;

			using (SqlConnection conn = new SqlConnection())
			{
				conn.ConnectionString = conexion;
				SqlCommand comm = new SqlCommand();
				comm.Connection = conn;
				comm.CommandType = CommandType.Text;
				comm.CommandText = "select pac.historiaclinica,pac.nombre,pac.riesgo,pac.edad from paciente pac inner join pjoven pjo on pac.historiaclinica = pjo.historiaclinica" +
					" where pjo.fumador=1 order by pac.riesgo desc";				

				DataTable dt = new DataTable();
				SqlDataAdapter dAd = new SqlDataAdapter();
				dAd.SelectCommand = comm;
				dAd.Fill(dt);

				gdvResultados.DataSource = dt;
				gdvResultados.DataBind();
			}
		}
	}
}