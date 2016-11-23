<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="sgr.Garcom"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Di-Gestão - Comanda</title>   
	<script src="js/sscript.js"></script>
</head>

<body>
<form>
	<h4>Nova Comanda Mesa N°: <input name="num_mesa" type="text" readonly value="${num_mesa }" pattern="[0-9]+$" required>
	Comanda: <input name="codigo_comanda" type="text" readonly value="${num_mesa }" pattern="[0-9]+$" required>
	</h4>
	
		<div>
			Escolha o Garçom: <select name="garcom" class="form-control">
			<%List<Garcom> garcons = (List<Garcom>) request.getAttribute("nomes");
				for(int i=0; i<garcons.size(); i++) {
			%>
				<option value="<%=garcons.get(i).getCpf()%>"><%=garcons.get(i).getNome()%></option>
			<%}%>
			</select>
			<button name="operacao" value="cadastrar">Abrir comanda</button>
			${msg }
		</div>
	</form>
</body>

</html>
