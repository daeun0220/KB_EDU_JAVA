package web.servlet.http;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 <servlet>    web.xml 
 	<servlet-name>LoginFormServlet</servlet-name>
 	<servlet-class>web.servlet.http.LoginFormServlet</servlet-class>
 </servlet>
 
 <servlet-mapping>
 	<servlet-name>LoginFormServlet</servlet-name>
 	<url-pattern>/LFS</url-pattern>
 </servlet-mapping>
 */
@WebServlet("/LFS")   // url 매핑해주는 어노테이션 !!! 위에 코드 역할해주는거
public class LoginFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로직은 여기서 작성!! 
		// 한글처리... PrintWeiter 리턴 받기 전에 작성해야한다 2. 양방향 다해줘야 한다 
		//request.setCharacterEncoding("utf-8");
		//response.setContentType ("text/html;charset=utf-8");
				//1. 폼값 받는다
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				
				//2. 비지니스 로직 호출..(했다 치고) 
				//Member member = MemberDAOImpl.getInstance().login(id, password);
				
				//3. 반환된 값을 다시 클라이언트로 응답 
				PrintWriter out = response.getWriter();   // 화면에 출력하는 기능을 가지고 있는 객체를 리턴받고 response 통해서
				out.println("<html><body>");
				out.println("<ul><li> ID :" + id +  "</li>");
				out.println("<li> PASSWORD :" + password + "</li>");
				out.println("</ul></body></html>");
				
				out.close();
	}

}
