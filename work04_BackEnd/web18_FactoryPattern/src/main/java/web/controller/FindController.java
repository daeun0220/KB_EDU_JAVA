package web.controller;

public class FindController implements Controller{

	@Override
	public String handleRequest() {
		
		System.out.println("FindController...Member Find...");
		return "find_ok.jsp";
	}

}
