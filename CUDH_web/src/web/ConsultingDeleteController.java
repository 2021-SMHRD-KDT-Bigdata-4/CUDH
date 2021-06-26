package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOMybatis;


public class ConsultingDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int con_idx = Integer.parseInt(request.getParameter("con_idx"));
		DAOMybatis dao = new DAOMybatis();
		int cnt = dao.consultingUpdate(con_idx);
		PrintWriter out = response.getWriter();
		out.println(cnt);

		return null;
	}

}
