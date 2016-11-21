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

	@WebServlet("/nova_comanda")

	public class NovaComandaController extends HttpServlet {
		
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
		
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				String msg = "";
				String op = valor(req, "operacao", "");
				String garcom = valor(req, "garcom", "321");
				int num_mesa = toInt(req, "num_mesa", "0");
				if (op.equals("cadastrar")) {
					NovaComandaDao.cadastrar(NovaComandaDao.maiorCodigoComanda()+1, num_mesa, garcom);
					NovaComandaDao.alterarStatusMesa(num_mesa);
					msg = "Comanda criada com sucesso.";
				}
				List<Garcom> gacons = NovaComandaDao.nomeGarcom();
				req.setAttribute("nomes", gacons);
				req.setAttribute("num_mesa", num_mesa);
				req.getRequestDispatcher("Nova_Comanda.jsp").forward(req, resp);
			}catch (Exception e) {
				e.printStackTrace(resp.getWriter());
			}
		}
}