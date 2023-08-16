package web.servlet.http;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lifecycle")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LifeCycleServlet() {
    	System.out.println("LifeCycleServlet() is called!!");
    }
    @Override
    public void init() throws ServletException {
    	System.out.println("init() is called!!~!");
    }
    @Override
    public void destroy() {
    	System.out.println("destroy() is called!!!");
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        System.out.println("doGet() is called!!");
        
        PrintWriter out = response.getWriter();
        out.println("<body><h3>안녕하세요 LifeCycleServlet입니다.</h3></body>");
        out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        System.out.println("doPost() is called!!");
        
        PrintWriter out = response.getWriter();
        out.println("<body><h3>안녕하세요 LifeCycleServlet입니다.</h3></body>");
        out.close();
	}

}
