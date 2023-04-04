package com.sweethome.sweet.message.service;

import java.util.List;
import java.util.Map;

import com.sweethome.sweet.message.vo.MessageVO;

public interface MessageService {
	//쪽지목록
	public List<MessageVO> selectAllMessageList(String member_id) throws Exception; 
	//쪽지쓰기
	public void insertMessage(MessageVO messageVO) throws Exception;
	//상세보기 추가
	public MessageVO noteRead(int no) throws Exception;
	//쪽지 삭제 추가
	public void deleteNote(int no)throws Exception;
}
