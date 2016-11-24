<!DOCTYPE html>
<%@page import="sgr.Produto"%>
<%@page import="sgr.NovoPedidoDao"%>
<%@page import="java.util.List"%>
<html lang="pt-BR">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Novo Pedido</title>

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
		<div class="row">
						<form>
							<h3>
								<a href="novo_pedido?num_mesa=<%=request.getAttribute("num_mesa")%>">Novo Pedido</a>
								Mesa: <input name="num_mesa" type="text" readonly value="${num_mesa }" pattern="[0-9]+$" required>
							</h3>
						</div>
						<thead>
							<section>
								<input type="text" name="pesquisa" placeholder="Buscar produto (nome ou código)">
								</input>
							</section>

								<button>Buscar</button>
							<br>
							<table class="table table-bordered table-condensed">
								<thead>
									<tr>
										<th>Id</th>
										<th>Produto</th>
										<th>Valor</th>
										<th>Pessoas</th>
										<th>Informações</th>
										<th>Add</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
									boolean x = true;
			     					if (produtos != null && !produtos.isEmpty()) {
			     						String codbusca = (String)request.getAttribute("codbusca");
			     						//Verifica se é código ou produto
			     						char[] c = codbusca.toCharArray();
			     						boolean d = true;
			     						for (int i = 0; i < c.length; i++){
			     							if( !Character.isDigit( c[ i ] ) ) {
			     								d = false;
			     								break;
			     							}
			     						}
			     						if(d) {
			     							//Lista todos os produtos
				     						if(Integer.parseInt(codbusca)==0) {
				     							x = false;
				     							for (Produto p : produtos) {
			                    %>
									<tr>
										<td><%=p.getCodigo()%></td>
										<td><%=p.getNome_produto() %></td>
										<td><%=p.getValor() %></td>
										<td><%=p.getQnt_pessoas() %></td>
										<td><%=p.getContem() %></td>
										<td>
											<a href="novo_pedido?operacao=adicionar&cod_comanda=<%=request.getAttribute("codigo_comanda")%>&codigo_produto=<%=p.getCodigo()%>&num_mesa=<%=request.getAttribute("num_mesa") %>" >
												<i class="fa fa-plus-circle fa-2x"></i>
											</a>
										</td>
									</tr>
									<%				}
                  			} else {
                  				for (Produto p : produtos) {
                  					//Buscando por Código
                  					if(Integer.parseInt(codbusca)==p.getCodigo()) {
                  %>
									<tr>
										<td><%=p.getCodigo()%></td>
										<td><%=p.getNome_produto() %></td>
										<td><%=p.getValor() %></td>
										<td><%=p.getQnt_pessoas() %></td>
										<td><%=p.getContem() %></td>
										<td>
											<a href="novo_pedido?operacao=adicionar&cod_comanda=<%=request.getAttribute("codigo_comanda")%>&codigo_produto=<%=p.getCodigo()%>" >
												<i class="fa fa-plus-circle fa-2x"></i>
											</a>
										</td>
									</tr>
									<%						//Busca por codigo não existe.
               						x = false;
                  					} 
                  				}
                  			}
                  		} else {
                  			for (Produto p : produtos) {
                  				//Buscando por produto
                  				if(codbusca.equals(p.getNome_produto())) {
                  %>
									<tr>
										<td><%=p.getCodigo()%></td>
										<td><%=p.getNome_produto() %></td>
										<td><%=p.getValor() %></td>
										<td><%=p.getQnt_pessoas() %></td>
										<td><%=p.getContem() %></td>
										<td>
											<a href="novo_pedido?operacao=adicionar&cod_comanda=<%=request.getAttribute("codigo_comanda")%>&codigo_produto=<%=p.getCodigo()%>" >
												<i class="fa fa-plus-circle fa-2x"></i>
											</a>
										</td>
									</tr>
									<%
                  				//Busca por produto não existe.
                  				x = false;
                  				}
                  			}
                  		}
   						if (x) {
   				%>
									<tr>
										<td colspan="6">Codigo ou Produto não cadastrado.</td>
									</tr>
									<%
   						}
   					} else if(x){
   	            %>
									<tr>
										<td colspan="6">Não há nenhum produto cadastrado.</td>
									</tr>
									<%
      				}
                 	%>
							</table>

							<span>
								<p>Para adicionar clique uma vez no "+"</p>
							</span>
							<div>

								<a class="btn btn-primary" href="http://localhost:9090/sgr/garcom_comanda?num_mesa=<%=request.getAttribute("num_mesa") %>"> <i class="fa fa-sign-out"></i>Sair
								</a>

							</div>
					</section>
				</div>
				<br>
			</div>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
</script>

</html>