package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.DAOMybatis;
import model.VO;

public class ConsultingCardListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String p_expertise=(request.getParameter("p_expertise")).toString();	
		
		DAOMybatis dao = new DAOMybatis();
		try {
		List<VO> list = dao.professorList(p_expertise);
		System.out.println(list);
		Gson g = new Gson();

		String pList = g.toJson(list);
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println(pList);
		System.out.println(pList+ "5");
		} catch (Exception e) {			
			e.printStackTrace();
		}	
		return null;
	}

}
