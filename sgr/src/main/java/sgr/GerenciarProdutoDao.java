package sgr;
import java.util.ArrayList;
import java.util.List;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class GerenciarProdutoDao {
	
	private static final String URL = "jdbc:derby:bd;create=true";

	public static String excluir(int codigo, String nome_produto) throws SQLException {
		String msg = "";
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		conn.setAutoCommit(false);
		try {
			// Executar instrução SQL.
			String sql = "delete from produto where codigo = ? and nome_produto = ?";
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setInt(1, codigo);
			pstmt.setString(2, nome_produto);
			pstmt.executeUpdate();
			// Fechar sentença.
			pstmt.close();
			conn.commit();
		} catch(SQLException e) {
			conn.rollback();
			msg="Produto não pode ser excluido, está sendo usado em uma comanda.";
		} finally {
			// Fechar conexão.
			conn.close();
		}
		return msg;
	}
	
	public static List<Produto> listar() throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select codigo, nome_produto, valor, quantidade_pessoas, contem from produto";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// Represneta o resultado da execução.
		ResultSet rs = pstmt.executeQuery();
		
		List<Produto> produtos = new ArrayList<>();
		while (rs.next()) {
			int codigo = rs.getInt("codigo");
			String nome_produto = rs.getString("nome_produto");
			double valor = rs.getDouble("valor");
			int quantidade_pessoas = rs.getInt("quantidade_pessoas");
			String contem = rs.getString("contem");
			Produto produt = new Produto(codigo, nome_produto, valor, quantidade_pessoas, contem);
			produtos.add(produt);
		}
	
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return produtos;
	}
}