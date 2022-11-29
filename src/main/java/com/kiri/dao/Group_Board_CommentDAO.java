package com.kiri.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_Board_CommentDTO;

@Repository
public class Group_Board_CommentDAO {
	@Autowired
	private SqlSession session;
	
	// 댓글 목록
	public List<Group_Board_CommentDTO> selectAll(int seq_group_board) throws Exception{
		return session.selectList("commentMapper.selectAllG", seq_group_board);
	}
	
	// 댓글 프로필
//	public String getProfileImgG(String user_email) throws Exception{
//		return session.selectOne("commentMapper.getProfileImgG", user_email);
//	}
	
	// 댓글 등록
	public int write(Group_Board_CommentDTO dto) throws Exception{
		return session.insert("commentMapper.writeG", dto);
	}
	
	// 댓글 수정
	public int modify(Group_Board_CommentDTO dto) throws Exception{
		return session.update("commentMapper.modifyG", dto);
	}
	
	// 댓글 삭제
	public int delete(int seq_group_comment) throws Exception{
		return session.delete("commentMapper.deleteG", seq_group_comment);
	}
	
	// 댓글 개수
	public int commentCnt(int seq_group_board) throws Exception{
		return session.selectOne("commentMapper.commentCntG", seq_group_board);
	}
}
