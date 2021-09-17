using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Consultas
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// Carga solo la primera vez la lógica de los controles
			}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			string conexion = ConfigurationManager.ConnectionStrings["ConsultaConnectionString"].ConnectionString;

			PrioridadRiesgo pr = new PrioridadRiesgo();
			pr=	calcularPrioridad();

			/*
				using (SqlConnection conn=new SqlConnection())
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
				}
			*/

			// Guardar nuevo paciente

			using (SqlConnection conn = new SqlConnection())
			{
				conn.ConnectionString = conexion;
				SqlCommand comm = new SqlCommand();
				comm.Connection = conn;
				comm.CommandType = CommandType.Text;
				comm.CommandText = "INSERT paciente(historiaClinica,nombre,edad,riesgo,prioridad)values(@historiaClinica,@nombre,@edad,@riesgo,@prioridad)";

				comm.Parameters.AddWithValue("@historiaClinica", no_historia_clinica.Text);
				comm.Parameters.AddWithValue("@nombre", nombre_paciente.Text);
				comm.Parameters.AddWithValue("@edad", edad_paciente.Text);
				comm.Parameters.AddWithValue("@riesgo", pr.riesgo);
				comm.Parameters.AddWithValue("@prioridad", pr.prioridad);

				conn.Open();
				comm.ExecuteNonQuery();
				conn.Close();
			}

			//Guardar datos en cada tabla de acuerdo a la edad
			int edad = Convert.ToInt32(edad_paciente.Text);
			if (edad <= 15)
			{
				//Guarda en tbl niños
				using (SqlConnection conn = new SqlConnection())
				{
					conn.ConnectionString = conexion;
					SqlCommand comm = new SqlCommand();
					comm.Connection = conn;
					comm.CommandType = CommandType.Text;
					comm.CommandText = "INSERT pninno(historiaClinica,edad,estatura,peso,riesgo,prioridad)values(@historiaClinica,@edad,@estatura,@peso,@riesgo,@prioridad)";

					comm.Parameters.AddWithValue("@historiaClinica", no_historia_clinica.Text);
					comm.Parameters.AddWithValue("@edad", edad_paciente.Text);
					comm.Parameters.AddWithValue("@estatura", estatura_paciente.Text);
					comm.Parameters.AddWithValue("@peso", peso_paciente.Text);
					comm.Parameters.AddWithValue("@riesgo", pr.riesgo);
					comm.Parameters.AddWithValue("@prioridad", pr.prioridad);

					conn.Open();
					comm.ExecuteNonQuery();
					conn.Close();
				}
			}
			if (edad >= 16 && edad <= 40)
			{
				//Guarda en tbl joven
				using (SqlConnection conn = new SqlConnection())
				{
					conn.ConnectionString = conexion;
					SqlCommand comm = new SqlCommand();
					comm.Connection = conn;
					comm.CommandType = CommandType.Text;
					comm.CommandText = "INSERT pjoven(historiaClinica,fumador,riesgo,prioridad)values(@historiaClinica,@fumador,@riesgo,@prioridad)";

					comm.Parameters.AddWithValue("@historiaClinica", no_historia_clinica.Text);
					comm.Parameters.AddWithValue("@fumador", txtYearFumador.Text);
					comm.Parameters.AddWithValue("@riesgo", pr.riesgo);
					comm.Parameters.AddWithValue("@prioridad", pr.prioridad);

					conn.Open();
					comm.ExecuteNonQuery();
					conn.Close();
				}
			}
			if (edad >= 41)
			{
				//Guarda en tbl anciano
				using (SqlConnection conn = new SqlConnection())
				{
					conn.ConnectionString = conexion;
					SqlCommand comm = new SqlCommand();
					comm.Connection = conn;
					comm.CommandType = CommandType.Text;
					comm.CommandText = "INSERT panciano(historiaClinica,dieta,riesgo, prioridad)values(@historiaClinica,@dieta,@riesgo,@prioridad)";

					comm.Parameters.AddWithValue("@historiaClinica", no_historia_clinica.Text);
					//operador ternario para remplazar el if (antes del ?) la pregunta ; despues de la ? los valores de cada caso
					comm.Parameters.AddWithValue("@dieta", (radioSAnciano.Checked) ? 1 : 0);
					comm.Parameters.AddWithValue("@riesgo", pr.riesgo);
					comm.Parameters.AddWithValue("@prioridad", pr.prioridad);

					conn.Open();
					comm.ExecuteNonQuery();
					conn.Close();
				}
			}
		}

		private PrioridadRiesgo calcularPrioridad()
		{
			//Calcular la prioridad de los pacientes

			int edad = Convert.ToInt32(edad_paciente.Text);
			decimal prioridad = 0;
			decimal riesgo = 0;

			if (edad >= 1 && edad <= 5)
			{
				int estatura = Convert.ToInt32(estatura_paciente.Text);
				int peso = Convert.ToInt32(peso_paciente.Text);

				prioridad = estatura - peso + 3;
				riesgo = (edad * prioridad) / 100;
			}

			if (edad >= 6 && edad <= 12)
			{
				int estatura = Convert.ToInt32(estatura_paciente.Text);
				int peso = Convert.ToInt32(peso_paciente.Text);

				prioridad = estatura - peso + 2;
				riesgo = (edad * prioridad) / 100;
			}

			if (edad >= 13 && edad <= 15)
			{
				int estatura = Convert.ToInt32(estatura_paciente.Text);
				int peso = Convert.ToInt32(peso_paciente.Text);

				prioridad = estatura - peso + 1;
				riesgo = (edad * prioridad) / 100;
			}

			if (edad >= 16 && edad <= 41)
			{
				//jovenes
				if (radioSi.Checked)
				{
					int yFumador = Convert.ToInt32(txtYearFumador.Text);
					prioridad = (yFumador / 4) + 2;
					riesgo = (edad * prioridad) / 100;
				}
				else
				{
					prioridad = 2;
					riesgo = (edad * prioridad) / 100;
				}
			}

			if (edad >= 41)
			{
				//ancianos
				if ((edad >= 60 && edad <= 100) && radioSAnciano.Checked)
				{

					prioridad = (edad / 20) + 4;
					riesgo = (edad * prioridad) / 100 + Convert.ToDecimal(5.3);
				}
				else
				{
					prioridad = (edad / 30) + 3;
					riesgo = (edad * prioridad) / 100 + Convert.ToDecimal(5.3);
				}
			}

			PrioridadRiesgo pr = new PrioridadRiesgo();
			pr.riesgo = riesgo;
			pr.prioridad = prioridad;

			return pr;
		}

		public class PrioridadRiesgo
		{
			public decimal riesgo { get; set; }
			public decimal prioridad { get; set; }
		}
	}

}

	