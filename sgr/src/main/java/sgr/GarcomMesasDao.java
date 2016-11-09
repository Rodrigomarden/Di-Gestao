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
		String sql = "select c.codigo, f.nome from comanda c join funcionario_dados f on c.cpf_garçom = f.cpf where numero_mesa = ? and data=CURRENT_DATE and hora_inicio <= CURRENT_TIME and hora_fechamento >= CURRENT_TIME";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num_mesa);
		// Represneta o resultado da execução.
		ResultSet rs;
		rs = pstmt.executeQuery();
		rs.next();
		InformacoesMesa informacoesMesa = new InformacoesMesa();
		informacoesMesa.setCodigo(rs.getInt("codigo"));
		informacoesMesa.setNome(rs.getString("nome"));
		
		// Fechar resultado.
		rs.close();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
		
		return informacoesMesa;
	}
}
