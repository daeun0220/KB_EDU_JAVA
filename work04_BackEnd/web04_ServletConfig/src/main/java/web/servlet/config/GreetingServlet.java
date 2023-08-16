package web.servlet.config;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GreetingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String greet;
	
    public GreetingServlet() {
    	System.out.println("1. GreetingServlet 디폴트로 생성...");  //클라이언트 요청 전에 이뤄짐   / Lazy Loading  --> Pre Loading 
    }
    @Override
    public void init() throws ServletException {
    	System.out.println("2. GreetingServlet 필드 초기화...");
    	greet = getInitParameter("GREET");    //
    	System.out.println("Greet Message : " + greet);
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리... 
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        //클라이언트 요청 시점에 호출... 폼값 받아온다
        System.out.println("3. doProcess...클라이언트 요청 시 동작");
        String name = request.getParameter("name");
        
        PrintWriter out = response.getWriter();
        out.println("<body><h3>" + name+ ", " + greet + "</h3></body>");
        out.close();
        
	}

}
