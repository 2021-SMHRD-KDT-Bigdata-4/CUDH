package frontcontroller;

import java.util.HashMap;

import web.MemberBoardContentController;
import web.CardColunmsListController;
import web.CardListController;
import web.Controller;
import web.LoginCheckController;
import web.LogoutCheckController;
import web.MemberBoardContentController;
import web.MemberBoardController;
import web.MemberBoardDeleteController;
import web.MemberBoardLikeUPController;
import web.MemberBoardRegisterController;
import web.MemberBoardUpdateController;
import web.MemberBoardWriteController;
import web.ContractWriteController;
import web.ContractFormController;


public class HandlerMapping {//인터페이스 컨트롤러로 묶어서 그걸 해쉬맵 타입으로넣음
	private HashMap<String, Controller> mappings;
	public HandlerMapping() {
		mappings= new HashMap<String, Controller>();
		mappings.put("/loginCheck.do", new LoginCheckController());
		mappings.put("/logoutCheck.do", new LogoutCheckController());
		mappings.put("/memberBoard.do", new MemberBoardController());
		mappings.put("/memberBoardContent.do", new MemberBoardContentController());
		mappings.put("/memberBoardWrite.do", new MemberBoardWriteController());
		mappings.put("/memberBoardRegister.do", new MemberBoardRegisterController());
		mappings.put("/memberBoardDelete.do", new MemberBoardDeleteController());
		mappings.put("/memberBoardUpdate.do", new MemberBoardUpdateController());
		mappings.put("/memberBoardLikeUP.do", new MemberBoardLikeUPController());
		mappings.put("/consultingCardlist.do", new CardListController());
		mappings.put("/consultingCardColunmslist.do", new CardColunmsListController());
		mappings.put("/contractForm.do", new ContractFormController());
		mappings.put("/contractWrite.do", new ContractWriteController());
	}
	public Controller getController(String command) {
		return mappings.get(command);
	}
}
