function excluir(){
	decisao=confirm("Deseja excluir o pedido 1?");
	if(decisao){
		alert("Pedido excluido com sucesso!!!");
	}
	else alert("Exclusao cancelada!!!")
}
function modal_dinheiro()
{
	window.open('PagamentoDinheiro.jsp',"Pagamento dinheiro","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}

function modal_debito()
{
	window.open('PagamentoCartaoDebito.jsp',"Pagamento dinheiro","width=500, height=500, top=100, left=850, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}
function modal_credito()
{
	window.open('PagamentoCartaoCredito.jsp',"Pagamento dinheiro","width=500, height=500, top=100, left=850, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}
function modal_cheque()
{
	window.open('PagamentoCheque.jsp',"Pagamento dinheiro","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}
function modal_vale()
{
	window.open('PagamentoCheque.jsp',"Pagamento dinheiro","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}
function modal_cadastro() 
{
	window.open('cadastro', "Cadastro Produto","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}
function modal_alterarProduto(codigo, produto, precounit, estoque)
{
	window.open('alterar?codigo=' + codigo + '&produto=' + produto + '&precounit=' + precounit + '&estoque=' + estoque, "Alterar Produto","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}
function help(){
	alert("Olaaa!!!.")
}
function taxa_entrega(){
	alert("Para finalizar o pagamento e necessario selecionar a taxa de entrega.");
}