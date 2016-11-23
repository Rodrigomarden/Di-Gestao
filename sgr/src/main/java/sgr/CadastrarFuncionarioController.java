package sgr;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cadastrar_funcionario")
public class CadastrarFuncionarioController extends HttpServlet {

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
			String cpf = valor(req, "cpf", "");
			String senha = valor(req, "senha", "");
			String tipo = valor(req, "tipo", "");
			String nome = valor(req, "nome", "");
			String sexo = valor(req, "sexo", "");
			String dataNasc = valor(req, "dataNasc", "");
			double salario = toDouble(req, "salario", "0");
			
			if (op.equals("cadastrar")) {
				CadastrarFuncionarioDao.cadastrar(cpf, senha, tipo, nome, sexo, dataNasc, salario);
				msg = "Funcionario cadastrado com sucesso.";
			} else if (op.equals("")) {
				msg = "";
			} else {
				throw new IllegalArgumentException("Operação \"" + op + "\" não suportada.");
			}
			req.setAttribute("msg", msg);
			req.getRequestDispatcher("CadastrarFuncionarioView.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}	
}