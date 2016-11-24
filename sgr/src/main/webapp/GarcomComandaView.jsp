<!DOCTYPE html>
<%@page import="sgr.GarcomComandaDao"%>
<%@page import="sgr.Comanda"%>
<%@page import="java.util.List"%>
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
		<h3>Visualizar Comanda Mesa N°: ${comanda_mesa}</h3>
		<form>
			<div>
				<table class="table table-bordered table-condensed">
					<thead>
						<tr>
		                    <th>ID</th>
		                    <th>Nome do Produto</th>
		                    <th>Preço</th>
		                    <th>Quant.</th>
		                    <th>Status</th>
	                    </tr>
					</thead>
					<tbody>
						<%List<Comanda> comanda = (List<Comanda>) request.getAttribute("comanda"); 
	                    if(comanda != null && !comanda.isEmpty()) {
	                    	double total=0;
	                    	for(Comanda c : comanda) {
	                    %>
	                    <tr>
	                    	<td><%=c.getCodigo_produto() %></td>
	                    	<td><%=c.getNomeProduto() %></td>
	                  	 	<td><%=c.getPreco() %></td>
	                    	<td><%=c.getQuantidade() %></td>
	                   	 	<td><%=c.getStatus() %></td>
	                    </tr>
	                    		<%total+=(c.getPreco()*c.getQuantidade()); } %>
	                    <tr>
	                    	<td scope="row" colspan="3">Total</td>
	                    	<td colspan="2"><%=total%></td>

	                    </tr>
	                    <%} else {%>
	                    <tr>
	                    	<td colspan="5">Não há pedidos Cadastrados.</td>
	                   	</tr>
	                   	<tr>
	                    	<td scope="row" colspan="3">Total</td>
	                    	<td colspan="2">0.00</td>
	                    </tr>
	                 	<%} %>
					</tbody>
				</table>
				
				<div class="col-xs-12">
					<button class="btn btn-primary btn-block" onclick="modal_novo_pedido(<%=request.getAttribute("comanda_mesa")%>)">Novo Pedido</button>
					<br>
				</div>
				<div class="col-xs-6">
					<a class="btn btn-success btn-block" href="garcom_comanda?operacao=fechar&num_mesa=<%=request.getAttribute("comanda_mesa")%>">Fechar Comanda</a>
				</div>
				<div class="col-xs-6">
					<button class="btn btn-danger btn-block" onClick="window.close()">Fechar</button>
				</div>
			</div>
		</form>
	
	</div>
</div>
</body>

</html>
