package com.kiri.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.LoginDAO;
import com.kiri.dto.Login_TypeDTO;
import com.kiri.dto.MemberDTO;

@Service
public class LoginService {
	@Autowired
	private LoginDAO dao;
	
	
	public MemberDTO login(String id, String pw) throws Exception{  //로그인 feat.조용진
		Map<String, String> map = new HashMap<>();
		map.put("user_email", id);
		map.put("user_pw", pw);
		return dao.login(map);
	}
	
	public String loginResult(MemberDTO dto, String type, HttpSession session) throws Exception{  //로그인결과 feat.조용진
		if("N".equals(dto.getUser_blacklist()) && "N".equals(dto.getUser_delete())) {
			dto.setUser_pw(null);
			session.setAttribute("loginType", type);
			session.setAttribute("loginSession", dto);
			
			loginLogSuccess(dto.getUser_email());
			return "general";
			
		}else if("Y".equals(dto.getUser_blacklist())){
			return "blackList";
			
		}else if("Y".equals(dto.getUser_delete())){
			return "withdrawal";
			
		}else {
			return "error";
		}
	}
	
	
	public MemberDTO socialLogin(String id) throws Exception{  //소셜 로그인 feat.조용진
		return dao.socialLogin(id);
	}
	
	public Login_TypeDTO loginType(String user_email) throws Exception{  //로그인 타입 feat.조용진
		return dao.loginType(user_email);
	}
	
	public void loginLogSuccess(String user_email) throws Exception{ // 로그인 성공로그  feat.조용진
		dao.loginLogSuccess(user_email); 
	}
	
	public void loginLogFailed(String user_email) throws Exception{ // 로그인 실패로그  feat.조용진
		dao.loginLogFailed(user_email);
	}
	
	public String findId(String user_name, String user_phone) throws Exception{ //아이디 찾기 시 아이디 존재 여부  feat.조용진
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_name", user_name);
		map.put("user_phone", user_phone);
		String result = dao.findId(map);
		
		if(result != null) {
			return result;
		}else {
			return "nonmem";
		}
	}
	
	public boolean findPw(String user_name, String user_email) throws Exception{  // 비밀번호 찾기 시 아이디 존재여부 feat.조용진
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_name", user_name);
		map.put("user_email", user_email);
		int result = dao.findPw(map);
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public void updatePw(String user_email, String user_pw) throws Exception{ // 로그인 성공로그  feat.조용진
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_email", user_email);
		map.put("user_pw", user_pw);
		dao.updatePw(map); 
	}
	
}	
