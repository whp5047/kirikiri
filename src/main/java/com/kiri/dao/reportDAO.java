package com.kiri.dao;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.ReportDTO;

@Repository
public class reportDAO {
   @Autowired 
   private BasicDataSource bds;
      
   @Autowired
   private SqlSession session;
   
   // 신고하기
   public String insertReport(ReportDTO ReportDTO) throws Exception{
      int rs = session.insert("reportMapper.insertReport", ReportDTO);
      if(rs > 0) return "success";
      else return "fail";
   }

// 신고 중복검사 
public int selectReport(ReportDTO reportDTO) {
	return session.selectOne("reportMapper.selectReport", reportDTO);
}
      
      
}
