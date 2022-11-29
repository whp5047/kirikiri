package com.kiri.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.reportDAO;
import com.kiri.dto.ReportDTO;

@Service
public class ReportService {
   
   @Autowired
   private reportDAO ReportDAO;
   
   // 신고하기
   public String insertReport(ReportDTO ReportDTO) throws Exception{
      return ReportDAO.insertReport(ReportDTO);
   }
   // 신고 중복검사 
public int selectReport(ReportDTO reportDTO) {
	return ReportDAO.selectReport(reportDTO);
}

}
