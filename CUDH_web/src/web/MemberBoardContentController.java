package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOMybatis;
import model.VO;

public class MemberBoardContentController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int b_idx=Integer.parseInt(request.getParameter("b_idx"));	
		//BoardDAO dao=new BoardDAO();
		DAOMybatis dao =new DAOMybatis();
		try {
			 VO vo=dao.memberBoardContent(b_idx);
			 
			 // 상세보기페이지로 이동 : boardContent.jsp
			 request.setAttribute("vo", vo);
			 
	         //RequestDispatcher rd = request.getRequestDispatcher("/boardContent.jsp");
	         //rd.forward(request, response);
			
		} catch (Exception e) {			
			e.printStackTrace();
		}	
		return "memberBoardContent"; //ViewName(논리적인뷰의이름)->/WEB-INF/views/boardContent.jsp(물리적인경로)
	}
}


