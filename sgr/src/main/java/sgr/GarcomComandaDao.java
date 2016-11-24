package sgr;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class GarcomComandaDao {
	
	private static final String URL = "jdbc:derby:bd;create=true";
	
	public static List<Comanda> obterComanda(int num_mesa) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select codigo_comanda, codigo_produto, nome_produto, valor, quantidade, r.status from comanda c join registra_pedido r on c.codigo=codigo_comanda join produto p on codigo_produto=p.codigo where numero_mesa = ? and c.data = Current_date and c.status = 'Aberta' and r.data = Current_date";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		// Represneta o resultado da execução.
		ResultSet rs;
		rs = pstmt.executeQuery();
		List<Comanda> listComanda = new ArrayList<>();
		while(rs.next()) {
			String codigo = Integer.toString(rs.getInt("codigo_comanda"));
			int codigo_produto = rs.getInt("codigo_produto");
			String nomeProduto = rs.getString("nome_produto");
			double preco = rs.getDouble("valor");
			int quantidade = rs.getInt("quantidade");
			String status = rs.getString("status");
			Comanda comanda = new Comanda(codigo, codigo_produto, nomeProduto, preco, quantidade, status);
			listComanda.add(comanda);
		}
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return listComanda;
	}
	
	public static void fecharMesa(int num_mesa) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "update mesas set status = 'Livre' where num_mesa = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		
		pstmt.executeUpdate();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
	}
	
	public static void fecharComanda(int num_mesa) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "update comanda set status = 'Fechada' where numero_mesa = ? and status = 'Aberta'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		
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
	
	public static void fecharPedidos(int codigo_comanda) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "update registra_pedido set status = 'Entregue' where codigo_comanda = ? and data = current_date";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, codigo_comanda);
		
		pstmt.executeUpdate();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
	}
}
