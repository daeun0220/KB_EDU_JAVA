package servlet.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SubjectAjax")
public class SubjectAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //디비 연결했다치고....

        System.out.println("...doGet...진입함...");
        String result = "  JAVA  |  JDBC  |  Bootstrap   |  Spring Framework   |  AI   ";

        request.setAttribute("result", result); //데이타 바인딩

        request.getRequestDispatcher("Result.jsp").forward(request, response);
    }

}
