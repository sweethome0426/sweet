package com.sweethome.sweet.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.member.vo.MemberVO;

public interface UserService {
	public MemberVO userDetailInfo(String member_id) throws Exception;
	public void memberDelete(MemberVO memberVO) throws Exception;
	//수정 회원정보수정
	public void updateUser(MemberVO memberVO) throws Exception;

}
