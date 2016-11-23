package sgr;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cozinha_pedidos")

public class CozinhaPedidosController extends HttpServlet {
	
	private String valor(HttpServletRequest req, String param, String padrao) {
		String result = req.getParameter(param);
		if (result == null || result == "") {
			result = padrao;
		}
		return result;
	}

	private int toInt(HttpServletRequest req, String param, String padrao) {
		return Integer.parseInt(valor(req, param, padrao));
	}
	
	private double toDouble(HttpServletRequest req, String param, String padrao) {
		return Double.parseDouble(valor(req, param, padrao));
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String msg;
			String op = valor(req, "operacao", "");
			int codigo_comanda = toInt(req, "codigo_comanda", "0");
			int codigo_produto = toInt(req, "codigo_produto", "0");
			
			if(op.equals("finalizar")) {
				CozinhaPedidosDao.fecharPedido(codigo_comanda, codigo_produto);
				resp.sendRedirect("cozinha_pedidos");
			}
			
			List<Pedidos> pedidos = CozinhaPedidosDao.obterPedidos();
			req.setAttribute("pedidos", pedidos);
			req.getRequestDispatcher("CozinhaPedidosView.jsp").forward(req, resp);
		}catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}
}
