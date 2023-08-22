package web.controller;

public class UpdateController implements Controller{

	@Override
	public String handleRequest() {
		
		System.out.println("UpdateController...Member Update...");
		return "update_result.jsp";
	}

}
