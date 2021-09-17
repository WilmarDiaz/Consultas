<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Consultas.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>REGISTRO DE CONSULTA</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <h1>CONSULTA</h1>
        <form id="form1" runat="server">
         <div class="form-group">
            <label for="example1">Pacientes atendidos</label>
            <input type="text" class="form-control" ID="example1" runat="server">
        </div>
        <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Profesional
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="#">Pepito Pérez</a>
            <a class="dropdown-item" href="#">Pepito Pérez2</a>
            <a class="dropdown-item" href="#">Pepito Pérez3</a>
          </div>
        </div><br/>
        <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Estado de la consulta
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
            <a class="dropdown-item" href="#">Ocupado</a>
            <a class="dropdown-item" href="#">Desocupado</a>
            <a class="dropdown-item" href="#">En espera de atención</a>
          </div>
            <asp:DropDownList runat="server" ID="ddlEstadoConsulta">

            </asp:DropDownList>
        </div><br/>
        <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Tipo de consulta
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
            <a class="dropdown-item" href="#">Pediatría</a>
            <a class="dropdown-item" href="#">Urgencias</a>
            <a class="dropdown-item" href="#">Medicina integral MI</a>
          </div>
        </div><br/>
      <asp:Button runat="server" class="btn btn-primary" Text="Registrar" OnClick="Button2_Click" />
        </form>
    </div>
</body>
</html>
