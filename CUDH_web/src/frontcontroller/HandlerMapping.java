package frontcontroller;

import java.util.HashMap;

import web.MemberBoardContentController;
import web.Controller;
import web.LoginCheckController;
import web.MemberBoardContentController;
import web.MemberBoardController;


public class HandlerMapping {//인터페이스 컨트롤러로 묶어서 그걸 해쉬맵 타입으로넣음
	private HashMap<String, Controller> mappings;
	public HandlerMapping() {
		mappings= new HashMap<String, Controller>();
		mappings.put("/loginCheck.do", new LoginCheckController());
		mappings.put("/memberBoard.do", new MemberBoardController());
		
		mappings.put("/memberBoardContent.do", new MemberBoardContentController());
	}
	public Controller getController(String command) {
		return mappings.get(command);
	}
}
