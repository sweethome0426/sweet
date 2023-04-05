package com.sweethome.sweet.message.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.sweethome.sweet.message.vo.MessageVO;

@Repository("messageDAO")
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//쪽지 목록
	@Override
	public List<MessageVO>selectAllMessageList(String member_id) throws Exception {
		return sqlSession.selectList("mapper.message.selectAllMessageList",member_id);
	}
	//쪽지 쓰기
	@Override
	public void insertMessage(MessageVO messageVO) throws Exception {
		sqlSession.insert("mapper.message.insertMessage",messageVO);
	}
	//쪽지 상세보기
	@Override
	public MessageVO noteRead(int no) throws Exception {
		return sqlSession.selectOne("mapper.message.noteRead",no);
	}
	
	//쪽지 삭제 추가
	@Override
	public void noteDelete(int no)throws Exception {
		sqlSession.delete("mapper.message.noteDelete",no);
	}
}
