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

@WebServlet("/novo_pedido")
public class NovoPedidoController extends HttpServlet {

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
			int codigo = toInt(req, "codigo", "0");
			String nome_produto = valor(req, "nome_produto", "");
			double valor = toDouble(req, "valor", "0");
			int qnt_pessoas = toInt(req, "qnt_pessoas", "0");
			String contem = valor(req, "contem", "");
			String codbusca = valor(req, "pesquisa", "0");
			int cod_comanda = toInt(req, "cod_comanda", "0");
			int codigo_produto = toInt(req, "codigo_produto", "0");
			int qntPedido = toInt(req, "qntPedido", "1");
			if (op.equals("adicionar")) {
				NovoPedidoDao.adicionar(cod_comanda, codigo_produto, qntPedido);
			} else if (op.equals("")) {
				msg = "";
			} else {
				throw new IllegalArgumentException("Operação \"" + op + "\" não suportada.");
			}
			int codigo_comanda = NovoPedidoDao.codComanda(num_mesa);
			req.setAttribute("codigo_comanda", codigo_comanda);
			req.setAttribute("num_mesa", num_mesa);
			req.setAttribute("codbusca", codbusca);
			List<Produto> produtos = NovoPedidoDao.listar();
			Collections.sort(produtos, new Comparator() {
				public int compare(Object o1, Object o2) {
					Produto p1 = (Produto) o1;
					Produto p2 = (Produto) o2;
					
					return p1.getCodigo() < p2.getCodigo() ? -1 : (p1.getCodigo() > p2.getCodigo() ? +1 : 0);
				}
			});
			req.setAttribute("produtos", produtos);
			
			req.getRequestDispatcher("NovoPedidoView.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}	
}