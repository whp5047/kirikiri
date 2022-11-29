package com.kiri.dao;

import java.util.List;

import java.util.Map;
import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_ApplyDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.SiteDTO;
import com.kiri.dto.TableJoinDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.dto.WishListDTO;

@Repository
public class Tbl_GroupDAO {

   @Autowired
   private BasicDataSource bds;

   @Autowired
   private SqlSession session;

   ///////////////////////////////////////////////////////////////////////////////
   // 김형석

   // 모임 가입신청 목록 불러오기
   public List<MemberDTO> selectApply(int seq_group) throws Exception {
      return session.selectList("tblGroupMapper.selectApply", seq_group);
   }

   // 모임 인원수 불러오기
   public int applyCount(int seq_group) throws Exception {
      return session.selectOne("tblGroupMapper.applyCount", seq_group);
   }

   // 가입한 모임의 멤버수 가져오기
   public int groupCount(int seq_group) throws Exception {
      return session.selectOne("tblGroupMapper.groupCount", seq_group);
   }

   // 모임 가입신청 목록 불러오기2
   public List<Group_ApplyDTO> selectApplyByEmail(Map<String, Object> param) throws Exception {
      return session.selectList("tblGroupMapper.selectApplyByEmail", param);
   }

   // 모임 가입 승인하기
   public void completeApply(Group_MemberDTO Group_MemberDTO) throws Exception {
      session.insert("tblGroupMapper.completeApply", Group_MemberDTO);
   }

   // 모임 가입 거절하기
   public void denyApply(Map<String, Object> param) throws Exception {
      session.delete("tblGroupMapper.denyApply", param);
   }

   // 해당 그룹 맴버 조회
   public List<MemberDTO> selectGroupAccess(int seq_group) {
      return session.selectList("tblGroupMapper.selectGroupAccess", seq_group);
   }

   // 모임장 위임
   public int groupAccess(Group_MemberDTO Group_MemberDTO) throws Exception {
      return session.update("tblGroupMapper.groupAccess",Group_MemberDTO);
   }

   // 그룹 멤버 강퇴
   public void groupMemberDelete(Map<String, Object> param) throws Exception {
      session.delete("tblGroupMapper.groupMemberDelete", param);
   }

   // 모임 해산하기(tbl_group)
   public int groupDelete(int seq_group) throws Exception {
      return session.delete("tblGroupMapper.groupDelete", seq_group);
   }
   
   

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   // 김영완
   // 그룹 생성
   public void createGroup(Tbl_GroupDTO dto) throws Exception {
      int rs = session.insert("tblGroupMapper.createGroup", dto);
   }


   // 그룹 생성시 group_member에 호스트로 insert
   public void insertGroupHost(Group_MemberDTO group_member_dto) throws Exception {
      int rs = session.insert("tblGroupMapper.insertGroupHost", group_member_dto);
   }

   // 그룹 디테일 조회
   public Tbl_GroupDTO selectGroupDetail(int seq_group) throws Exception {
      Tbl_GroupDTO tbl_group_dto = session.selectOne("tblGroupMapper.selectGroupDetail", seq_group);
      return tbl_group_dto;
   }

   // 그룹 수정
   public void modifyGroup(Tbl_GroupDTO tbl_group_dto) throws Exception {
      session.update("tblGroupMapper.updateGroup", tbl_group_dto);
   }

   // 해당 그룹 맴버 조회
   public List<Group_MemberDTO> selectGroupMember(int seq_group) throws Exception {
      return session.selectList("tblGroupMapper.selectGroupMember", seq_group);
   }

   // 해당 그룹 맴버 탈퇴
   public int quitGroupMember(Group_MemberDTO group_member_dto) throws Exception {
      return session.delete("tblGroupMapper.quitGroupMember", group_member_dto);
   }

   // 그룹 가입 신청 맴버 조회
   public List<Group_ApplyDTO> selectApplyList(int seq_group) throws Exception {
      return session.selectList("tblGroupMapper.selectApplyList", seq_group);
   }

   // 그룹 가입 신청
   public int applyGroupMember(Group_ApplyDTO group_apply_dto) throws Exception {
      return session.insert("tblGroupMapper.applyGroupMember", group_apply_dto);
   }

   // 해당 그룹 찜 추가
   public int insertWishList(WishListDTO wish_list_dto) throws Exception {
      return session.insert("tblGroupMapper.insertWishList", wish_list_dto);

   }

   // 해당 그룹 찜 명단
   public List<WishListDTO> selectWishList(int seq_group) throws Exception {
      return session.selectList("tblGroupMapper.selectWishList", seq_group);
   }

   // 해당 그룹 찜 삭제
   public int deletetWishList(WishListDTO wish_list_dto) throws Exception {
      return session.delete("tblGroupMapper.deletetWishList", wish_list_dto);
   }

   // 해당 그룹 맴버 프로필 조회
   public List<MemberDTO> selectMemberProfile(String user_email) {
	 return session.selectList("tblGroupMapper.selectMemberProfile", user_email);
   }

	// 해당 그룹 맴버 주소 조회
	public List<SiteDTO> selectMemberSite(String user_email) {
		return session.selectList("tblGroupMapper.selectMemberSite", user_email);
	}

	// 해당 아이디 가입된 그룹 갯수 출력
	public int selectGroupCntByEmail(String loginSession_id) {
		int rs = session.selectOne("tblGroupMapper.selectGroupCntByEmail",loginSession_id);
		return rs;
	}

	
////////// 호준

   // 가입한 모임 정보
	public List<Map<String, Object>> selectGroupList(String user_email) throws Exception {
		return session.selectList("myPageMapper.selectGroupList", user_email);
	}
	
	// 이메일 배열 개수
	public int selectEmail(String user_email) {
		int rs = session.selectOne("tblGroupMapper.selectEmail",user_email);
		return rs;
	}

}
