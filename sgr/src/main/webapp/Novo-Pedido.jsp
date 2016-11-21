<!DOCTYPE html>
<%@page import="sgr.Produto"%>
<%@page import="sgr.NovoPedidoDao"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>DI Gestão</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="Css/sb-adm.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="Css/estiloProduto.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
	</script>
<script src="js/sscript.js"></script>
</head>
<body>

				<form>
					<div class="container-geral">
						<div class="container-fluid">
							<section class="produtos-mesa">
								<div class="row">
									<h3 class="posicao-LocProd">
										<a href="novo_pedido?num_mesa=<%=request.getAttribute("num_mesa")%>">Novo Pedido</a>
										Mesa: <input name="num_mesa" type="text" readonly value="${num_mesa }" pattern="[0-9]+$" required>
									</h3>
								</div>
								<thead>
									<section class="button-busca">
										<input type="text" name="pesquisa"
											placeholder="&#xF002 Buscar produto (nome ou código)"
											size=25px></input>
									</section>
									<div class="button-buscax">
										<button>Buscar</button>
									</div>
									<br>
									<br>

									<table class="tabela-produtos-mesa table">
										<thead>
											<tr style="background-color: #F2F2F2; font-weight: bold;">
												<td>Código</td>
												<td>Produto</td>
												<td>Valor</td>
												<td>Qnt Pessoas</td>
												<td>Contem</td>
												<td>Adicionar</td>
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
											<tr style="background-color: white;">
												<td><%=p.getCodigo()%></td>
												<td><%=p.getNome_produto() %></td>
												<td><%=p.getValor() %></td>
												<td><%=p.getQnt_pessoas() %></td>
												<td><%=p.getContem() %></td>
												<td><a href="novo_pedido?operacao=adicionar&cod_comanda=<%=request.getAttribute("codigo_comanda")%>&codigo_produto=<%=p.getCodigo()%>&num_mesa=<%=request.getAttribute("num_mesa") %>" ><img src="Mesas/icAdicionar.png" /></a></td>
											</tr>
											<%				}
                    			} else {
                    				for (Produto p : produtos) {
                    					//Buscando por Código
                    					if(Integer.parseInt(codbusca)==p.getCodigo()) {
                    %>
											<tr style="background-color: white;">
												<td><%=p.getCodigo()%></td>
												<td><%=p.getNome_produto() %></td>
												<td><%=p.getValor() %></td>
												<td><%=p.getQnt_pessoas() %></td>
												<td><%=p.getContem() %></td>
												<td><a href="novo_pedido?operacao=adicionar&cod_comanda=<%=request.getAttribute("codigo_comanda")%>&codigo_produto=<%=p.getCodigo()%>" ><img src="Mesas/icAdicionar.png" /></a></td>
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
											<tr style="background-color: white;">
												<td><%=p.getCodigo()%></td>
												<td><%=p.getNome_produto() %></td>
												<td><%=p.getValor() %></td>
												<td><%=p.getQnt_pessoas() %></td>
												<td><%=p.getContem() %></td>
												<td><a href="novo_pedido?operacao=adicionar&cod_comanda=<%=request.getAttribute("codigo_comanda")%>&codigo_produto=<%=p.getCodigo()%>" ><img src="Mesas/icAdicionar.png" /></a></td>
											</tr>
											<%
                    				//Busca por produto não existe.
                    				x = false;
                    				}
                    			}
                    		}
     						if (x) {
     				%>
											<tr style="background-color: white;">
												<td><br></td>
												<td>Codigo ou Produto não cadastrado.</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<%
     						}
     					} else if(x){
     	            %>
											<tr style="background-color: white;">
												<td><br></td>
												<td>Não há nenhum produto cadastrado.</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<%
        				}
                   	%>
										</tbody>
										<tr style="background-color: #F2F2F2;">
											<td><br></td>
											<td><br></td>
											<td><br></td>
											<td><br></td>
											<td><br></td>
											<td><br></td>
										</tr>

									</table>

									<span class="chek">&nbsp;&nbsp;&nbsp;&nbsp;
										<h5>Para adicionar clique uma vez no "+1."</h5>
									</span>
									<div class="sair-posicao-LocProd">
										<button class="sairLoc">
											<a href="http://localhost:9090/sgr/garcom_comanda?num_mesa=<%=request.getAttribute("num_mesa") %>"> <img style="width: 60px;"
												src="Mesas/icVoltar.png">Sair
											</a>
										</button>
									</div>
							</section>
						</div>
						</p>
						<br>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
</script>

</html>