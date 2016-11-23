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

@WebServlet("/gerenciar_funcionario")
public class GerenciarFuncionarioController extends HttpServlet {

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
			String msg = "";
			String op = valor(req, "operacao", "");
			String cpf = valor(req, "cpf", "");
			String senha = valor(req, "senha", "");
			
			if (op.equals("excluir")) {
				msg = GerenciarFuncionarioDao.excluir(cpf, senha);
				req.setAttribute("msg", msg);
			} else if(op.equals("alterar")) {
				resp.sendRedirect("gerenciar_funcionario");
			} else if (op.equals("")) {
				msg = "";
			} else {
				throw new IllegalArgumentException("Operação \"" + op + "\" não suportada.");
			}
			
			List<Funcionario> funcionarios = GerenciarFuncionarioDao.listar();
			req.setAttribute("funcionarios", funcionarios);
			
			req.getRequestDispatcher("GerenciarFuncionarioView.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}	
}