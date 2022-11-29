package com.kiri.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kiri.dto.BestGroupDTO;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.service.HomeService;
import com.kiri.utills.SecurityInfo;

@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;

	@Autowired
	private HomeService home_service;

	
	@RequestMapping(value = "/")
	public String main(Model model) throws Exception {
		session.setAttribute("kakaoLogout", "https://kauth.kakao.com/oauth/logout?client_id=" + SecurityInfo.kakaoId 
		+"&logout_redirect_uri=" + "http://192.168.20.21/login/toLogout");
		
		List<Tbl_GroupDTO> selectAllList = home_service.selectAllGroup();
		List<Tbl_GroupDTO> selectNewList = home_service.selectNewGroup();
		List<BestGroupDTO> selectBestList = home_service.selectBestGroup();
		model.addAttribute("selectAllList", selectAllList);
		model.addAttribute("selectNewList", selectNewList);
		model.addAttribute("selectBestList", selectBestList);
		//게시판 두개
	      List<BoardDTO> getBestBoard = home_service.getBestBoard();
	      int seq_board;
	      List<String> sys_name = new ArrayList<>();
	      if(getBestBoard.size()==0) {

	      }else if(getBestBoard.size()==1) {
	         for(int i=0; i<1; i++) {
	            seq_board = getBestBoard.get(i).getSeq_board();
	            sys_name.add(home_service.getSysname(seq_board));
	            
	         }
	         model.addAttribute("sysList", sys_name);
	         model.addAttribute("boardList", getBestBoard);
	      }else if(getBestBoard.size()>=2){
	         for(int i=0; i<2; i++) {
	            seq_board = getBestBoard.get(i).getSeq_board();
	            sys_name.add(home_service.getSysname(seq_board));
	            
	         }
	         model.addAttribute("sysList", sys_name);
	         model.addAttribute("boardList", getBestBoard);
	      }
		
		return "mainPage";
	}
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
	
	@RequestMapping(value = "/privacy")
	public String privacy() {
		return "privacy";
	}
	
}
