package com.kiri.dao;

import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_CalendarDTO;

@Repository
public class GroupCalendarDAO {
	@Autowired
	private BasicDataSource bds;
	
	@Autowired
	private SqlSession session;
	
	// 일정 삽입
	public void insert(Group_CalendarDTO dto) {
		int rs = session.insert("calMapper.calInsert", dto);

	}
	
	// 일정 전체 조회
	public List<Group_CalendarDTO> select(int seq_group) throws Exception{
		List<Group_CalendarDTO> list = session.selectList("calMapper.calSelect",seq_group);
		return list;
	}

	// 일정 상세 조회
	public List<Group_CalendarDTO> selectDetail(int seq_group_cal) {
		List<Group_CalendarDTO> list = session.selectList("calMapper.calSelectDetail",seq_group_cal);
		return list;
	}

	// 일정 삭제
	public int calDelete(int seq_group_cal) {
		return session.delete("calMapper.calDelete", seq_group_cal);
	}

	// 일정 옮기기
	public int calMove(Group_CalendarDTO dto) {
		return session.update("calMapper.calMove", dto);
	}
	
	// 이벤트 옮길 때 해당 일정의 끝 날짜 구하기 
	public List<Group_CalendarDTO> findEndByGroupSeq(int seq_group_cal) {
		return session.selectList("calMapper.findEndByGroupSeq", seq_group_cal);
	}

	// 일정 수정 
	public int calModify(Group_CalendarDTO dto) {
		return session.update("calMapper.calModify", dto);
	}
}
