<%@page import="sgr.Produto"%>
<%@page import="sgr.AlterarProdutoDao"%>
<%@page import="java.util.List"%>
<html>
<head>
		<title>Cadastrar Funcionario</title>
	    <meta charset="utf-8"/>
        <link rel="stylesheet" href="Css/estiloCadastro.css"/>
</head>
<body>
    <div class="container_principal">   
    <div class="container_cadastro">
	<form>
		<table>
	      <tr>
	        <td>CPF:</td>
	        <td><input name="cpf" type="text" required></td>
	      </tr>
	      <tr>
	        <td>Senha:</td>
	        <td><input name="senha" type="text" required></td>
	      </tr>
	      <tr>
	        <td>Tipo Funcionário:</td>
	        <td>
	        	<select name="tipo" class="form-control">
				  <option value="Administrador">Administrador</option>
				  <option value="Gerente">Gerente</option>
				  <option value="Garçom">Garçom</option>
				  <option value="Cozinha">Cozinha</option>
				</select>
			</td>
	      </tr>
	      <tr>
	        <td>Nome:</td>
	        <td><input name="nome" type="text" required></td>
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
	        <td><input name="dataNasc" type="date" required></td>
	      </tr>
	      <tr>
	        <td>Salario:</td>
	        <td><input name="salario" type="number" step="any" required></td>
	      </tr>
	    </table>
	    <button name="operacao" value="cadastrar">Cadastrar</button>
    </form>
    </div>
    </div>
    <b>${msg}</b>
</body>
</html>