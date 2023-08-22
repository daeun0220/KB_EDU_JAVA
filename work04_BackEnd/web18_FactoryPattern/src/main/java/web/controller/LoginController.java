package web.controller;

public class LoginController implements Controller{

	@Override
	public String handleRequest() {
		
		System.out.println("LoginController...Member Login...");
		return "login_result.jsp";
	}

}
