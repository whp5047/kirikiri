package com.kiri.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.MessageDTO;
import com.kiri.dto.ReportDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.service.MessageService;
import com.kiri.service.ReportService;
import com.kiri.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private HttpSession session;

	@Autowired
	private UserService user_service;

	@Autowired
	private MessageService message_service;
	
	@Autowired
	private ReportService report_service;
	
	// 모든 그룹 리스트 보여주기
	@RequestMapping(value = "/toViewAllGroupList")
	public String toUserViewList(Model model) throws Exception {
		List<Tbl_GroupDTO> selectAllList = user_service.selectAllGroup();
		model.addAttribute("selectAllList", selectAllList);
		return "/user/viewAllGroupList";
	}

	// 카테고리별 지역별 그룹 리스트 보여주기
	@RequestMapping(value = "/toUserSelectedGroupList")
	public String userViewList(Tbl_GroupDTO tbl_group_dto, Model model) throws Exception {
		if(tbl_group_dto.getGroup_category() != null) {
			List<Tbl_GroupDTO> groupList = user_service.groupList(tbl_group_dto); 
			model.addAttribute("groupList",groupList); 
			return "/user/categorySelected";
		}else if(tbl_group_dto.getGroup_site() != null) {
			List<Tbl_GroupDTO> groupList = user_service.groupList(tbl_group_dto); 
			model.addAttribute("groupList",groupList); 
			return "/user/siteSelected";
		}
		return "";
	}
	
	   // 쪽지 보내기
	   @ResponseBody
	   @RequestMapping(value = "/insertMessage")
	   public String sendMessage(MessageDTO MessageDTO) throws Exception {
	      String user_send = ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname(); // 세션에서 받아온 닉네임
		  MessageDTO.setUser_send(user_send);
		  String rs = message_service.sendMessage(MessageDTO);
	      return rs;
	   }

	   // 내가 받은 쪽지 보기
	   @RequestMapping(value = "/receiveMsg")
	   @ResponseBody
	   public List<MessageDTO> selectReMessage(MessageDTO MessageDTO, Model model) throws Exception {
	      List<MessageDTO> rmsgList = message_service.selectReMessage(MessageDTO.getUser_receive());
	      return rmsgList;
	   }

		// 내가 보낸 쪽지 보기
		@RequestMapping(value = "/sendMsg")
		@ResponseBody
		public List<MessageDTO> selectSendMessage(MessageDTO MessageDTO, Model model) throws Exception {
			List<MessageDTO> smsgList = message_service.selectSendMessage(MessageDTO.getUser_send());
			return smsgList;
		}

		// 쪽지 삭제
		@RequestMapping(value = "/deleteMsg")
		@ResponseBody
		public String deleteMessage(@RequestBody Map<String, Object> param) throws Exception {
			List<String> message = new ObjectMapper().readValue(param.get("message").toString(), List.class);
			message_service.deleteMessage(message);
			return "";
		}
		
		// 신고하기
		@ResponseBody
		@RequestMapping(value = "/insertreport")
		public String insertReport(ReportDTO ReportDTO) throws Exception {
			String rs = null;
			int selectRs =  report_service.selectReport(ReportDTO);
			System.out.println(selectRs);
			if(selectRs > 0) {
				rs = "noMore";				
			}else {
				rs = report_service.insertReport(ReportDTO);
			}
			return rs;
		}	

}