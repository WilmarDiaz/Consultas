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
    public partial class Funcionalidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void btnConsultar_Click(object sender, EventArgs e)
		{
			//Consultar y llenar la grilla a partir de la historia clinica
			string conexion = ConfigurationManager.ConnectionStrings["ConsultaConnectionString"].ConnectionString;
			int historiaclinica = Convert.ToInt32(no_historia_clinica.Value);

			using (SqlConnection conn = new SqlConnection())
			{
				conn.ConnectionString = conexion;
				SqlCommand comm = new SqlCommand();
				comm.Connection = conn;
				comm.CommandType = CommandType.Text;
				comm.CommandText = "select pac.historiaclinica,pac.nombre,pac.riesgo,pac.edad from paciente pac left join pninno pni on pac.historiaclinica = pni.historiaclinica" +
					" left join pjoven pjo on pac.historiaclinica = pjo.historiaclinica left join panciano pan on pac.historiaclinica = pan.historiaclinica" +
					" where pac.historiaclinica <> @historiaclinica order by pac.riesgo desc";

				comm.Parameters.AddWithValue("@historiaclinica", historiaclinica);

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