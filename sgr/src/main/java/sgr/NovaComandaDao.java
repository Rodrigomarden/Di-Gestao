package sgr;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class NovaComandaDao {

	private static final String URL = "jdbc:derby:bd;create=true";
	
	public static List<Garcom> nomeGarcom() throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select nome, cpf from funcionario_dados where tipo_funcionario = 'Garçom'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// Represneta o resultado da execução.
		ResultSet rs = pstmt.executeQuery();
		List<Garcom> garcons = new ArrayList<>();
		while(rs.next()) {
			Garcom garcom = new Garcom(rs.getString("cpf") ,rs.getString("nome"));
			garcons.add(garcom);
		}
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return garcons;
	}
	
	public static void cadastrar(int codigo, int numero_mesa, String cpf) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		conn.setAutoCommit(false);
		try {
			String sql = "insert into comanda values (?, current_date, ?, ?, current_time, 'Aberta')";
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setInt(1, codigo);
			pstmt.setInt(2, numero_mesa);
			pstmt.setString(3, cpf);
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
	
	public static int maiorCodigoComanda() throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "select codigo from comanda where codigo in (select MAX(codigo) from comanda where data = current_date)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// Represneta o resultado da execução.
		ResultSet rs = pstmt.executeQuery();
		int codigo = 0;
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
	
	public static void alterarStatusMesa(int num_mesa) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "update mesas set status = 'Ocupada' where num_mesa = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		pstmt.executeUpdate();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
	}
}
