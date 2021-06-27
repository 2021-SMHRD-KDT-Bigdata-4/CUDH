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

public class CropClimateListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String c_name=(request.getParameter("c_name")).toString();	
		
		DAOMybatis dao = new DAOMybatis();
		List<VO> list = dao.cropClimateList(c_name);
		System.out.println("되나?");
		//Json 핸들링  API : GSON 
		Gson g = new Gson();
		String bList = g.toJson(list);
		//System.out.println(bList);
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println(bList);
		
		return null;
	}

}
