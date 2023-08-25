package com.service.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class FrontController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * 1. 폼값 받아서
		 * 2. VO 생성
		 * 3. DAO 리턴 받고.... 비지니스 로직 호출
		 * 4. 반환값 바인딩
		 * 5. 네비게이션
		 * 
		 * 1-4 했다치고... 5번만 해본다
		 * String ---> ModelAndView 
		 * 
		 * 1) request 바인딩된다(message = Hello First Spring MVC Framework) 
		 * 2) result.jsp 페이지로 forwarding된다   ( 결과페이지의 위치와 확장자(jsp)는 알 수 없다) / default는 forwarding !!!
		 */
		return new ModelAndView("result", "message", "Hello First Spring MVC Framework");
	}

}
