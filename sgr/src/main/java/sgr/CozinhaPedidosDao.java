package sgr;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class CozinhaPedidosDao {
	private static final String URL = "jdbc:derby:bd;create=true";
	
	public static List<Pedidos> obterPedidos() throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select codigo_comanda, codigo_produto, nome_produto, quantidade from registra_pedido join produto on codigo_produto = codigo where status = 'Aguardando'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// Represneta o resultado da execução.
		ResultSet rs;
		rs = pstmt.executeQuery();
		List<Pedidos> listPedidos = new ArrayList<>();
		while(rs.next()) {
			int codigo_comanda = rs.getInt("codigo_comanda");
			int codigo_produto = rs.getInt("codigo_produto");
			String nomeProduto = rs.getString("nome_produto");
			int quantidade = rs.getInt("quantidade");
			Pedidos pedidos = new Pedidos(codigo_comanda, codigo_produto, nomeProduto, quantidade);
			listPedidos.add(pedidos);
			System.out.print(listPedidos.get(0).getCodigo_comanda());
		}
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return listPedidos;
	}
	
	public static void fecharPedido(int codigo_comanda, int codigo_produto) throws SQLException{
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "update registra_pedido set status = 'Pronto' where codigo_comanda = ? and codigo_produto = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, codigo_comanda);
		pstmt.setInt(2, codigo_produto);
		pstmt.executeUpdate();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
	}
}
