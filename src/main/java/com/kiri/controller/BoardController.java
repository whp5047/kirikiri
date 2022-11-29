package com.kiri.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.Board_CommentDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.service.BoardService;
import com.kiri.utills.Criteria;
import com.kiri.utills.PageMakerDTO;

@RequestMapping("/board")
@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private HttpSession session;
	
	/* 자유 게시판 */
	@RequestMapping(value = "/toBoard") // board 페이지 요청
	public String toBoard(Model model, Criteria cri) throws Exception {
		
		model.addAttribute("list", service.getListPaging(cri));
		model.addAttribute("noticeList", service.getNotice());
		int total = service.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		
		return "board/board";
	}
	
	@RequestMapping(value = "/toWrite") // write 페이지 요청
	public String toWrite() {
		return "board/write";
	}
	
	@RequestMapping(value = "/write") // 게시글 작성 요청
	public String write(BoardDTO dto, @RequestParam(value="imgs[]", required=false) String[] imgs) throws Exception{		
		String user_email = ((MemberDTO)session.getAttribute("loginSession")).getUser_email();
		String user_nickname = ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname();
		dto.setUser_email(user_email);
		dto.setUser_nickname(user_nickname);
		
		List<String> fileList = new ArrayList<>();
		if(imgs != null) {
			for(String image : imgs) {
				fileList.add(image);
			}
		}
		service.insert(dto, fileList);
		
		return "redirect:/board/toBoard";
	}
	
	@RequestMapping(value = "/toNoticeWrite") // 공지 쓰기 페이지 요청
	public String toNoticeWrite() {
		return "admin/noticeWrite";
	}

	@ResponseBody
	@RequestMapping(value = "/noticeWrite") // 공지 쓰기
	public String noticeWrite(BoardDTO dto, @RequestParam(value = "imgs[]", required = false) String[] imgs)
			throws Exception {
		String user_email = ((MemberDTO) session.getAttribute("loginSession")).getUser_email();
		String user_nickname = ((MemberDTO) session.getAttribute("loginSession")).getUser_nickname();
		dto.setUser_email(user_email);
		dto.setUser_nickname(user_nickname);

		List<String> fileList = new ArrayList<>();
		if (imgs != null) {
			for (String image : imgs) {
				fileList.add(image);
			}
		}
		service.insert(dto, fileList);

		return "success";
	}
	
	@RequestMapping(value = "/summernoteImg", produces = "application/json") // summernote 이미지 업로드
	@ResponseBody
	public String uploadSummernoteImg(@RequestParam("file") MultipartFile file) throws Exception{
		String realPath = session.getServletContext().getRealPath("boardFile");

		JsonObject jsonObject = service.uploadSummernoteImg(file, realPath);
		
		String result = jsonObject.toString();
		return result;
	}
	
	@RequestMapping(value = "/toDetailView") // 게시글 상세페이지 요청
	public String toDetailView(int seq_board, HttpServletRequest request
			 , HttpServletResponse response,  Model model, Criteria cri) throws Exception{
		// 조회수
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("postView")) {
					oldCookie = cookie;
				}
			}
		}
		
		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + seq_board + "]")) {
				service.viewCntUp(seq_board);
				oldCookie.setValue(oldCookie.getValue() + "_[" + seq_board + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(oldCookie);
			}
		}else {
			service.viewCntUp(seq_board);
			Cookie newCookie = new Cookie("postView","[" + seq_board + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60 * 60 * 24);
			response.addCookie(newCookie);
		}
		
		// 게시글 정보 얻기
		Map<String, Object> map = service.getDetail(seq_board);
		model.addAttribute("detail", map);
		
		String user_email = null;
		if(session.getAttribute("loginSession") != null) {
			user_email = ((MemberDTO)session.getAttribute("loginSession")).getUser_email();	
		}
		// 좋아요 여부, 개수
		model.addAttribute("like", service.like(seq_board, user_email));
		
		// criteria 인스턴스 전달
		model.addAttribute("cri", cri);
		
		return "board/detailView";
	}
	
	
	@RequestMapping(value = "/toModify") // 수정 페이지 요청
	public String toModify(int seq_board, Model model, Criteria cri) throws Exception{
		Map<String, Object> map = service.getDetail(seq_board);
		model.addAttribute("modMap", map);
		model.addAttribute("cri", cri);
		return "board/modify";
	}
	
	@RequestMapping(value = "/modify") // 게시글 수정 요청
	public String modify(BoardDTO dto, @RequestParam(value="imgs[]", required=false) String[] imgs) throws Exception {
		String path = session.getServletContext().getRealPath("boardFile");
				
		List<String> fileList = new ArrayList<>();
		if(imgs != null) {
			for(String image : imgs) {
				fileList.add(image);
			}
		}
		service.modify(dto, fileList);
		
		return "redirect:/board/toDetailView?seq_board="+dto.getSeq_board();
	}
	
	@RequestMapping(value = "/delImg") // 이미지 삭제 요청
	@ResponseBody
	public String delImg(String src) throws Exception {
		String path = session.getServletContext().getRealPath("boardFile");
		service.delFile(path, src);
		return "success";
	}
	
	@RequestMapping(value = "/delete") // 게시글 삭제 요청
	public String delete(int seq_board) throws Exception{
		service.delete(seq_board);
		return "redirect:/board/toBoard";
	}
	
	@RequestMapping(value = "/")
	public String home() {
		return "mainPage";
	}
	
	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
}

