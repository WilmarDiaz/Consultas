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
	public partial class atenderpaciente : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			ddlEspecialista.DataSource = null;

			if (!IsPostBack)
			{
				//
			}
		}

		protected void btnAtender_Click(object sender, EventArgs e)
		{			
			//Pasar paciente a consulta
			string conexion = ConfigurationManager.ConnectionStrings["ConsultaConnectionString"].ConnectionString;

			using (SqlConnection conn = new SqlConnection())
			{
				conn.ConnectionString = conexion;
				SqlCommand comm = new SqlCommand();
				comm.Connection = conn;
				comm.CommandType = CommandType.Text;
				comm.CommandText = "insert consulta(historiaclinica,idespecialista)values(@historiaClinica,@idEspecialista)";

				comm.Parameters.AddWithValue("@historiaClinica", no_historia_clinica.Value);
				comm.Parameters.AddWithValue("@idEspecialista", ddlEspecialista.SelectedValue);

				conn.Open();
				comm.ExecuteNonQuery();
				conn.Close();
			}
			
		}

		protected void btnConsultar_Click(object sender, EventArgs e)
		{
			string conexion = ConfigurationManager.ConnectionStrings["ConsultaConnectionString"].ConnectionString;

			DataTable dt = new DataTable();

			using (SqlConnection conn = new SqlConnection())
			{
				conn.ConnectionString = conexion;
				SqlCommand comm = new SqlCommand();
				comm.Connection = conn;
				comm.CommandType = CommandType.Text;
				comm.CommandText = "select nombre,edad, prioridad from paciente where historiaclinica = @historiaclinica";

				comm.Parameters.AddWithValue("@historiaclinica", no_historia_clinica.Value);
								
				SqlDataAdapter dAd = new SqlDataAdapter();
				dAd.SelectCommand = comm;
				dAd.Fill(dt);

				Session["edad"] = dt.Rows[0]["edad"].ToString();
				Session["prioridad"]= dt.Rows[0]["prioridad"].ToString();

				lblNombre.Text = " "+ dt.Rows[0]["nombre"].ToString();
				lblEdad.Text= " " + dt.Rows[0]["edad"].ToString() +" años.";
				lblPrioridad.Text= " " + dt.Rows[0]["prioridad"].ToString();
			}

			int edad = Convert.ToInt32(dt.Rows[0]["edad"].ToString());
			decimal prioridad = Convert.ToDecimal(dt.Rows[0]["prioridad"].ToString());

			if (edad <= 15 && prioridad <= 4)
			{
				//atender niños en pediatría

				//Llenar combo de especialistas de pediatría
				using (SqlConnection conn = new SqlConnection())
				{
					conn.ConnectionString = conexion;
					SqlCommand comm = new SqlCommand();
					comm.Connection = conn;
					comm.CommandType = CommandType.Text;
					comm.CommandText = "select id,nombre from especialistas where idtipoconsulta = 1";

					DataTable dtE = new DataTable();
					SqlDataAdapter dAdE = new SqlDataAdapter();
					dAdE.SelectCommand = comm;
					dAdE.Fill(dtE);

					ddlEspecialista.DataSource = dtE;
					ddlEspecialista.DataValueField = "id";
					ddlEspecialista.DataTextField = "nombre";
					ddlEspecialista.DataBind();
					ddlEspecialista.Items.Insert(0, new ListItem("Seleccione..", "-1"));
				}
			}
			else if (edad>15 && prioridad<=4)
			{
				//Llenar combo de especialistas de pediatría
				using (SqlConnection conn = new SqlConnection())
				{
					conn.ConnectionString = conexion;
					SqlCommand comm = new SqlCommand();
					comm.Connection = conn;
					comm.CommandType = CommandType.Text;
					comm.CommandText = "select id,nombre from especialistas where idtipoconsulta = 3";

					DataTable dtE = new DataTable();
					SqlDataAdapter dAdE = new SqlDataAdapter();
					dAdE.SelectCommand = comm;
					dAdE.Fill(dtE);

					ddlEspecialista.DataSource = dtE;
					ddlEspecialista.DataValueField = "id";
					ddlEspecialista.DataTextField = "nombre";
					ddlEspecialista.DataBind();
					ddlEspecialista.Items.Insert(0, new ListItem("Seleccione..", "-1"));
				}
			}
			else if(prioridad > 4)
			{
				//atención en urgencias
				//Llenar combo de especialistas de pediatría
				using (SqlConnection conn = new SqlConnection())
				{
					conn.ConnectionString = conexion;
					SqlCommand comm = new SqlCommand();
					comm.Connection = conn;
					comm.CommandType = CommandType.Text;
					comm.CommandText = "select id,nombre from especialistas where idtipoconsulta = 2";

					DataTable dtE = new DataTable();
					SqlDataAdapter dAdE = new SqlDataAdapter();
					dAdE.SelectCommand = comm;
					dAdE.Fill(dtE);

					ddlEspecialista.DataSource = dtE;
					ddlEspecialista.DataValueField = "id";
					ddlEspecialista.DataTextField = "nombre";
					ddlEspecialista.DataBind();
					ddlEspecialista.Items.Insert(0, new ListItem("Seleccione..", "-1"));
				}
			}
		}
	}
}