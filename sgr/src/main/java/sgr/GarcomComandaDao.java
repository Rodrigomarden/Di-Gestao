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
		String sql = "select codigo_comanda, codigo_produto, nome_produto, valor, quantidade, r.status from comanda c join registra_pedido r on c.codigo=codigo_comanda join produto p on codigo_produto=p.codigo where numero_mesa = ? and c.data = Current_date and c.status = 'Aberta'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		// Represneta o resultado da execução.
		ResultSet rs;
		rs = pstmt.executeQuery();
		List<Comanda> listComanda = new ArrayList<>();
		while(rs.next()) {
			String codigo = Integer.toString(rs.getInt("codigo_comanda"));
			System.out.println("teste"+codigo);
			int codigo_produto = rs.getInt("codigo_produto");
			String nomeProduto = rs.getString("nome_produto");
			double preco = rs.getDouble("valor");
			int quantidade = rs.getInt("quantidade");
			String status = rs.getString("status");
			Comanda comanda = new Comanda(codigo, codigo_produto, nomeProduto, preco, quantidade, status);
			System.out.println(comanda.getCodigo_comanda());
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
