package com.kiri.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kiri.auth.KakaoLogin;
import com.kiri.auth.NaverLogin;
import com.kiri.dto.Login_TypeDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.service.LoginService;
import com.kiri.service.MailService;
import com.kiri.service.SignupService;
import com.kiri.utills.EncryptionUtils;

@RequestMapping("/login")
@Controller
public class LoginController {
	@Autowired
	private EncryptionUtils ecp;
	@Autowired
	private LoginService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private MailService mailService;
	@Autowired
	private SignupService signupService;
	//네이버
    @Autowired
    private NaverLogin naverLogin;
    //카카오
    @Autowired
    private KakaoLogin kakaoLogin;
	
	
	@RequestMapping(value = "/toLogin")
	public String toLogin(Model model)throws Exception {
		String naverUrl = naverLogin.getAuthorizationUrl(session);
		String kakaoUrl = kakaoLogin.getAuthorizationUrl(session);
	    model.addAttribute("naverUrl", naverUrl);
	    model.addAttribute("kakaoUrl", kakaoUrl);
	    
		return "/member/login";
	}
	@ResponseBody
	@RequestMapping(value = "/general") 	
	public String general(String user_email, String user_pw) throws Exception { // 일반로그인 feat.조용진
		String Encryption_pw = ecp.getSHA512(user_pw); 
		Login_TypeDTO type = service.loginType(user_email);
		
		if(type == null) { //미가입
			return "nonmem";
			
		}else if(type.getType().equals("general")) { //일반 로그인
			MemberDTO dto = service.login(user_email, Encryption_pw);
			if(dto != null) {
				return service.loginResult(dto, type.getType(), session);
				
			}else { // null 로그인 실패 
				service.loginLogFailed(user_email);
				return "loginFail";
			}	
			
		}else if(type.getType().equals("admin")) { //관리자 가입된 아이디
			MemberDTO dto = service.login(user_email, user_pw);
			if(dto != null) {
				dto.setUser_pw(null);
				session.setAttribute("loginType", type.getType());
				session.setAttribute("loginSession", dto);
				return "admin";
				
			}else {
				return "loginFail";
			}
			
		}else { // 맴버는 조회 되었는데 타입에 오류 발생 
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/findId") 	
	public String findId(String user_name, String user_phone) throws Exception { // 아이디 찾기 feat.조용진
		String result = service.findId(user_name, user_phone);
		if(result != "nonmem") {
			return result;
			
		}else {
			return "nonmem";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/findPw") 	
	public String findPw(String user_name, String user_email) throws Exception { // 비밀번호 찾기 feat.조용진
		boolean is_result = service.findPw(user_name, user_email);
		if(is_result) {
			return "exist";
			
		}else {
			return "empty";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailAuthFindPw") 
	public String emailAuthFindPw(String user_name, String user_email) throws Exception { // 비밀번호 찾기 feat.조용진
		return mailService.findPw(user_email);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/tempPw") 
	public boolean tempPw(String user_email) throws Exception { // 비밀번호 수정 feat.조용진
		String pw = mailService.updatePw(user_email);
	    String ecpPw = ecp.getSHA512(pw);
	    service.updatePw(user_email, ecpPw);
		
		return true;
	}
	
	@RequestMapping(value = "/toLogout")//logout페이지 요청 feat.조용진
	public String logout(HttpServletResponse response) throws Exception {
		// 쿠키
		Cookie cookie = new Cookie("postView", null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		// 그룹 쿠키
		Cookie gcookie = new Cookie("groupPostView", null);
		gcookie.setMaxAge(0);
		gcookie.setPath("/");
		response.addCookie(gcookie);
				
		if(session.getAttribute("loginType").equals("kakao")) {
			String accessToken = (String)session.getAttribute("accessToken");
			kakaoLogin.kakaoLogout(accessToken, "https://kapi.kakao.com/v1/user/logout");
		}
		
		session.invalidate();
		return "redirect:/";
		
	}
	
	
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/login/toLogin";
	}
	
	
}
