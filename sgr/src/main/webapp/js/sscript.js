function modal_refresh_informacoes(mesaAux) {
	window.open("http://localhost:9090/sgr/garcom_mesas?operacao=informacoes&num_mesa=" + mesaAux, "_self");
}

function modal_comanda(mesaAux) {
	window.open('garcom_comanda?num_mesa=' + mesaAux, "Garcom-Comanda","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}

function modal_nova_comanda(mesaAux) {
	window.open('nova_comanda?num_mesa=' + mesaAux, "Nova_Comanda","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}

function modal_novo_pedido(mesaAux) {
	window.open('novo_pedido?num_mesa=' + mesaAux, "Novo_Pedido","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}