package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOMybatis;
import model.VO;

public class MemberBoardRegisterController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String b_category = request.getParameter("b_category");
		String b_state = request.getParameter("b_state");
		String b_city = request.getParameter("b_city");
		String b_title = request.getParameter("b_title");
		String b_contents = request.getParameter("b_contents");
		String b_writer = request.getParameter("b_writer");

		VO vo = new VO();// 객체만들기
		vo.setB_category(b_category);
		vo.setB_state(b_state);
		vo.setB_city(b_city);
		vo.setB_title(b_title);
		vo.setB_contents(b_contents);
		vo.setB_writer(b_writer);
        String view=null;    
		//BoardDAO dao=new BoardDAO();
        DAOMybatis dao =new DAOMybatis();
		try {
			int cnt=dao.memberBoardinsert(vo);
			if(cnt>0) {
				//저장성공후->다시 리스트페이지로 가기(/list.do)
				// redirect 기법(서버에서 전화돌리기->요청돌리기)
				//response.sendRedirect("list.do");
				view="/CUDH_web/memberBoard";
			}else {
				throw new ServletException("error"); //예외처리
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return view; 
	};

}
