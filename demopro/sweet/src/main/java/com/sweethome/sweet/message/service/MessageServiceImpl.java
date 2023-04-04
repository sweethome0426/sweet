package com.sweethome.sweet.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sweethome.sweet.message.vo.MessageVO;
import com.sweethome.sweet.message.dao.MessageDAO;

@Service("messageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageDAO messageDAO;
	
	//쪽지 목록 보기
	@Override
	public List<MessageVO>selectAllMessageList(String member_id)throws Exception {
		return messageDAO.selectAllMessageList(member_id);
	}
	
	//쪽지 작성

	@Override
	public void insertMessage(MessageVO messageVO)throws Exception {
		messageDAO.insertMessage(messageVO);
	}
	
	//상세보기 추가
    @Override
    public MessageVO noteRead(int no) throws Exception {
        return messageDAO.noteRead(no);
    }
    
    //쪽지 삭제
    @Override
    public void deleteNote(int no)throws Exception {
    	messageDAO.noteDelete(no);
    }
}
