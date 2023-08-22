package servlet.controller;

import servlet.controller.FindController;
import servlet.controller.LoginController;
import servlet.controller.RegisterController;
import servlet.controller.ShowAllController;

//Controller 생성하는 공장...
// 많은 Controller 생성하더라도 공장은 오직 한개만 필요.. --> 싱글톤
public class ControllerFactory {
	private static ControllerFactory factory = new ControllerFactory();
	private ControllerFactory() {
		
	}
	public static ControllerFactory getInstance() {
		return factory;
	}
	
	//FrontController 가 전해주는 command 값에 따라서 생성되는 Controller 가 달라짐
	public Controller createController(String command) {
		Controller controller = null;
		if(command.equals("find")) {
			controller = new FindController();
			System.out.println("FindController..Creating...ok");
		}else if(command.equals("register")) {
			controller = new RegisterController();
			System.out.println("RegisterController..Creating...ok");
			
		}else if(command.equals("showAll")) {
			controller = new ShowAllController();
			System.out.println("ShowAllController..Creating...ok");
			
		}else if(command.equals("login")) {
			controller = new LoginController();
			System.out.println("LoginController..Creating...ok");
		}
		return controller;
	}
}
