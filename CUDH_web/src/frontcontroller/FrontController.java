package frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOMybatis;
import web.Controller;
@WebServlet("*.do")
// FrontController 패턴
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			                                  throws ServletException, IOException {
		  
		  request.setCharacterEncoding("utf-8");
		  String reqUrl=request.getRequestURI();
		  System.out.println(reqUrl+"    1");
		  
		  String cpath=request.getContextPath(); 
		  System.out.println(cpath+"    2");
		  
		  String command=reqUrl.substring(cpath.length());	  
		  DAOMybatis dao = new DAOMybatis();
		  
		  Controller controller=null;
		  String view=null;
		  
		  System.out.println(command+"    3"); // HandlerMapping(핸들러메핑)
		  
		  HandlerMapping mappings = new HandlerMapping();		  
		  controller = mappings.getController(command);
		  System.out.println(controller+"        매핑을통한 포조/ DB");
		  
		  //-----------------------------------------
		  
		  
		  view = controller.requestHandler(request, response);
		  System.out.println(view + "    여기까지 오면 대부분 view 문제");
		  if(view!=null) {  // /WEB-INF/views/boardList.jsp
			if(view.indexOf("redirect:/")!=-1) {
				response.sendRedirect(view.split(":/")[1]); // view = redirect:/list.do
				
			}else {
				RequestDispatcher rd=request.getRequestDispatcher(ViewResolver.makeUrl(view)); // boardList
		        rd.forward(request, response);
			}
		  }		  
	}
}