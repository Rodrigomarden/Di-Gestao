<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="sgr.Garcom"%>
<html lang="pt-BR">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mesas</title>

    <!-- Bootstrap Core CSS -->
    <link href="Garcom-Mesas/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="Garcom-Mesas/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="Garcom-Mesas/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="Garcom-Mesas/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
	<script src="js/sscript.js"></script>
</head>

<body>

<div id="wrapper">
	<div class="container-fluid">
		<div class="col-xs-12">
			<h3>Nova Comanda</h3>
		</div>
		<form>
			<div class="form-group">
      			<div class="col-xs-3">
        			<label class="label-control">Mesa N°</label>
        			<input class="form-control"name="num_mesa" type="text" readonly value="${num_mesa }" pattern="[0-9]+$" required>
      			</div>
		
				<div class="col-xs-3">
					<label class="label-control">Comanda</label>
					<input class="form-control"name="codigo_comanda" type="text" readonly value="${num_mesa }" pattern="[0-9]+$" required>
				</div>
		
				<div class="col-xs-6">
					<label class="label-control">Escolha o Garçom </label>
					<select name="garcom" class="form-control">
						<%
						List<Garcom> garcons = (List<Garcom>) request.getAttribute("nomes");
							for(int i=0; i<garcons.size(); i++) {
						%>
						<option value="<%=garcons.get(i).getCpf()%>"><%=garcons.get(i).getNome()%></option>
							<%}%>
					</select>
				</div>
				
				<div class="col-xs-6">
					<hr> 
					<button class="btn btn-success btn-block" onClick="window.close()" name="operacao" value="cadastrar">Abrir comanda</button>
				</div>
				<div class="col-xs-6">
					<hr>
					<button class="btn btn-danger btn-block" onClick="window.close()">Fechar</button>
				</div>
				
			</div>
		</form>
	</div>
</div>

</body>

</html>
