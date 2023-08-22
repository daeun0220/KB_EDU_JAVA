package servlet.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.model.MemberDAOImpl;
import servlet.model.MemberVO;

public class ShowAllController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String path = "";
		try {
	    	  ArrayList<MemberVO> list=MemberDAOImpl.getInstance().showAllMember();
	    	  request.setAttribute("list", list);
	    	  path = "allView.jsp";
	    	 
	      }catch(Exception e) {
	    	  
	      }
		return new ModelAndView(path);
	}

}
