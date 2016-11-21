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

@WebServlet("/garcom_comanda")

public class GarcomComandaController extends HttpServlet {
	
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
			int num_mesa = toInt(req, "num_mesa", "0");
			List<Comanda> comanda = GarcomComandaDao.obterComanda(num_mesa);
			req.setAttribute("comanda", comanda);
			req.setAttribute("comanda_mesa", num_mesa);
			req.getRequestDispatcher("Garcom-Comanda.jsp").forward(req, resp);
		}catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}
}
