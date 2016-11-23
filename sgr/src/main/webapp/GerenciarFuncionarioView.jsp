<!DOCTYPE html>
<%@page import="sgr.Funcionario"%>
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
										<a href="gerenciar_funcionario">Funcionários</a>
									</h3>
								</div>
								<br>
								<br>
								<button class="cadastrarLoc" onclick="modal_cadastro_funcionario()">
											<img style="width: 50px;" src="Mesas/lapis.png">&nbsp;Cadastrar Funcionario
									</button>
								<thead>
									<br>
									<br>
									
									
									<table class="tabela-produtos-mesa table">
										<thead>
											<tr style="background-color: #F2F2F2; font-weight: bold;">
												<td>CPF</td>
												<td>Senha</td>
												<td>Tipo Funcionário</td>
												<td>Nome</td>
												<td>Sexo</td>
												<td>Data Nascimento</td>
												<td>Salário</td>
												<td>Alterar</td>
												<td>Excluir</td>
											</tr>
										</thead>
										<tbody>
											<%
											List<Funcionario> funcionarios = (List<Funcionario>) request.getAttribute("funcionarios");
					     					if (funcionarios != null && !funcionarios.isEmpty()) {
					     						for (Funcionario f : funcionarios) {
					                    %>
											<tr style="background-color: white;">
												<td><%=f.getCpf()%></td>
												<td><%=f.getSenha() %></td>
												<td><%=f.getTipo() %></td>
												<td><%=f.getNome() %></td>
												<td><%=f.getSexo() %></td>
												<td><%=f.getDataNasc() %></td>
												<td><%=f.getSalario() %></td>
												<td><a href="gerenciar_funcionario?operacao=alterar"
													onclick="modal_alterarFuncionario('<%=f.getCpf()%>', '<%=f.getSenha()%>', '<%=f.getTipo()%>', '<%=f.getNome()%>', '<%=f.getSexo() %>', '<%=f.getDataNasc() %>', '<%=f.getSalario() %>')"><img
														src="Mesas/icAlterarProduto.png" /></a></td>
												<td><a
													href="gerenciar_funcionario?operacao=excluir&cpf=<%=f.getCpf()%>&senha=<%=f.getSenha()%>"><img
														src="Mesas/icExcluirProduto.png" /></a></td>
											</tr>
											<%				}
                    			}%>
										</tbody>
										<tr style="background-color: #F2F2F2;">
											<td><br></td>
											<td><br></td>
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
											<a href="http://localhost:9090/sgr/logout"> <img style="width: 60px;"
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