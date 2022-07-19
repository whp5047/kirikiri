package com.kiri.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.HobbyDTO;


@Repository
public class HobbyDAO {
	
	@Autowired
	private SqlSession session;
	
	// Hobby 테이블 정보 가져오기
	public List<HobbyDTO> selectHobbyList(String user_email) throws Exception{ 
		return session.selectList("myPageMapper.selectHobbyList",user_email);
	}
	
	// Hobby 테이블 insert
	public void insertHobby(Map<String,String> hobbyMap) throws Exception{
		session.insert("myPageMapper.insertHobby", hobbyMap);
	}
	
	// Hobby 테이블 delete
	public void deleteHobby(String user_email) throws Exception{
		session.delete("myPageMapper.deleteHobby",user_email);
	}
}
