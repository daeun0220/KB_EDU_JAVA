package servlet.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import servlet.model.MemberDAOImpl;
import servlet.model.MemberVO;

public class UpdateController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String path = "index.jsp";
		String id = request.getParameter("id");
  	  String password = request.getParameter("password");
  	  String name = request.getParameter("name");
  	  String address = request.getParameter("address");
  	  
  	  MemberVO pvo = new MemberVO(id, password, name, address);
		try {
	    	  MemberDAOImpl.getInstance().updateMember(pvo);
	    	  
	    	  HttpSession session = request.getSession();
	    	  if(session.getAttribute("vo")!=null) {
	    		  session.setAttribute("vo", pvo);
	    		  path = "update_result.jsp";
	    	  }
	    	 
	      }catch(Exception e) {
	    	  
	      }
		return new ModelAndView(path);
	}

}
