<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Funcionalidades2.aspx.cs" Inherits="Consultas.Funcionalidades2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>FUNCIONALIDADES2</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <div>
            <h1>Consultas 2</h1>
        </div>
        <form id="form1" runat="server">
        <div class="form-group">
            <spam><strong>Pacientes fumadores urgentes</strong></spam>
        </div>
        <asp:Button runat="server" class="btn btn-primary" Text="Consultar" ID="btnConsultar" OnClick="btnConsultar_Click"/>
            <br />
            <br />
            <asp:GridView ID="gdvResultados" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="historiaclinica" HeaderText="Historia clínica" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="edad" HeaderText="Edad" />
                    <asp:BoundField DataField="riesgo" HeaderText="Riesgo" />
                </Columns>
            </asp:GridView>
        </form>
    </div>
</body>
</html>