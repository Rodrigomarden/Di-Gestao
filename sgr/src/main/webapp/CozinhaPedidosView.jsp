<!DOCTYPE html>
<%@page import="sgr.Pedidos"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Di-Gestï¿½o - Cozinha</title>   
	<script src="js/sscript.js"></script>
</head>

<body>
	<h4>Cozinha: </h4>
	<form>
		<div>
			<table class="tabela-produtos-mesa table">
				<thead>
					<tr style="background-color: #F2F2F2; font-weight: bold;">
						<th>Comanda</th>
	                    <th>Codigo Produto</th>
	                    <th>Nome</th>
	                    <th>Quantidade</th>
	                    <th>Finalizar</th>
                    </tr>
				</thead>
				<tbody>
					<%List<Pedidos> pedidos = (List<Pedidos>) request.getAttribute("pedidos"); 
                    if(pedidos != null && !pedidos.isEmpty()) {
                    	for(Pedidos p : pedidos) {
                    %>
                    <tr>
                    	<td><%=p.getCodigo_comanda() %></td>
                    	<td><%=p.getCodigo_produto() %></td>
                    	<td><%=p.getNomeProduto() %></td>
                    	<td><%=p.getQuantidade() %></td>
                    	<td><a href="cozinha_pedidos?operacao=finalizar&codigo_comanda=<%=p.getCodigo_comanda()%>&codigo_produto=<%=p.getCodigo_produto()%>"><img src="Mesas/icExcluirProduto.png" /></a></td>
                    </tr>
                    <%}} else {%>
                    <tr>
                    	<td></td>
                    	<td></td>
                    	<td>Não há pedidos a serem feitos.</td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <%} %>
				</tbody>
			</table>
			<div class="sair-posicao-LocProd">
										<button class="sairLoc">
											<a href="http://localhost:9090/sgr/logout"> <img style="width: 60px;"
												src="Mesas/icVoltar.png">Sair
											</a>
										</button>
									</div>
		</div>
	</form>
</body>

</html>
