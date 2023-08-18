package web.servlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainServlet() {

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        
        if(id.equals("kblife") & password.equals("1234")) {
        	request.getRequestDispatcher("loginSuccess.jsp").forward(request, response);
        }else {
        	request.getRequestDispatcher("loginError.jsp").forward(request, response);
        }
	}

}
