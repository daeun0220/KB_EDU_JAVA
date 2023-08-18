package web.servlet.redirect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Redirect2")
public class Redirect2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Redirect2Servlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 폼값 받는다...(하나의 값만 받으세요)
		 * 2. 만약 어느 값도 선택되지 않았다면... error페이지로 연결
		 *    만약 하나의 값이 선택되었다면 redirect2.jsp로 바로 이동
		 * 3. redirect2.jsp에서는 <% %> 잘 사용해서
		 *    당신이 선택한 도시는 000입니다 라고 출력
		 */
		
		String city = request.getParameter("city");
		if(city != null) {
			request.getRequestDispatcher("redirect2.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("./error/error2.html");
		}
	}


}
