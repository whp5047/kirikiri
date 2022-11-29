package com.kiri.service;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kiri.dao.BoardDAO;
import com.kiri.dao.Board_CommentDAO;
import com.kiri.dao.Board_FileDAO;
import com.kiri.dao.LikeDAO;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.Board_CommentDTO;
import com.kiri.dto.Board_FileDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.utills.Criteria;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private Board_FileDAO fileDAO;
	@Autowired
	private Board_CommentDAO commentDAO;
	@Autowired
	private LikeDAO likeDAO;
	
//	// 게시글 전체 조회
//	public List<BoardDTO> selectAll() throws Exception{
//		return boardDAO.selectAll();
//	}
	
//	// 카테고리별 조회
//	public List<BoardDTO> selectCategory(String category) throws Exception{ 
//		return boardDAO.selectCategory(category);
//	}
	
	// 게시글 상세 조회
	public Map<String, Object> getDetail(int seq_board) throws Exception{
		// 다른 타입의 데이터를 반환하기 위해 map을 이용
		Map<String, Object> map = new HashMap<>();
		map.put("boardDTO", boardDAO.selectOne(seq_board)); // 게시글 데이터 가져오기
		map.put("commentList", commentDAO.selectAll(seq_board)); // 댓글 데이터 가져오기
		map.put("commentCnt", commentDAO.commentCnt(seq_board)); // 댓글 개수
		return map;
	}
	
	// 댓글 정보 가져오기
//	public List<Board_CommentDTO> getCommentList(int seq_board) throws Exception{
//		return commentDAO.selectAll(seq_board);
//	}
	
	// 댓글 프로필 조회
//	public List<String> getProfileImg(int seq_board) throws Exception{
//		
//		return commentDAO.getProfileImg(seq_board);
//		
//	}
	
	// 조회수 + 1
	public void viewCntUp(int seq_board) throws Exception{
		boardDAO.updateView_count(seq_board);
	}
	
	// 좋아요 정보 가져오기
	public Map<String, Object> like(int seq_board, String user_email) throws Exception{
		// 좋아요 여부
		Map<String, Object> map = new HashMap<>();
		if(user_email != null) {
			map.put("likeCheck", likeDAO.likeCheck(seq_board, user_email));
		}
		map.put("likeHit", boardDAO.selectLike(seq_board));
		return map; 
	}
	
	// 게시글 작성
	public void insert(BoardDTO dto, List<String> fileList) throws Exception{
		int seq_board = boardDAO.selectSeq();
		dto.setSeq_board(seq_board);
		
		boardDAO.write(dto);
		// file db에 저장
		for(String file : fileList) {
			if(!file.isEmpty()) {
				fileDAO.uploadFile(new Board_FileDTO(0, seq_board, file));
			}
		}
	}
	
	// summernote 이미지 업로드
	public JsonObject uploadSummernoteImg(MultipartFile file, String realPath) {
		JsonObject jsonObject = new JsonObject();
		// 서버 root 에 boardFile 폴더 없으면 폴더 먼저 생성
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		
		String ori_name = file.getOriginalFilename();
		String saveName = UUID.randomUUID() + "_" + ori_name;
		File targetFile = new File(realPath + File.separator + saveName);
		System.out.println(targetFile.toString());
		
		try {
			System.out.println("이미지 저장 성공");
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			// contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("url", "/boardFile/" + saveName);
			jsonObject.addProperty("responseCode", "success");
			//jsonObject.addProperty("saveName", saveName);
		}catch(Exception e) {
			System.out.println("이미지 저장 실패");
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	// 게시글 수정
	public void modify(BoardDTO dto, List<String> fileList) throws Exception{
		int seq_board = dto.getSeq_board();
		boardDAO.modify(dto);
		
		for(String file : fileList) {
			if(!file.isEmpty()) {
				fileDAO.uploadFile(new Board_FileDTO(0, seq_board, file));
			}
		}
	}
	
	// 첨부 파일 삭제
	public void delFile(String path, String src) throws Exception {
		
		if(src.length() != 0) {
			File file = new File(path + File.separator + src);
			System.out.println(file.toString());
			if(file.exists()) {
				file.delete();
				fileDAO.delete(src);
			}
		}
	}
	
	// 게시글 삭제
	public void delete(int seq_board) throws Exception{
		boardDAO.delete(seq_board);
	}
	
//	// 게시글 검색
//	public List<BoardDTO> search(String category, String keyword, String option) throws Exception{
//		return boardDAO.search(category, keyword, option);
//	}
	
	// 페이징
//	public int countBoard() {
//		return boardDAO.countBoard();
//	}
//	
//	public List<BoardDTO> selectBoard(PageVO vo){
//		return boardDAO.selectBoard(vo);
//	}
	
	// 게시판 목록(페이징)
	public List<BoardDTO> getListPaging(Criteria cri) throws Exception{
		return boardDAO.getListPaging(cri);
	}
	
	// 게시글 총 개수
	public int getTotal(Criteria cri) throws Exception{
		return boardDAO.getTotal(cri);
	}
	
	// 공지사항 상단 3개 정렬
	public List<BoardDTO> getNotice() throws Exception{
		return boardDAO.getNotice();
	}
}
