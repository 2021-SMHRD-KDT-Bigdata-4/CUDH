package web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOMybatis;
import model.VO;

public class ConsultingWriteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		int con_m_idx = Integer.parseInt(request.getParameter("con_m_idx"));
		int con_p_idx = Integer.parseInt(request.getParameter("con_p_idx"));
		String con_about = request.getParameter("con_about");
		String con_date = request.getParameter("con_date");
		String con_approval = request.getParameter("con_approval");
		
		System.out.println(con_m_idx);
		System.out.println(con_p_idx);
		System.out.println(con_about);
		System.out.println(con_date);
		System.out.println(con_approval);
		
		VO vo = new VO();// 객체만들기
		// 멤버_idx,전문가_idx, 컨설팅 필요한 날짜, 컨설팅 요청한 이유, 승인여부
		
		vo.setCon_m_idx(con_m_idx);
		vo.setCon_p_idx(con_p_idx);
		vo.setCon_about(con_about);
		vo.setCon_date(con_date);
		vo.setCon_approval(con_approval);
		
        String view=null;
        System.out.println(con_m_idx+"  "+con_p_idx+"  "+ con_about+"  "+ con_date+"  "+ con_approval+"   3.5");
        DAOMybatis dao =new DAOMybatis();
		try {
			int cnt=dao.contactInsert(vo);
			if(cnt>0) {
				//저장성공후->다시 리스트페이지로 가기(/list.do)
				// redirect 기법(서버에서 전화돌리기->요청돌리기)
				//response.sendRedirect("list.do");
				view="/consulting";
				//location.href="/CUDH_web/memberBoard.jsp"
			}else {
				throw new ServletException("error"); //예외처리
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return view; 
	};

}