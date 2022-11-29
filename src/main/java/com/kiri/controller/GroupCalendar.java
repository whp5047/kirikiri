package com.kiri.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kiri.dto.Group_CalendarDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.service.GroupCalendarService;

@RequestMapping("/cal")
@Controller
public class GroupCalendar {
	@Autowired
	private HttpSession session;

	@Autowired
	private GroupCalendarService service;

	// 캘린더 페이지로 이동
	@RequestMapping(value = "/toGroupCalendar")
	public String toGroupCalendar(int seq_group, Model model) {
		model.addAttribute("seq_group", seq_group);
		return "/group/groupCalendar";
	}

	// 일정 추가
	@ResponseBody
	@RequestMapping(value = "/calInsert")
	public String calInfo(Group_CalendarDTO dto) throws Exception {
		String user_email = ((MemberDTO)session.getAttribute("loginSession")).getUser_email(); // 현재 세션 값
		dto.setUser_email(user_email);
		service.insert(dto);
		return "redirect:/calMain";
	}

	// 일정 전체 데이터 조회 -> json으로 보내줘야한다
	@ResponseBody
	@RequestMapping(value = "/calList", produces = "application/json; charset=UTF-8")
	public String calList(Model model, int seq_group) throws Exception {
		List<Group_CalendarDTO> list = service.select(seq_group);
		// 00:00:00 삭제 후 다시 setter에 셋팅
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setStart(list.get(i).getStart().substring(0, 10));
		}
		// list를 json으로 변경
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonList = objectMapper.writeValueAsString(list);
		model.addAttribute("list", list);
		return jsonList;

	}

	// 일정 상세페이지
	@ResponseBody
	@RequestMapping(value = "/calDetail", produces = "application/json; charset=UTF-8")
	public List<Group_CalendarDTO> calDetail(@RequestParam("seq_group_cal") int seq_group_cal) throws Exception {
		List<Group_CalendarDTO> list = service.selectDetail(seq_group_cal);
		// 00:00:00 삭제 후 다시 setter에 셋팅
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setStart(list.get(i).getStart().substring(0, 10));
		}
		return list;
	}

	// 일정 삭제페이지
	@ResponseBody
	@RequestMapping(value = "/calDelete")
	public String calDelete(int seq_group_cal) throws Exception {

		int rs = service.calDelete(seq_group_cal);
		if (rs > 0) return "success";
		else return "fail";
	}

	// 일정 옮기기 calMove
	@ResponseBody
	@RequestMapping(value = "/calMove")
	public String calMove(Group_CalendarDTO dto, int modifyDays) throws Exception {
		SimpleDateFormat sdfYMDHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
		
		String findTime = null; 
		List<Group_CalendarDTO> list = service.findEndByGroupSeq(dto.getSeq_group_cal()); // 마지막 날짜 얻어오기 
		for(Group_CalendarDTO endTime : list) {
			findTime = endTime.getEnd();
		}
		findTime = findTime.substring(0, 10); // 마지막 날짜 00:00:00 자르기
	
		//String을 날짜 연산을 위해 Date 객체로 변경
		Date date = sdfYMD.parse(findTime); 
		
		//날짜 연산을 위한 Calendar객체 생성 후 date 대입
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		//마지막 날짜 + 추가된 날짜 
		cal.add(Calendar.DATE, modifyDays); 
		String endDate = sdfYMD.format(cal.getTime());
		dto.setEnd(endDate); // dto에 마지막 날짜 셋팅

		int rs = service.calMove(dto);
		if (rs > 0) return "success";
		else return "fail";
	
	}
	
	// 일정 수정
	@ResponseBody
	@RequestMapping(value = "/calModify")
	public int calModify(Group_CalendarDTO dto, String modifyTime) throws Exception {
		// 수정 시간 판단
		if(modifyTime.equals("00:00")) {
			dto.setGroup_time(dto.getGroup_time());
		}else {
			dto.setGroup_time(modifyTime);
		}
		// 일정 수정
		return service.calModify(dto);
	}

	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "error";
	}

}
