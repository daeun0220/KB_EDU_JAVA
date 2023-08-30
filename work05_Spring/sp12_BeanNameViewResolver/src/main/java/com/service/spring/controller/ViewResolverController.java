package com.service.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewResolverController {
	
	//Service wired...
	
	@RequestMapping("findBoard.do")
	private String findBoard() {
		System.out.println("service call....data return.....binding....했다고 치자");
		return "board_result";
	}
	
	@RequestMapping("findProduct.do")
	private String findProduct() {
		System.out.println("service call....data return.....binding....했다고 치자");
		return "product_result";    //위치정보, 확장자... ViewResolver
	}
	
	@RequestMapping("register.do")
	private String register() {
		System.out.println("service call....data return.....binding....했다고 치자");
		return "register_result";
	}

}
