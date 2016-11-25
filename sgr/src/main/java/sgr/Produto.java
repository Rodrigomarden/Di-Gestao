package sgr;

public class Produto {
	private int codigo;
	private String nome_produto;
	private double valor;
	private int qnt_pessoas;
	private String contem;
	
	public Produto() {
		
	}
	
	public Produto(int codigo, String nome_produto, double valor, int qnt_pessoas, String contem) {
		this.codigo = codigo;
		this.nome_produto = nome_produto;
		this.valor = valor;
		this.qnt_pessoas = qnt_pessoas;
		this.contem = contem;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNome_produto() {
		return nome_produto;
	}

	public void setNome_produto(String nome_produto) {
		this.nome_produto = nome_produto;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public int getQnt_pessoas() {
		return qnt_pessoas;
	}

	public void setQnt_pessoas(int qnt_pessoas) {
		this.qnt_pessoas = qnt_pessoas;
	}

	public String getContem() {
		return contem;
	}

	public void setContem(String contem) {
		this.contem = contem;
	}
	
}
