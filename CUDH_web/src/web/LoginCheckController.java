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
		
		String member_id = request.getParameter("member_id");
		String member_pw =request.getParameter("member_pw");
		System.out.println(member_id+"      체크컨트롤러    4.5"); 
		VO vo =new VO();
		vo.setMember_id(member_id);
		vo.setMember_pw(member_pw);
		
		System.out.println(vo.getMember_id()+"                4.6");
		DAOMybatis dao = new DAOMybatis();
		VO loginVO =dao.loginMember(vo);
		
		PrintWriter out = response.getWriter();
		
		System.out.println(loginVO.getMember_id()+"      체크컨트롤러    5");
		
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
