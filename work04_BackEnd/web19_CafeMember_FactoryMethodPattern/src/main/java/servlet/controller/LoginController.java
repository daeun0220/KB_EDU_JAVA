package servlet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import servlet.model.MemberDAOImpl;
import servlet.model.MemberVO;

public class LoginController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String path = "index.html";
		
		try {
			MemberVO rvo=MemberDAOImpl.getInstance().login(id, password);
			HttpSession session = request.getSession();
			
			if(rvo!=null) {
				session.setAttribute("vo", rvo);
				System.out.println("JSESSIONID :: "+session.getId());
				path = "login_result.jsp";
			}
		}catch(Exception e) {
				path = "login.jsp";
		}
	       return new ModelAndView(path);
	}

}
