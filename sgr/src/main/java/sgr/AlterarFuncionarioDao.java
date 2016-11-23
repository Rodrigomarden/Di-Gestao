package sgr;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class AlterarFuncionarioDao {
	
	private static final String URL = "jdbc:derby:bd;create=true";
	
	public static void alterar(String cpf, String senha, String tipo, String nome, String sexo, String dataNasc, double salario) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "update funcionario_dados set senha = ?, tipo_funcionario = ?, nome = ?, sexo = ?, data_nasc = ?, salario = ?  where cpf = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, senha);
		pstmt.setString(2, tipo);
		pstmt.setString(3, nome);
		pstmt.setString(4, sexo);
		pstmt.setString(5, dataNasc);
		pstmt.setDouble(6, salario);
		pstmt.setString(7, cpf);
		pstmt.executeUpdate();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
	}
}