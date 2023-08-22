package servlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.controller.Controller;
import servlet.controller.ControllerFactory;

@WebServlet("/front.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로직은 여기서 작성
		String command = request.getParameter("command");
		//1. Factory생성...createController호출시 command값 인자값 넘긴다
		//2. Factory가 command값에 해당하는 FindController 생성...Controller 타입으로 리턴
		
		//3. Controller 받아서 handleRequest() 호출
		//4. 결과로 ModelAndView 리턴
		
		//5. 네비게이션 
		Controller controller = ControllerFactory.getInstance().createController(command);  //1,2
		ModelAndView mv = controller.handleRequest(request, response);  //3,4
		
		if(mv!=null) {
			if(mv.isRedirect()) response.sendRedirect(mv.getPath());
			else request.getRequestDispatcher(mv.getPath()).forward(request, response);
		}
	}

}
