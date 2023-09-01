package com.service.spring.controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.service.spring.domain.UploadDataVO;

@Controller
public class FileUploadController {
	
	// service @Autowired
	
	@RequestMapping("fileupload.do")
	public String upload(UploadDataVO vo, Model model, HttpSession session) throws Exception{
		MultipartFile mfile = vo.getUploadFile();
		System.out.println("MultipartFile ... " + mfile);
		
		//주요 기능
		//1. 업로드한 파일명 알아오기
		if(mfile.isEmpty()!=true) { //업로드된 파일이 있다면
			System.out.println("파일의 사이즈 : " + mfile.getSize());
			System.out.println("파일의 이름 : " + mfile.getOriginalFilename());   //getName은...?
			System.out.println("mfile.getName() : " + mfile.getName());
		}
		//2. 업로드한 파일을 Tomcat 서버로 배포(저장)
		String root = session.getServletContext().getRealPath("/");
		System.out.println("root : " + root);
		
		String path = root + "upload\\";
		System.out.println("path :" + path);
		
		//3. 업로드한 파일의 카피본을 경로 /upload에 저장
		File copyFile = new File(path+mfile.getOriginalFilename());
		mfile.transferTo(copyFile);
		
		model.addAttribute("uploadfile", mfile.getOriginalFilename());
		return "upload_result";
	}
	
	@RequestMapping("filedown.do")
	public String down(Model model, String filename, HttpSession session) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "upload\\";
		
		//다운로드 코드 추가
		model.addAttribute("path", path);
		return "downloadView";
	}
}
