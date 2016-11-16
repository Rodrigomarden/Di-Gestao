package sgr;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class GarcomMesasDao {
	private static final String URL = "jdbc:derby:bd;create=true";
	
	public static List<Mesas> listar() throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select num_mesa, status from mesas";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// Represneta o resultado da execução.
		ResultSet rs = pstmt.executeQuery();
		
		List<Mesas> mesas = new ArrayList<>();
		while (rs.next()) {
			int num_mesa = rs.getInt("num_mesa");
			String status = rs.getString("status");
			Mesas mesa = new Mesas(num_mesa, status);
			mesas.add(mesa);
		}
		
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
				
		return mesas;		
	}
	
	public static InformacoesMesa informacoes(int num_mesa) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select codigo, nome from comanda join funcionario_dados on cpf_garçom = cpf where numero_mesa = ? and data=CURRENT_DATE and hora_inicio <= CURRENT_TIME and hora_fechamento >= CURRENT_TIME";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		// Represneta o resultado da execução.
		ResultSet rs;
		rs = pstmt.executeQuery();
		InformacoesMesa informacoesMesa = new InformacoesMesa(0, null);
		if(rs.next()) {
			informacoesMesa.setCodigo(rs.getInt("codigo"));
			informacoesMesa.setNome(rs.getString("nome"));
		}
		
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return informacoesMesa;
	}
	
	public static List<PedidoAndamento> pedidosAdamento(int num_mesa) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select nome_prodrugo from registra_pedido r join produto on codigo_produto=codigo join comanda c on codigo_comanda=c.codigo where numero_mesa = ? and r.status = 'Aguardando'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		// Represneta o resultado da execução.
		ResultSet rs;
		rs = pstmt.executeQuery();
		List<PedidoAndamento> listPedAndamento = new ArrayList<>();
		while(rs.next()) {
			String nome_Prod = rs.getString("nome_prodrugo");
			PedidoAndamento pedAndamento = new PedidoAndamento(nome_Prod);
			listPedAndamento.add(pedAndamento);
		}
		
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return listPedAndamento;
	}
	
	public static List<Comanda> obterComanda(int num_mesa) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select codigo, codigo_produto, nome_prodrugo, valor, quantidade, r.status from comanda c join registra_pedido r on c.codigo=codigo_comanda join produto p on codigo_produto=p.codigo where numero_mesa = ? and c.data = Current_date and c.status = 'Aberta'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		// Represneta o resultado da execução.
		ResultSet rs;
		rs = pstmt.executeQuery();
		List<Comanda> listComanda = new ArrayList<>();
		while(rs.next()) {
			String codigo = Integer.toString(rs.getInt("codigo"));
			int codigo_produto = rs.getInt("codigo_produto");
			String nomeProduto = rs.getString("nome_prodrugo");
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
	
}
