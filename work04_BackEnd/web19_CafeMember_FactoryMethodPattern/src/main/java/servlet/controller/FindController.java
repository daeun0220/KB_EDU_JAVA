package servlet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.model.MemberDAOImpl;
import servlet.model.MemberVO;

public class FindController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
	       String path = "find_fail.jsp";
	       try {
	       	MemberVO rvo = MemberDAOImpl.getInstance().findByIdMember(id);
	       	System.out.println("rvo :"+rvo);
	       	if(rvo!=null) {
	       		request.setAttribute("vo", rvo);
	       		path = "find_ok.jsp";
	       	}
	       }catch(Exception e) {
	       	
	       }
	       return new ModelAndView(path);
	}

}
