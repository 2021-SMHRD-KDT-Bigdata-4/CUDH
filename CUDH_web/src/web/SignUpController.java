package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOMybatis;
import model.VO;

public class SignUpController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_hoping_crop = request.getParameter("m_hoping_crop");
		VO vo = new VO();
		vo.setM_id(m_id);
		vo.setM_pw(m_pw);
		vo.setM_name(m_name);
		vo.setM_hoping_crop(m_hoping_crop);
		
		DAOMybatis dao =new DAOMybatis();
		try {
			int cnt=dao.MemberInsert(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "companyHome";
	}

}
