package com.sweethome.sweet.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sweethome.sweet.admin.member.dao.AdminMemberDAO;
import com.sweethome.sweet.member.vo.MemberVO;



@Service("adminMemberService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = adminMemberDAO.selectAllMemberList();
		return membersList;
	}
	
	

	@Override
	public MemberVO modMember(String member_id) throws DataAccessException {
		MemberVO memberVO = new MemberVO();
		memberVO = adminMemberDAO.selectMemberById(member_id);
		return memberVO;
	}



	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return adminMemberDAO.insertMember(member);
	}

	@Override
	public int removeMember(String id) throws DataAccessException {
		return adminMemberDAO.deleteMember(id);
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return adminMemberDAO.loginById(memberVO);
	}



	@Override
	public int updateMember(MemberVO member)throws DataAccessException{
		return adminMemberDAO.updateMember(member);
	}
	

}
