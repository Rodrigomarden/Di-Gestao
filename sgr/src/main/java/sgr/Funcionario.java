package sgr;

public class Funcionario {
	private String cpf;
	private String senha;
	private String tipo;
	private String nome;
	private String sexo;
	private String dataNasc;
	private double salario;
	
	public Funcionario() {
		
	}

	public Funcionario(String cpf, String senha, String tipo, String nome, String sexo, String dataNasc, double salario) {
		this.cpf = cpf;
		this.senha = senha;
		this.tipo = tipo;
		this.nome = nome;
		this.sexo = sexo;
		this.dataNasc = dataNasc;
		this.salario = salario;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getDataNasc() {
		return dataNasc;
	}

	public void setDataNasc(String dataNasc) {
		this.dataNasc = dataNasc;
	}

	public double getSalario() {
		return salario;
	}

	public void setSalario(double salario) {
		this.salario = salario;
	}
	
	
}
