<%@page import="sgr.Funcionario"%>
<%@page import="sgr.AlterarFuncionarioDao"%>
<%@page import="java.util.List"%>
<html>
<head>
		<title>Alterar</title>
	    <meta charset="utf-8"/>
        <link rel="stylesheet" href="Css/estiloCadastro.css"/>
</head>
<body>
    <div class="container_principal">   
    <div class="container_cadastro">
	<form>
		<table>
			<%Funcionario fx = (Funcionario) request.getAttribute("alterarfuncionario"); %>
	      <tr>
	        <td>CPF:</td>
	        <td><input name="cpf" type="text" readonly value="<%=fx.getCpf()%>" required></td>
	      </tr>
	      <tr>
	        <td>Senha:</td>
	        <td><input name="senha" type="text" value="<%=fx.getSenha()%>" required></td>
	      </tr>
	      <tr>
	        <td>Tipo:</td>
	        <td>
	        	<select name="tipo" class="form-control">
				  <option value="Administrador">Administrador</option>
				  <option value="Gerente">Gerente</option>
				  <option value="Garçom">Garçom</option>
				</select>
			</td>
	      </tr>
	      <tr>
	        <td>Nome: </td>
	        <td><input name="nome" type="text"  value="<%=fx.getNome()%>" required></td>
	      </tr>
	      <tr>
	        <td>Sexo:</td>
	        <td>
	        	<select name="sexo" class="form-control">
				  <option value="M">Masculino</option>
				  <option value="F">Feminino</option>
				</select>
			</td>
	      </tr>
	      <tr>
	        <td>Data Nascimento:</td>
	        <td><input name="dataNasc" type="date" value="<%=fx.getDataNasc()%>" required></td>
	      </tr>
	      <tr>
	        <td>Salario:</td>
	        <td><input name="salario" type="number" step="any" value="<%=fx.getSalario()%>" required></td>
	      </tr>
	    </table>
	    <button name="operacao" value="alterar">Alterar</button>
    </form>
    </div>
    </div>
    <b>${msg}</b>
</body>
</html>