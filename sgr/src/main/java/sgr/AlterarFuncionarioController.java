package sgr;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/alterar_funcionario")
public class AlterarFuncionarioController extends HttpServlet {

	private String valorr(HttpServletRequest req, String param, String padrao) {
		String result = req.getParameter(param);
		if (result == null || result == "") {
			result = padrao;
		}
		return result;
	}

	private int toInt(HttpServletRequest req, String param, String padrao) {
		return Integer.parseInt(valorr(req, param, padrao));
	}
	
	private double toDouble(HttpServletRequest req, String param, String padrao) {
		return Double.parseDouble(valorr(req, param, padrao));
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String msg;
			String op = valorr(req, "operacao", "");
			String cpf = valorr(req, "cpf", "");
			String senha = valorr(req, "senha", "");
			String tipo = valorr(req, "tipo", "");
			String nome = valorr(req, "nome", "");
			String sexo = valorr(req, "sexo", "");
			String dataNasc = valorr(req, "dataNasc", "");
			double salario = toDouble(req, "salario", "0");
			
			Funcionario alterarfuncionario = new Funcionario(cpf, senha, tipo, nome, sexo, dataNasc, salario);
			if (op.equals("alterar")) {
				AlterarFuncionarioDao.alterar(cpf, senha, tipo, nome, sexo, dataNasc, salario);
				msg="Funcionario alterado com sucesso!";
			} else if (op.equals("")) {
				req.setAttribute("cpf", cpf);
				req.setAttribute("senha", senha);
				req.setAttribute("tipo", tipo);
				req.setAttribute("nome", nome);
				req.setAttribute("sexo", sexo);
				req.setAttribute("dataNasc", dataNasc);
				req.setAttribute("salario", salario);
				msg = "";
			} else {
				throw new IllegalArgumentException("Operação \"" + op + "\" não suportada.");
			}
			req.setAttribute("msg", msg);
			req.setAttribute("alterarfuncionario", alterarfuncionario);
			req.getRequestDispatcher("AlterarFuncionarioView.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}	
}