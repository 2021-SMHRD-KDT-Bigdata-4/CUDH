package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOMybatis;

public class MemberBoardDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		DAOMybatis dao = new DAOMybatis();
		String view = null;
		try {
			int cnt = dao.boardDelete(b_idx);
			// redirect
			if (cnt > 0) {
				// response.sendRedirect("list.do");
				view="/memberBoard";
			} else {
				throw new ServletException("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}

}
