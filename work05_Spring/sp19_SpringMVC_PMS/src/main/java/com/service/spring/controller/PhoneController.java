package com.service.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.spring.domain.Phone;
import com.service.spring.domain.UserInfo;
import com.service.spring.model.PhoneService;

@Controller
public class PhoneController {
	
	@Autowired
	private PhoneService phoneService;
	
	@GetMapping("/")
	public String index() throws Exception{
		return "redirect:index.jsp";
	}
	
	@GetMapping("/regPhone.do")
	public String getRegPhone(Model model) throws Exception{     // 화면 보여주는 컨트롤러는 get
		model.addAttribute("title", "핸드폰관리-핸드폰 등록 폼");
		return "PhoneReg";
	}
	
	@PostMapping("/savePhone.do")
	public String doRegPhone(Phone phone, Model model) throws Exception{    // insert 같은 동작 컨트롤러는 do
		try {
			//성공페이지
			phoneService.insert(phone);
			model.addAttribute("title", "핸드폰관리-핸드폰 저장 성공");
			return "Result";
		} catch(Exception e) {
			//에러페이지
			model.addAttribute("message", "핸드폰관리-핸드폰 저장 에러");
			System.out.println(e.getMessage());
			return "Error";
		}

	}
	
	@GetMapping("/searchPhone.do")
	public String doList(Model model) {
		try {
			List<Phone> phones = phoneService.select();
			model.addAttribute("phones", phones);
			model.addAttribute("title", "핸드폰관리-핸드폰 목록 리스트");
			return "PhoneList";
		}catch(Exception e) {
			model.addAttribute("message", "핸드폰관리-핸드폰 목록 리스트 에러");
			return "Error";
		}

	}
	
	@PostMapping("deleteAjax.do")
	@ResponseBody      //비동기요청 
	public String doAjaxDelete(@RequestParam List<String> num, Model model) {
		List<String> temp = new ArrayList<>();
		try {
			for(String n : num) temp.add(n);
			phoneService.delete(temp);
			return "";
		}catch(Exception e) {
			model.addAttribute("message", "핸드폰관리-핸드폰 삭제 에러");
			return "Error";
		}

	}
	
	@GetMapping("/detail.do")
	public String doDetail(Phone phone, Model model) {
		try {
			Phone p = phoneService.select(phone);
			model.addAttribute("phone", p);
			model.addAttribute("title", "핸드폰관리-핸드폰 상세조회 리스트");
			return "PhoneView";
		}catch(Exception e) {
			model.addAttribute("message", "핸드폰관리-핸드폰 상세조회 에러");
			return "Error";
		}

	}
	
	
	@GetMapping("/login.do")
	public String getLoginForm(Model model) {
		model.addAttribute("title", "로그인");
		return "Login";
	}
	
	@PostMapping("/login.do")    // 로그인할 땐 Session 필요!!
	public String doLogin(UserInfo user, Model model, HttpSession Session) {
		try {
			UserInfo selected = phoneService.select(user);
			if(selected!=null) {
				Session.setAttribute("loginUser", selected);
				return "redirect:searchPhone.do";
			} else {
				return "Login";
			}
		}catch(Exception e) {
			model.addAttribute("message", "로그인 에러");
			return "Error";
		}
	}
	
	
	
	
	
}
