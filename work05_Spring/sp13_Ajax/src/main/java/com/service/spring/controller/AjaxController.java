package com.service.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.spring.domain.Person;

@Controller
public class AjaxController {
	
	// Service @Autowired 했다치고
	  
	@RequestMapping("/")     //    http://127.0.0.1:8888/spring
	private String index() {
		System.out.println("context.. path.. recalling....");
		return "redirect:index.jsp";
	}
	
	@RequestMapping("synchro")     //    http://127.0.0.1:8888/spring
	private String synchro(Model model) {
		System.out.println("synchro request... ");
		model.addAttribute("info","동기통신이다~~~~!!");
		return "synchro_result";
	}
	
	@RequestMapping("asynch")     //    http://127.0.0.1:8888/spring
	private String asynch(Model model) {
		System.out.println("synchro request... ");
		model.addAttribute("person", new Person("김국민", "역삼동"));
		return "JsonView";  //여기선 InternalResourceViewResolver 
	}
}
