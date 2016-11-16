package sgr;

public class Comanda {
	private String codigo_comanda;
	private int codigo_produto;
	private String nomeProduto;
	private double preco;
	private int quantidade;
	private String status;
	
	public Comanda() {
		
	}

	public Comanda(String codigo_comanda ,int codigo_produto, String nomeProduto, double preco, int quantidade, String status) {
		this.codigo_comanda=codigo_comanda;
		this.codigo_produto = codigo_produto;
		this.nomeProduto = nomeProduto;
		this.preco = preco;
		this.quantidade = quantidade;
		this.status = status;
	}

	public String getCodigo_comanda() {
		return codigo_comanda;
	}

	public void setCodigo_comanda(String codigo_comanda) {
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

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
