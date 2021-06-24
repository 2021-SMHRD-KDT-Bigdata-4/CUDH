package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOMybatis;
import model.VO;

public class MemberBoardUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		String b_title = request.getParameter("b_title");
		String b_contents = request.getParameter("b_contents");
		String view=null;
		VO vo = new VO();
		vo.setB_idx(b_idx);
		vo.setB_title(b_title);
		vo.setB_contents(b_contents);
		DAOMybatis dao =new DAOMybatis();
		try {
			int cnt=dao.boardUpdate(vo);
			if(cnt>0) {
				view="/memberBoard";
			}else {
			 throw new ServletException("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view; // list.do or nul
		
	}

}
