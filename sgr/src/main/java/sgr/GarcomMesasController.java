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

@WebServlet("/garcom_mesas")

public class GarcomMesasController extends HttpServlet {
	
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
			if (op.equals("informacoes")) {
				InformacoesMesa info = GarcomMesasDao.informacoes(num_mesa);
				List<PedidoAndamento> listPedidosAndamento = GarcomMesasDao.pedidosAndamento(num_mesa);
				if(info.getNome() != null) {
					req.setAttribute("codigo_comanda", "Nº: "+info.getCodigo());
					req.setAttribute("nome_garcom", "Garçom: "+info.getNome());
				} else {
					req.setAttribute("codigo_comanda", "Não há comanda cadastrada para essa mesa.");
				}
				if(listPedidosAndamento.isEmpty()) {
					PedidoAndamento x = new PedidoAndamento("Não há pedidos sendo aguardados.");
					listPedidosAndamento.add(x);
					req.setAttribute("aguardando", listPedidosAndamento);
				} else {
					req.setAttribute("aguardando", listPedidosAndamento);
				}
				
			} else if(op.equals("obtComanda")) {
				
			}
			req.setAttribute("comanda_mesa", num_mesa);
			
			//ObterComandaAbertas
			List<ExibirComanda> exibirComanda = GarcomMesasDao.exibirComanda();
			req.setAttribute("exibirComanda", exibirComanda);
			
			//Listar Mesas
			List<Mesas> mesas = GarcomMesasDao.listar();
			req.setAttribute("mesas", mesas);
			req.getRequestDispatcher("Garcom-Mesas.jsp").forward(req, resp);
		}catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}
}
