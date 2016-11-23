package sgr;
import java.util.ArrayList;
import java.util.List;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class GerenciarFuncionarioDao {

	private static final String URL = "jdbc:derby:bd;create=true";
	
	public static String excluir(String cpf, String senha) throws SQLException {
		String msg = "";
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		conn.setAutoCommit(false);
		try {
			// Executar instrução SQL.
			String sql = "update funcionario_dados set status = 'Inativo' where cpf = ? and senha = ?";
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, cpf);
			pstmt.setString(2, senha);
			pstmt.executeUpdate();
			// Fechar sentença.
			pstmt.close();
			conn.commit();
		} catch(SQLException e) {
			conn.rollback();
			msg="Funcionario não pode ser excluido.";
		} finally {
			// Fechar conexão.
			conn.close();
		}
		return msg;
	}
	
	public static List<Funcionario> listar() throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select cpf, senha, tipo_funcionario, nome, sexo, data_nasc, salario from funcionario_dados where status = 'Ativo'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// Represneta o resultado da execução.
		ResultSet rs = pstmt.executeQuery();
		
		List<Funcionario> funcionarios = new ArrayList<>();
		while (rs.next()) {
			String cpf = rs.getString("cpf");
			String senha = rs.getString("senha");
			String tipo_funcionario = rs.getString("tipo_funcionario");
			String nome = rs.getString("nome");
			String sexo = rs.getString("sexo");
			String data_nasc = rs.getString("data_nasc");
			double salario = rs.getDouble("salario");
			Funcionario func = new Funcionario(cpf, senha, tipo_funcionario, nome, sexo, data_nasc, salario);
			funcionarios.add(func);
		}
	
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return funcionarios;
	}
}
