package sgr;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CadastrarFuncionarioDao {
	
	private static final String URL = "jdbc:derby:bd;create=true";

	public static void cadastrar(String cpf, String senha, String tipo_funcionario, String nome, String sexo, String data_nasc, double salario) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		conn.setAutoCommit(false);
		try {
			String sql = "insert into funcionario_dados values (?, ?, ?, ?, ?, ? , ?, 'Ativo')";
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, cpf);
			pstmt.setString(2, senha);
			pstmt.setString(3, tipo_funcionario);
			pstmt.setString(4, nome);
			pstmt.setString(5, sexo);
			pstmt.setString(6, data_nasc);
			pstmt.setDouble(7, salario);
			pstmt.executeUpdate();
			// Fechar sentença.
			pstmt.close();
			conn.commit();
		} catch(Throwable e) {
			conn.rollback();
			throw e;
		} finally {
			// Fechar conexão.
			conn.close();
		}
	}
}
