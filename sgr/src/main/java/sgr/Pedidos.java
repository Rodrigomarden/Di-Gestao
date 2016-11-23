package sgr;

public class Pedidos {
	private int codigo_comanda;
	private int codigo_produto;
	private String nomeProduto;
	private int quantidade;
	
	public Pedidos() {
		
	}

	public Pedidos(int codigo_comanda, int codigo_produto, String nomeProduto, int quantidade) {
		this.codigo_comanda = codigo_comanda;
		this.codigo_produto = codigo_produto;
		this.nomeProduto = nomeProduto;
		this.quantidade = quantidade;
	}

	public int getCodigo_comanda() {
		return codigo_comanda;
	}

	public void setCodigo_comanda(int codigo_comanda) {
		this.codigo_comanda = codigo_comanda;
	}

	public int getCodigo_produto() {
		return codigo_produto;
	}

	public void setCodigo_produto(int codigo_produto) {
		this.codigo_produto = codigo_produto;
	}

	public String getNomeProduto() {
		return nomeProduto;
	}

	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	
	
	
}
