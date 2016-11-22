package sgr;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cadastrar_produto")
public class CadastrarProdutoController extends HttpServlet {

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
			int codigo = toInt(req, "codigo", "0");
			String nome_produto = valor(req, "nome_produto", "");
			double valor = toDouble(req, "valor", "0");
			int quantidade_pessoas = toInt(req, "quantidade_pessoas", "0");
			String contem = valor(req, "contem", "");
			
			if (op.equals("cadastrar")) {
				CadastrarProdutoDao.cadastrar(codigo, nome_produto, valor, quantidade_pessoas, contem);
				msg = "Produto cadastrado com sucesso.";
			} else if (op.equals("")) {
				msg = "";
			} else {
				throw new IllegalArgumentException("Operação \"" + op + "\" não suportada.");
			}
			req.setAttribute("codigo", CadastrarProdutoDao.codValido());
			req.setAttribute("msg", msg);
			req.getRequestDispatcher("CadastrarProdutoView.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}	
}