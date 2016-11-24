package sgr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
	
	private static final String URL = "jdbc:derby:bd;create=true";

	public static boolean comparar(String usuario, String senha) throws SQLException {
		boolean autenticador = false;
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select cpf, senha FROM Funcionario_Dados WHERE cpf=? AND senha=? AND status='Ativo'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, usuario);
		pstmt.setString(2, senha);
		ResultSet rs;
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String user = rs.getString("cpf");
			String password = rs.getString("senha");
			autenticador = true;
		} else {
			// Fechar resultado.
			rs.close();
			// Fechar sentença.
			pstmt.close();
			// Fechar conexão.
			conn.close();
			return autenticador;
		}
		return autenticador;
	}
	
	public static String tipo(String usuario, String senha) throws SQLException {
		String tipo = "";
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select tipo_funcionario FROM Funcionario_Dados WHERE cpf=? AND senha=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, usuario);
		pstmt.setString(2, senha);
		ResultSet rs;
		rs = pstmt.executeQuery();
		if (rs.next()) {
			tipo = rs.getString("tipo_funcionario");
		}
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		return tipo;
	}
}