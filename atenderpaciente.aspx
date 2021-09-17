<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="atenderpaciente.aspx.cs" Inherits="Consultas.atenderpaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Atender pacientes</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>ATENDER PACIENTE</h1>
		<form id="form1" runat="server">
			<div class="form-group">				
				<b>Historia clínica:</b>
				<input type="number" class="form-control" id="no_historia_clinica" placeholder="Digite el número de la historia clínica" runat="server">
			</div>
			<asp:Button runat="server" class="btn btn-primary" Text="Consultar" ID="btnConsultar" OnClick="btnConsultar_Click" />
			<br />
			<br />
			<div class="form-group">
				<b>Nombre:</b><asp:Label runat="server" ID="lblNombre" /><br />
				<b>Edad:</b><asp:Label runat="server" ID="lblEdad" /><br />
				<b>Prioridad:</b><asp:Label runat="server" ID="lblPrioridad" /><br />
			</div>
			<br />
			<asp:DropDownList runat="server" ID="ddlEspecialista"></asp:DropDownList><br /><br />
			<asp:Button runat="server" class="btn btn-primary" Text="Atender paciente" ID="btnAtender" OnClick="btnAtender_Click" />
		</form>
	</div>
</body>
</html>
