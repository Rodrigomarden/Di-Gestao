<%@page import="sgr.Produto"%>
<%@page import="sgr.AlterarProdutoDao"%>
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
			<%Produto px = (Produto) request.getAttribute("alterarproduto"); %>
	      <tr>
	        <td>Codigo:</td>
	        <td><input name="codigo" type="text" readonly value="<%=px.getCodigo()%>" pattern="[0-9]+$" required></td>
	      </tr>
	      <tr>
	        <td>Produto:</td>
	        <td><input name="produto" type="text" value="<%=px.getNome_produto()%>" required></td>
	      </tr>
	      <tr>
	        <td>Valor:</td>
	        <td><input name="valor" type="number" step="any" value="<%=px.getValor()%>" required></td>
	      </tr>
	      <tr>
	        <td>Quantidade Pessoas:</td>
	        <td><input name="qnt_pessoas" type="number" step="any" value="<%=px.getQnt_pessoas()%>" pattern="[0-9]+$" required></td>
	      </tr>
	      <tr>
	        <td>Contem:</td>
	        <td><input name="contem" type="text" value="<%=px.getContem()%>" required></td>
	      </tr>
	    </table>
	    <button name="operacao" value="alterar">Alterar</button>
    </form>
    </div>
    </div>
    <b>${msg}</b>
</body>
</html>