<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Consultas.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>REGISTRO DE PACIENTE</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script>
		$(function () {
			$('#edad_paciente').on('blur', function () {
				let edad = parseInt($(this).val());

				if (edad >= 0 && edad <= 15) {
					$('#dvNino').show();
					$('#dvJoven').hide();
					$('#dvAnciano').hide();
				}
				if (edad >= 16 && edad <= 40) {
					$('#dvNino').hide();
					$('#dvJoven').show();
					$('#dvAnciano').hide();
				}
				if (edad >= 41) {
					if (edad >= 60 && edad <= 100){
						$('#dvAnciano').show();
					}
					if (edad >= 40 && edad < 60) {
						$('#dvAnciano').hide();
					}
					$('#dvNino').hide();
					$('#dvJoven').hide();					
				}
			});

			$('#radioSi').on('click', function () {
				$('#dvYFumador').show();
			})

			$('#radioNo').on('click', function () {
				$('#dvYFumador').hide();
			})
		});
	</script>
</head>
<body>
	<div class="container">
		<h1>REGISTRO DE PACIENTE</h1>
		<form id="form1" runat="server">
			<div class="form-group">
				<label for="example1">Nombre Paciente</label>				
				<asp:TextBox runat="server" class="form-control" ID="nombre_paciente" placeholder="Digite el nombre del paciente" />
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Edad</label>				
				<asp:TextBox runat="server" class="form-control" ID="edad_paciente" placeholder="Digite la edad del paciente" type="number"/>
			</div>
			<div id="dvNino" style="display: none">
				<label for="exampleInputPassword1">Peso</label>
				<asp:TextBox type="number" class="form-control" id="peso_paciente" placeholder="Digite el peso (kg)" runat="server" />
				<label for="exampleInputPassword2">Estatura</label>
				<asp:TextBox type="number" class="form-control" id="estatura_paciente" placeholder="Digite la estatura (cm)" runat="server"/>
			</div>
			<div id="dvJoven" style="display: none">
				<label for="exampleInputPassword3">Es fumador?</label>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios" id="radioSi" value="S" runat="server">
					<label class="form-check-label" for="exampleRadios1">
						Sí
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios" id="radioNo" value="N">
					<label class="form-check-label" for="exampleRadios2">
						No
					</label>
				</div>
			</div>
			<div id="dvYFumador" style="display: none">
				<br />
				<label for="exampleInputPassword3">Años fumador</label>
				<asp:TextBox runat="server" ID="txtYearFumador"></asp:TextBox>
			</div>

			<div id="dvAnciano" style="display: none">
				<label for="exampleInputPassword3">Tiene dieta?</label>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios" id="radioSAnciano" value="S" runat="server">
					<label class="form-check-label" for="exampleRadios1">
						Sí
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios" id="radioNAnciano" value="N" runat="server">
					<label class="form-check-label" for="exampleRadios2">
						No
					</label>
				</div>				
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">No. de Historia Clínica</label>
				<asp:TextBox runat="server" ID="no_historia_clinica" type="number" placeholder="Digite la hostria clínica" class="form-control"/>				
			</div>
			<asp:Button runat="server" class="btn btn-primary" Text="Registrar" OnClick="Button1_Click" />
		</form>
	</div>
</body>
</html>
