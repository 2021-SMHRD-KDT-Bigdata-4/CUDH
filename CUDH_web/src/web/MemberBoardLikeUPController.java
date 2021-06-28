package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOMybatis;
import model.VO;

public class MemberBoardLikeUPController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int b_likes= Integer.parseInt(request.getParameter("b_likes"));
		int b_idx= Integer.parseInt(request.getParameter("b_idx"));
		int m_idx= Integer.parseInt(request.getParameter("m_idx"));
		
		b_likes+=1; // 여기서 뷰스 증가

		VO vo = new VO();
		vo.setB_likes(b_likes);
		vo.setB_idx(b_idx);
		vo.setM_idx(m_idx);
		System.out.println(b_likes+b_idx+m_idx);
		
		DAOMybatis dao =new DAOMybatis();
		//int cnt=dao.memberBoardLikeUP(vo);
		try {
			int cnt= dao.insertLikeList(vo);
			if(cnt>0) {
				try {
					
					 dao.memberBoardLikeUP(vo);
					 request.setAttribute("vo", vo);
				
				} catch (Exception e) {			
					e.printStackTrace();
				}
				
			}else {
				System.out.println("안됨");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return "memberBoardContent";
	}

}
