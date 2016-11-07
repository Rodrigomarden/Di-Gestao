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
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			List<Mesas> mesas = GarcomMesasDao.listar();
			req.setAttribute("mesas", mesas);
			
			req.getRequestDispatcher("Garcom-Mesas.jsp").forward(req, resp);
		}catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}
}
