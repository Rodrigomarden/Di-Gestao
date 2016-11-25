<!DOCTYPE html>
<%@page import="sgr.GarcomComandaDao"%>
<%@page import="sgr.Comanda"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Di-Gestï¿½o - Comanda</title>   
	<script src="js/sscript.js"></script>
</head>

<body>
	<h4>Visualizar Comanda Mesa N°: ${comanda_mesa}</h4>
	<form>
		<div>
			<table>
				<thead>
					<tr>
	                    <th>ID</th>
	                    <th>Nome</th>
	                    <th>Preço</th>
	                    <th>Quantidade</th>
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
                    	<td></td>
                    	<th>Total</th>
                    	<td><%=total%></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <%} else {%>
                    <tr>
                   		<td></td>
                    	<td>Não há pedidos Cadastrados.</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                   	</tr>
                   	<tr>
                    	<td></td>
                    	<th>Total</th>
                    	<td>0.00</td>
                    	<td></td>
                    	<td></td>
                    </tr>
                 	<%} %>
				</tbody>
			</table>
			<button href="garcom_comanda?num_mesa=<%=request.getAttribute("comanda_mesa") %>" onclick="modal_novo_pedido(<%=request.getAttribute("comanda_mesa")%>)">Novo Pedido</button>
			<a href="garcom_comanda?operacao=fechar&num_mesa=<%=request.getAttribute("comanda_mesa")%>">Fechar Comanda</a>
		</div>
	</form>
</body>

</html>
