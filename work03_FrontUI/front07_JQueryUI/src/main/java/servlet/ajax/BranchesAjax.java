package servlet.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BranchesAjax")
public class BranchesAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("22진입");
		
		String result = "<ul><li>국민은행 서초 지점</li><br>" 
						+ "<li>국민은행 역삼 지점</li><br>"
				        + "<li>국민은행 선릉 지점</li><br>"
						+ "<li>국민은행 목동 지점</li><br>"
				        + "<li>국민은행 교대 지점</li><br>";
								
		request.setAttribute("result", result); //데이타 바인딩

        request.getRequestDispatcher("Result.jsp").forward(request, response);
	}


}
