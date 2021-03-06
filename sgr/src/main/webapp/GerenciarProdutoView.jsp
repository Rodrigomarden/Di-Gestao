<!DOCTYPE html>
<%@page import="sgr.Produto"%>
<%@page import="sgr.NovoPedidoDao"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>DI Gest�o</title>
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
										<a href="gerenciar_produto">Produto</a>
									</h3>
								</div>
								<thead>
									<section class="button-busca">
										<input type="text" name="pesquisa"
											placeholder="&#xF002 Buscar produto (nome ou c�digo)"
											size=25px></input>
									</section>
									<div class="button-buscax">
										<button>Buscar</button>
									</div>
									<br>
									<br>
									<button class="cadastrarLoc" onclick="modal_cadastro()">
											<img style="width: 50px;" src="Mesas/lapis.png">&nbsp;Cadastrar Produto
									</button>
									
									<table class="tabela-produtos-mesa table">
										<thead>
											<tr style="background-color: #F2F2F2; font-weight: bold;">
												<td>C�digo</td>
												<td>Produto</td>
												<td>Valor</td>
												<td>Qnt Pessoas</td>
												<td>Contem</td>
												<td>Alterar</td>
												<td>Excluir</td>
											</tr>
										</thead>
										<tbody>
											<%
											List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
											boolean x = true;
					     					if (produtos != null && !produtos.isEmpty()) {
					     						String codbusca = (String)request.getAttribute("codbusca");
					     						//Verifica se � c�digo ou produto
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
												<td><a href="gerenciar_produto?operacao=alterar"
													onclick="modal_alterarProduto('<%=p.getCodigo()%>', '<%=p.getNome_produto()%>', '<%=p.getValor()%>', '<%=p.getQnt_pessoas()%>', '<%=p.getContem() %>')"><img
														src="Mesas/icAlterarProduto.png" /></a></td>
												<td><a
													href="gerenciar_produto?operacao=excluir&codigo=<%=p.getCodigo()%>&nome_produto=<%=p.getNome_produto()%>"><img
														src="Mesas/icExcluirProduto.png" /></a></td>
											</tr>
											<%				}
                    			} else {
                    				for (Produto p : produtos) {
                    					//Buscando por C�digo
                    					if(Integer.parseInt(codbusca)==p.getCodigo()) {
                    %>
											<tr style="background-color: white;">
												<td><%=p.getCodigo()%></td>
												<td><%=p.getNome_produto() %></td>
												<td><%=p.getValor() %></td>
												<td><%=p.getQnt_pessoas() %></td>
												<td><%=p.getContem() %></td>
												<td><a href="gerenciar_produto?operacao=alterar"
													onclick="modal_alterarProduto('<%=p.getCodigo()%>', '<%=p.getNome_produto()%>', '<%=p.getValor()%>', '<%=p.getQnt_pessoas()%>', '<%=p.getContem() %>')"><img
														src="Mesas/icAlterarProduto.png" /></a></td>
												<td><a
													href="gerenciar_produto?operacao=excluir&codigo=<%=p.getCodigo()%>&nome_produto=<%=p.getNome_produto()%>"><img
														src="Mesas/icExcluirProduto.png" /></a></td>
											</tr>
											<%						//Busca por codigo n�o existe.
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
												<td><a href="gerenciar_produto?operacao=alterar"
													onclick="modal_alterarProduto('<%=p.getCodigo()%>', '<%=p.getNome_produto()%>', '<%=p.getValor()%>', '<%=p.getQnt_pessoas()%>', '<%=p.getContem() %>')"><img
														src="Mesas/icAlterarProduto.png" /></a></td>
												<td><a
													href="gerenciar_produto?operacao=excluir&codigo=<%=p.getCodigo()%>&nome_produto=<%=p.getNome_produto()%>"><img
														src="Mesas/icExcluirProduto.png" /></a></td>
											</tr>
											<%
                    				//Busca por produto n�o existe.
                    				x = false;
                    				}
                    			}
                    		}
     						if (x) {
     				%>
											<tr style="background-color: white;">
												<td><br></td>
												<td>Codigo ou Produto n�o cadastrado.</td>
												<td></td>
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
												<td>N�o h� nenhum produto cadastrado.</td>
												<td></td>
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
											<td><br></td>
										</tr>

									</table>
					<% if(request.getAttribute("msg") != null) {%>
							<script>alert("${msg}")</script>
					<%}%>
									<span class="chek">&nbsp;&nbsp;&nbsp;&nbsp;
									</span>
									<div class="sair-posicao-LocProd">
										<button class="sairLoc">
											<a href="http://localhost:9090/sgr/gerente_mesas"> <img style="width: 60px;"
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