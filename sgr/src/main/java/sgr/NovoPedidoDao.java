package sgr;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class NovoPedidoDao {
	
	private static final String URL = "jdbc:derby:bd;create=true";

	public static void adicionar(int cod_comanda, int codigo_produto, int qntPedido) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "insert into registra_pedido values (?, current_date, ?, ?, current_time, 'Aguardando')";
		PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setInt(1, cod_comanda);
		pstmt.setInt(2, codigo_produto);
		pstmt.setInt(3, qntPedido);
		pstmt.executeUpdate();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
	}
	
	public static int codComanda(int num_mesa) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select codigo from comanda where numero_mesa = ? and status = 'Aberta'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		// Represneta o resultado da execução.
		ResultSet rs = pstmt.executeQuery();
		int codComanda = 0;
		if(rs.next()) {
			codComanda = rs.getInt("codigo");
		}
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return codComanda;
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