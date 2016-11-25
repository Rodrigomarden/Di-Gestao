function modal_informacoes_garcom(mesaAux) {
	window.open("http://localhost:9090/sgr/garcom_mesas?operacao=informacoes&num_mesa=" + mesaAux, "_self");
}

function modal_informacoes_gerente(mesaAux) {
	window.open("http://localhost:9090/sgr/gerente_mesas?operacao=informacoes&num_mesa=" + mesaAux, "_self");
}

function modal_comanda(mesaAux) {
	window.open('garcom_comanda?num_mesa=' + mesaAux, "Garcom-Comanda","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}

function modal_nova_comanda(mesaAux) {
	window.open('nova_comanda?num_mesa=' + mesaAux, "Nova_Comanda","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}

function modal_novo_pedido(mesaAux) {
	window.open('novo_pedido?num_mesa=' + mesaAux, "Novo_Pedido","width=500, height=500, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}

function modal_alterarProduto(codigo, produto, valor, qnt_pessoas, contem) {
	window.open('alterar?codigo=' + codigo + '&produto=' + produto + '&valor=' + valor + '&qnt_pessoas=' + qnt_pessoas + '&contem=' + contem, "Alterar Produto","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}

function modal_cadastro() {
	window.open('cadastrar_produto', "Cadastro Produto","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}

function modal_fechar_comanda(mesaAux) {
	window.open("http://localhost:9090/sgr/garcom_comanda?operacao=fechar&num_mesa=" + mesaAux, "_self");
}

function modal_cadastro_funcionario() {
	window.open('cadastrar_funcionario', "Cadastro Funcionario","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}

function modal_alterarFuncionario(cpf, senha, tipo, nome, sexo, dataNasc, salario) {
	window.open('alterar_funcionario?cpf=' + cpf + '&senha=' + senha + '&tipo=' + tipo + '&nome=' + nome + '&sexo=' + sexo + '&dataNasc=' + dataNasc + '&salario=' + salario, "Alterar Funcionario","width=500, height=200, top=100, left=700, scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no");
}