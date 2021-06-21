package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAOMybatis;
import model.VO;

public class LoginCheckController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		System.out.println(m_id+"      체크컨트롤러    4.5"); 
		VO vo =new VO();
		vo.setM_id(m_id);
		vo.setM_pw(m_pw);
		
		System.out.println(vo.getM_id()+"                이다음부턴 mybatis 문제");
		DAOMybatis dao = new DAOMybatis();
		VO loginVO =dao.loginMember(vo);
		
		PrintWriter out = response.getWriter();
		
		System.out.println(loginVO.getM_id()+"      체크컨트롤러    5");
		
		if(loginVO!= null) {
			out.print("YES"); //성공(1)
			//로그인 성공여부를 모든 웹페이지가 공유해야한다
			
			HttpSession session = request.getSession();
			session.setAttribute("loginVO", loginVO);
			//세션 바인딩~~~~~
			request.setAttribute("loginVO", loginVO);
		}else {
			out.print("NO"); //실패(0)
		}
		
		return null;
	}

}
