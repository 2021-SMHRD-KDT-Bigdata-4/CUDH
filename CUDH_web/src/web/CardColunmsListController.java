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

public class CardColunmsListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DAOMybatis dao = new DAOMybatis();
		List<String> list = dao.professorExpertiseList();
		Gson g = new Gson();

		String pList = g.toJson(list);
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println(pList);
		System.out.println(pList+ "4.5444444444444444444444444444444444444444");

		return null;
	}

}
