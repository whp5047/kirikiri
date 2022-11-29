package com.kiri.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Board_CommentDTO;

@Repository
public class Board_CommentDAO {
	@Autowired
	private SqlSession session;
	
	// 댓글 목록
	public List<Board_CommentDTO> selectAll(int seq_board) throws Exception{
		return session.selectList("commentMapper.selectAll", seq_board);
	}
	
	// 댓글 프로필
//	public List<String> getProfileImg(int seq_board) throws Exception{
//		return session.selectList("commentMapper.getProfileImg", seq_board);
//	}
	
	// 댓글 등록
	public int write(Board_CommentDTO dto) throws Exception{
		return session.insert("commentMapper.write", dto);
	}
	
	// 댓글 수정
	public int modify(Board_CommentDTO dto) throws Exception{
		return session.update("commentMapper.modify", dto);
	}
	
	// 댓글 삭제
	public int delete(int seq_comment) throws Exception{
		return session.delete("commentMapper.delete", seq_comment);
	}
	
	// 댓글 개수
	public int commentCnt(int seq_board) throws Exception{
		return session.selectOne("commentMapper.commentCnt", seq_board);
	}
}
