package sgr;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class CadastrarProdutoDao {
	
	private static final String URL = "jdbc:derby:bd;create=true";

	public static void cadastrar(int codigo, String nome_produto, double valor, int quantidade_pessoas, String contem) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		conn.setAutoCommit(false);
		try {
			String sql = "insert into produto values (?, ?, ?, ?, ?)";
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setInt(1, codigo);
			pstmt.setString(2, nome_produto);
			pstmt.setDouble(3, valor);
			pstmt.setInt(4, quantidade_pessoas);
			pstmt.setString(5, contem);
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
	
	public static int codValido() throws SQLException {
		int codigo = 0;
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select codigo from produto where codigo in (select MAX(codigo) from produto)";
		PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			codigo = rs.getInt("codigo");
		}
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return codigo;
	}
}
