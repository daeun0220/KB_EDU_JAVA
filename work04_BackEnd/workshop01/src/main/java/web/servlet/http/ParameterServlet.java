package web.servlet.http;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PS")
public class ParameterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ParameterServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        //클라이언트 요청 시점에 호출... 폼값 받아온다
        //System.out.println("3. doProcess...클라이언트 요청 시 동작");
        String job = request.getParameter("job");
        String pageNo = request.getParameter("pageNo");
        String searchWord = request.getParameter("searchWord");
        
        PrintWriter out = response.getWriter();
        out.println("<body><h3>job : " + job+ "</h3><br><h3> pageNO : " + pageNo + "</h3><br><h3> searchWord : " + searchWord +"</h3></body>");
        out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        //클라이언트 요청 시점에 호출... 폼값 받아온다
        //System.out.println("3. doProcess...클라이언트 요청 시 동작");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String [] hobby = request.getParameterValues("hobby");
        String favorite = request.getParameter("favorite");
        String desc = request.getParameter("desc");
        
        PrintWriter out = response.getWriter();
        out.println("<body><h3>name : " + name+ "</h3><br><h3> email : " + email + 
        		"</h3><br><h3> gender : " + gender +"</h3><br><h3> hobby : " + Arrays.toString(hobby) + 
        		"</h3><br><h3> favorite : " + favorite +"</h3><br><h3> desc : " + desc + "</h3></body>" );
        out.close();
	}

}
