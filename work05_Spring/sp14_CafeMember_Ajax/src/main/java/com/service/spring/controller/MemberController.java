package com.service.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.spring.domain.MemberVO;
import com.service.spring.model.MemberDAO;
import com.service.spring.model.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;    //service에 dao 기능 다 있는게 아니라서
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping("find.do")
	public String find(Model model, String id) throws Exception {
		MemberVO rvo = memberService.getMember(id);
		String path = "find_fail";
		if(rvo!=null) {
			model.addAttribute("vo", rvo);
			model.addAttribute("msg", "회원발견 - 성공");
			path = "find_ok";
			return path;
		}else {
			model.addAttribute("msg", "회원발견 - 실패");
			return "find_fail";  //find_fail 만들어
		}
	}
	
	@RequestMapping("showAll.do")
	public String showAll(Model model) throws Exception {
		List<MemberVO> list = memberService.showAllMember();
		model.addAttribute("list", list);
		System.out.println(list);
		return "allView";
	}
	
	@RequestMapping("login.do")
	public String login(Model model, MemberVO vo, HttpSession Session) throws Exception {
		MemberVO memberVO = memberService.login(vo);
		String path = "login_fail";
		if(memberVO!=null) {
			model.addAttribute("vo", memberVO);
			Session.setAttribute("vo", memberVO);
			path = "login_result";
		} 
		return path;
	}
	
	
	@RequestMapping("register.do")
	public String register(Model model, MemberVO vo) throws Exception {
		try {
			memberDAO.registerMember(vo);
			model.addAttribute("vo", vo );
			return "register_result";
		}catch (Exception e){
			return "register_fail";
		}
		
	}
	
	@RequestMapping("update.do")
	public String update(Model model, MemberVO vo) throws Exception {
		memberDAO.updateMember(vo);
		model.addAttribute("vo", vo);
		return "update_result";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession Session) throws Exception {
		Session.invalidate();
		return "logout";
	}
	
	

}
