package sgr;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/alterar")
public class AlterarProdutoController extends HttpServlet {

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
			int codigo = toInt(req, "codigo", "0");
			String nome_produto = valorr(req, "produto", "");
			double valor = toDouble(req, "valor", "0");
			int qnt_pessoas = toInt(req, "qnt_pessoas", "0");
			String contem = valorr(req, "contem", "");
			Produto alterarproduto = new Produto(codigo, nome_produto, valor, qnt_pessoas, contem);
			if (op.equals("alterar")) {
				AlterarProdutoDao.alterar(codigo, nome_produto, valor, qnt_pessoas, contem);
				msg="Produto alterado com sucesso!";
			} else if (op.equals("")) {
				req.setAttribute("codigo", codigo);
				req.setAttribute("nome_produto", nome_produto);
				req.setAttribute("valor", valor);
				req.setAttribute("qnt_pessoas", qnt_pessoas);
				req.setAttribute("contem", contem);
				msg = "";
			} else {
				throw new IllegalArgumentException("Operação \"" + op + "\" não suportada.");
			}
			req.setAttribute("msg", msg);
			req.setAttribute("alterarproduto", alterarproduto);
			req.getRequestDispatcher("Alterar-Produto.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}	
}