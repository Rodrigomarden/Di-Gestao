<%@page import="sgr.Produto"%>
<%@page import="sgr.AlterarProdutoDao"%>
<%@page import="java.util.List"%>
<html>
<head>
		<title>Cadastrar</title>
	    <meta charset="utf-8"/>
        <link rel="stylesheet" href="Css/estiloCadastro.css"/>
</head>
<body>
    <div class="container_principal">   
    <div class="container_cadastro">
	<form>
		<table>
	      <tr>
	        <td>Codigo:</td>
	        <td><input name="codigo" type="text" readonly value="<%=(Integer.parseInt(request.getAttribute("codigo").toString())+1) %>" pattern="[0-9]+$" required></td>
	      </tr>
	      <tr>
	        <td>Produto:</td>
	        <td><input name="nome_produto" type="text" required></td>
	      </tr>
	      <tr>
	        <td>Valor:</td>
	        <td><input name="valor" type="number" step="any" required></td>
	      </tr>
	      <tr>
	        <td>Quantidade Pessoas:</td>
	        <td><input name="quantidade_pessoas" type="number" step="any" pattern="[0-9]+$" required></td>
	      </tr>
	      <tr>
	        <td>Contem:</td>
	        <td><input name="contem" type="text" required></td>
	      </tr>
	    </table>
	    <button name="operacao" value="cadastrar">Cadastrar</button>
    </form>
    </div>
    </div>
    <b>${msg}</b>
</body>
</html>