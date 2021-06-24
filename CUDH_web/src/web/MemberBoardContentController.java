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
		int b_views=Integer.parseInt(request.getParameter("b_views"));
		
		b_views+=1; // 여기서 뷰스 증가

		VO voUV = new VO();
		voUV.setB_idx(b_idx);
		voUV.setB_views(b_views);
		
		DAOMybatis dao =new DAOMybatis();
		try {
			int cnt=dao.boardUpdateViews(voUV);
			
			if(cnt>0) {
				
				try {
					 VO vo=dao.memberBoardContent(b_idx);
					 
					 // 상세보기페이지로 이동 : boardContent.jsp
					 request.setAttribute("vo", vo);
					 
			         //RequestDispatcher rd = request.getRequestDispatcher("/boardContent.jsp");
			         //rd.forward(request, response);
					
				} catch (Exception e) {			
					e.printStackTrace();
				}
				
			}else {
				throw new ServletException("error");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return "memberBoardContent"; //ViewName(논리적인뷰의이름)->/WEB-INF/views/boardContent.jsp(물리적인경로)
	}
}


