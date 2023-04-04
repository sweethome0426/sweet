package com.sweethome.sweet.message.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.message.vo.MessageVO;

public interface MessageDAO {
	
	//쪽지 목록
	public List<MessageVO>selectAllMessageList(String member_id) throws Exception;
	//쪽지 쓰기
	public void insertMessage(MessageVO messageVO) throws Exception;
	//추가
	public MessageVO noteRead(int no) throws Exception;
	//삭제
	public void noteDelete(int no) throws Exception;
}
