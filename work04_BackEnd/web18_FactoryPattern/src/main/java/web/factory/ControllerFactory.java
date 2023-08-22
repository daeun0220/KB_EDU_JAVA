package web.factory;

import web.controller.Controller;
import web.controller.FindController;
import web.controller.LoginController;
import web.controller.RegisterController;
import web.controller.UpdateController;

/*
 * Controller 만드는 공장
 * 이곳에서 RegisterController, FindController, Update~,Login~ 를 각각 생성한다
 * ::
 * 1) 4개의 controller 생성 --> ControllerFactory 가 4개 필요?
 * 2) 4개, 400개의 controller 생성 --> ControllerFactory 가 1개 필요?   !!!
 * 
 * ControllerFactory 싱글톤 패턴으로 작성 
 */
public class ControllerFactory {
	
	private static ControllerFactory factory = new ControllerFactory();
	private ControllerFactory() {
		System.out.println("Creating ControllerFactory...");
	}
	public static ControllerFactory getInstance() {
		return factory;
	}
	
	//클라이언트의 요청에 따라서 서로 다른 Controller를 공장에서 생성한다
	public Controller createController(String command) {
		Controller controller = null;
		if(command.equals("register")) {
			controller = new RegisterController();
			System.out.println("RegisterController..Creating...ok");
		}else if(command.equals("find")) {
			controller = new FindController();
			System.out.println("FindController..Creating...ok");
			
		}else if(command.equals("update")) {
			controller = new UpdateController();
			System.out.println("UpdateController..Creating...ok");
			
		}else if(command.equals("login")) {
			controller = new LoginController();
			System.out.println("LoginController..Creating...ok");
			
		}
		return controller;
	}
}
