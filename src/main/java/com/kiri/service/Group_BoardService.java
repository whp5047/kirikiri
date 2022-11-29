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
import com.kiri.dao.Group_BoardDAO;
import com.kiri.dao.Group_Board_CommentDAO;
import com.kiri.dao.Group_Board_FileDAO;
import com.kiri.dao.Group_Board_LikeDAO;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.Board_FileDTO;
import com.kiri.dto.Group_BoardDTO;
import com.kiri.dto.Group_Board_FileDTO;
import com.kiri.utills.Criteria;

@Service
public class Group_BoardService {
	@Autowired
	private Group_BoardDAO boardDAO;
	@Autowired
	private Group_Board_FileDAO fileDAO;
	@Autowired
	private Group_Board_CommentDAO commentDAO;
	@Autowired
	private Group_Board_LikeDAO likeDAO;

	// 게시글 상세 조회
	public Map<String, Object> getDetail(int seq_group_board) throws Exception {
		// 다른 타입의 데이터를 반환하기 위해 map을 이용
		Map<String, Object> map = new HashMap<>();
		map.put("boardDTO", boardDAO.selectOne(seq_group_board)); // 게시글 데이터 가져오기
		map.put("commentList", commentDAO.selectAll(seq_group_board)); // 댓글 데이터 가져오기
		map.put("commentCnt", commentDAO.commentCnt(seq_group_board)); // 댓글 개수
		return map;
	}
	
	// 모임장 아이디 얻어오기
	public String getAccess(int seq_group) throws Exception{
		return boardDAO.getAccess(seq_group);
	}
	
	// 댓글 프로필 조회
//	public String getProfileImg(String user_email) throws Exception{
//		return commentDAO.getProfileImgG(user_email);
//	}

	// 조회수 + 1
	public void viewCntUp(int seq_group_board) throws Exception {
		boardDAO.updateView_count(seq_group_board);
	}

	// 좋아요 정보 가져오기
	public Map<String, Object> like(int seq_group_board, String user_email) throws Exception {
		// 좋아요 여부
		Map<String, Object> map = new HashMap<>();
		map.put("likeCheck", likeDAO.likeCheck(seq_group_board, user_email));
		map.put("likeHit", boardDAO.selectLike(seq_group_board));
		return map;
	}

	// 게시글 작성
	public void insert(Group_BoardDTO dto, List<String> fileList) throws Exception {
		int seq_group_board = boardDAO.selectSeq();
		dto.setSeq_group_board(seq_group_board);
		// 얘는... seq_group 안받아와도 돼나?
		int seq_group = dto.getSeq_group();

		boardDAO.write(dto);
		// file db에 저장
		for (String file : fileList) {
			if (!file.isEmpty()) {
				fileDAO.uploadFile(new Group_Board_FileDTO(0, seq_group_board, seq_group, file));
			}
		}
	}

	// summernote 이미지 업로드
	public JsonObject uploadSummernoteImg(MultipartFile file, String realPath) {
		JsonObject jsonObject = new JsonObject();
		// 서버 root 에 boardFile 폴더 없으면 폴더 먼저 생성
		File realPathFile = new File(realPath);
		if (!realPathFile.exists())
			realPathFile.mkdir();

		String ori_name = file.getOriginalFilename();
		String saveName = UUID.randomUUID() + "_" + ori_name;
		File targetFile = new File(realPath + File.separator + saveName);


		try {
			System.out.println("이미지 저장 성공");
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			// contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("url", "/groupBoardFile/" + saveName);
			jsonObject.addProperty("responseCode", "success");
		} catch (Exception e) {

			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jsonObject;
	}

	// 게시글 수정
	public void modify(Group_BoardDTO dto, List<String> fileList) throws Exception {
		int seq_group_board = dto.getSeq_group_board();
		// seq_group 이걸 여기서 받아올수있나도...생각해야함...
		int seq_group = dto.getSeq_group();
		boardDAO.modify(dto);

		for (String file : fileList) {
			if (!file.isEmpty()) {
				fileDAO.uploadFile(new Group_Board_FileDTO(0, seq_group_board, seq_group, file));
			}
		}
	}

	// 첨부 파일 삭제
	public void delFile(String path, String src) throws Exception {

		if (src.length() != 0) {
			File file = new File(path + File.separator + src);

			if (file.exists()) {
				file.delete();
				fileDAO.delete(src);
			}
		}
	}

	// 게시글 삭제
	public void delete(int seq_group_board) throws Exception {
		boardDAO.delete(seq_group_board);
	}

	// 게시판 목록(페이징)
	public List<Group_BoardDTO> getListPaging(Criteria cri) throws Exception {
		return boardDAO.getListPaging(cri);
	}

	// 게시글 총 개수
	public int getTotal(Criteria cri) throws Exception {
		return boardDAO.getTotal(cri);
	}
	
	// 공지 3개 얻어오기
	public List<Group_BoardDTO> getNotice(int seq_group) throws Exception{
		return boardDAO.getNotice(seq_group);
	}
}
