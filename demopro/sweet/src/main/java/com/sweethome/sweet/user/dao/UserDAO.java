package com.sweethome.sweet.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.member.vo.MemberVO;

public interface UserDAO {
	
	//회원조회
	public MemberVO selectMyDetailInfo(String member_id)throws Exception;
	//회원탈퇴
	public void memberDelete(MemberVO memberVO)throws Exception;
	//회원정보수정
	public void updateUser(MemberVO memberVO) throws Exception;
}
