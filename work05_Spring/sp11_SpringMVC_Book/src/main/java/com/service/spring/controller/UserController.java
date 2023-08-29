package com.service.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.service.spring.domain.User;
import com.service.spring.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("memberLogin.do")
	public ModelAndView login(User user, HttpServletRequest request) throws Exception{	
		/*
		 * login 로직을 호출
		 * 1. userService 의 login()
		 * 2. 반환된 값이 있따면... 세션에 바인딩 
		 */
		User rvo = userService.login(user);
		System.out.println("rvo :: " + rvo);
		
		String path = "index.jsp";
		String msg = "아이디 혹은 패스워드가 틀렸습니다";
		if(rvo != null) {  // 로그인 성공했다면...세션에 정보 바인딩
			request.getSession().setAttribute("user", rvo);
			
			msg = "정상적으로 로그인 되었습니다.";
		}
		request.getSession().setAttribute("msg", msg); // 로그인 성공여부에 따라 메세지 다르게 함 
		return new ModelAndView("redirect:index.jsp");
	}
	
	@RequestMapping("memberLogout.do")
	public ModelAndView logout(HttpSession session) throws Exception{
		session.invalidate();
		return new ModelAndView("redirect:index.jsp");
	}
}
