package servlet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import servlet.model.MemberDAOImpl;
import servlet.model.MemberVO;

public class LogoutController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String path = "index.jsp";
		try {
	    	HttpSession session = request.getSession();
	    	if(session.getAttribute("vo")!=null) {
	    		session.invalidate();
	    		path = "logout.jsp";
	    	}
			
	    	 
	      }catch(Exception e) {
	    	  
	      }
		return new ModelAndView(path);
	}

}
