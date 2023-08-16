package web.servlet.generic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/*
 * MyGenericServlet 클래스는 자바기반으로 만들어진 클래스 
 * 자바클래스  ---  JVM(Platform) 에서 동작한다
 * 서블릿    ----  Container(WAS, Engine)  에서 동작한다 
 * 
 * MyGenericServlet ms = new MyGericServlet();
 * 객체 생성의 주체는 컨테이너....!
 */
public class MyGenericServlet extends GenericServlet{

	@Override
	public void service(ServletRequest req, ServletResponse response) throws ServletException, IOException {
		//웹 브라우저로 응답을 하기 위한 객체
		PrintWriter out = response.getWriter();
		
		out.println("<html><body><h2>");
		out.println("Hello Generic Servlet~~!!");
		out.println("</h2></body></html>");
		
		out.close();
	}

}
