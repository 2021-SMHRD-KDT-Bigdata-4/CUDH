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

public class MemberBoardController implements Controller{
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DAOMybatis dao =new DAOMybatis();
		List<VO> list =dao.boardList();
		Gson g=new Gson();
		
		String bList =  g.toJson(list);
		//System.out.println(bList);
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println(bList);
		System.out.println(bList);
		
		return null;
	}
}
